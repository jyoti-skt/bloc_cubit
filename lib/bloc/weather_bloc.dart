import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/weather.dart';
import '../model/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepository _weatherRepository;
  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {

    on<WeatherEvent>((event, emit) async {

      if(event is GetWeather){
        try{
          emit(WeatherLoading());
          final weather= await _weatherRepository.fetchWeather(event.cityName);
          emit(WeatherLoaded(weather));
        } on NetworkException{
          emit(WeatherError("Could not fetch weather, is the device online ?"));
        }
      }
      // TODO: implement event handler
    });
  }
}
