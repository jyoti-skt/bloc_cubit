

import 'dart:math';

import 'package:bloc_cubit/model/weather.dart';

abstract class WeatherRepository {
  ///Throws Exception
  ///
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  Future<Weather> fetchWeather(String cityName){


    return Future.delayed(Duration(seconds: 1),
        (){
      final random= Random();
      if(random.nextBool()){
        throw NetworkException();
      }

      return Weather(cityName: cityName, tempratureCelsius: 20 + random.nextDouble() +random.nextDouble());
        });
  }
}

class NetworkException implements Exception {

}