import 'package:bloc_cubit/cubit/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        child:BlocConsumer<WeatherCubit,WeatherState>(
          listener: (context,state){
            if(state is WeatherError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context,state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            } else if (state is WeatherLoading)
              return buildLoading();
            else if(state is WeatherLoaded){
            return buildColumnWithData(state.weather);
            }else{
              return buildInitialInput();
            }
          }
        ),
      ),
    );
  }

  Widget buildInitialInput(){
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  Column buildColumnWithData(Weather weather){
    return Column(
      children: [
        Text("${weather.tempratureCelsius.toStringAsFixed(1)}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700),),
        Text(""),
        CityInputField(),
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a City",
          suffixIcon: Icon(Icons.search_rounded),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),

          )
        ),
      ),
    );

  }

  void submitCityName(BuildContext context, String cityName){
    // TODO get weather for city

    final weathercubit= BlocProvider.of<WeatherCubit>(context);
    weathercubit.getWeather(cityName);


  }
}
