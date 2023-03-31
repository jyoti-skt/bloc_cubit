part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  WeatherInitial();
}


class WeatherLoading extends WeatherState {
  WeatherLoading();
}


class WeatherLoaded extends WeatherState {

  final Weather weather;

  WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

}


class WeatherError extends WeatherState{
  final String message ;
  WeatherError(this.message);



  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }
}