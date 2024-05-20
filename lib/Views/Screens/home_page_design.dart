import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/AddressConversionBloc/address_conversion_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/TodayWeatherDataBloc/today_weather_data_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/UserCurrentLocationBloc/user_current_location_bloc.dart';
import 'package:flutter_weather_app/Views/Widgets/loaded_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String userCity = "";
Color blueColor = const Color(0xff6DC5D1);
Color backgrounColor = const Color(0xffFDE49E);
Color backgrounColorSecond = const Color(0xffEEF7FF);

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context
        .read<UserCurrentLocationBloc>()
        .add(FetchUserCurrentLocationEvent(context: context));
  }

  // static const String appTitle = "Weather App";

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Container(
            width: width,
            height: height,
            color: backgrounColorSecond,
            // Top Container
            child:
                BlocBuilder<UserCurrentLocationBloc, UserCurrentLocationState>(
              builder: (context, state) {
                if (state is UserCurrentLocationLoadedState) {
                  context.read<AddressConversionBloc>().add(
                      FetchConvertedAddress(position: state.currentPosition));
                  (double, double) dataRecord = (
                    state.currentPosition.latitude,
                    state.currentPosition.longitude
                  );

                  context.read<TodayWeatherDataBloc>().add(
                      FetchTodayWeatherDataFromCurrentOfGivenLocationEvent(
                          latLngRecordData: (dataRecord)));
                  return LoadedWidget(
                    userCity: userCity,
                  );
                } else {
                  print("Errorrr Adresssssssss.... conversion");
                  return const SizedBox.shrink();
                }
              },
            )));
  }
}
