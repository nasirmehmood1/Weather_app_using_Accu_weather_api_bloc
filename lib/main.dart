import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/AddressConversionBloc/address_conversion_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/TodayWeatherDataBloc/today_weather_data_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/UserCurrentLocationBloc/user_current_location_bloc.dart';
import 'package:flutter_weather_app/Views/Screens/home_page_design.dart';

// http://api.weatherapi.com/v1/current.json?key=f39a984e46cc413cb6244908241704&q=29.396537398736804,%2071.74772454863341

// Used packages :

/**
 * 
 * Http : Used to intereact with the api's .
 * Bloc : The global state management used .
 * Geo locator : Used to get the user location .
 * Geo Coding : Used to convert the lattitude and ongitude values in human readable adress or vice versa .
 * 
 */

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodayWeatherDataBloc(),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => UserCurrentLocationBloc(),
          ),
          BlocProvider(
            create: (context) => AddressConversionBloc(),
          ),
        ],
        child: const MyHomePage(),
      ),
      // home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {
            DateTime dateTime = DateTime(2024, 5, 9, 23, 10, 5);
            print("Currrent time is .... ${DateTime.now().hour}");
            print("................. ${dateTime}");
          },
          child: Text("data")),
    );
  }
}
