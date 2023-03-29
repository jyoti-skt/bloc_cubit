import 'package:bloc_cubit/cubit/weather_cubit.dart';
import 'package:bloc_cubit/model/weather_repository.dart';
import 'package:bloc_cubit/weather_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(FakeWeatherRepository()),
        child: WeatherPage(),
      ),
    );
  }
}


class MyChangeNotifier extends ChangeNotifier {
  late int field1;
  late String field2;


  void changeState() {
    field2 = 'New Value';
    notifyListeners();
  }
}


class MyState {
  final int field1;
  final String field2;

  MyState(this.field1, this.field2);

}


class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyState(0, 'Initail value'));

  void changeState() {
    emit(MyState(0, 'New Value'));
  }
}