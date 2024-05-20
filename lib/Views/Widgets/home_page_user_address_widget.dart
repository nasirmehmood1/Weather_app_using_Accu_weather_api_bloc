import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Model/past_Weather_data_model.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:flutter_weather_app/View_Models/ApiService/address_based_past_weather_api_service.dart';
import 'package:flutter_weather_app/View_Models/ApiService/adress_based_today_weather_api_service.dart';
import 'package:flutter_weather_app/View_Models/Blocs/AddressConversionBloc/address_conversion_bloc.dart';
import 'package:flutter_weather_app/View_Models/Blocs/UserCurrentLocationBloc/user_current_location_bloc.dart';
import 'dart:developer' as developer;

class HomePageUserAddressWidget extends StatelessWidget {
  const HomePageUserAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCurrentLocationBloc, UserCurrentLocationState>(
      listener: (context, state) {
        if (state is UserCurrentLocationInitialState) {
          if (kDebugMode) {
            print("Initial ...");
          }
        } else if (state is UserCurrentLocationLoadingState) {
          if (kDebugMode) {
            print("Loading ...");
          }
        } else if (state is UserCurrentLocationErrorState) {
          if (kDebugMode) {
            print("Network Error ...");
          }
        } else if (state is UserCurrentLocationLoadedState) {
          if (kDebugMode) {
            print(
                "User locations : ${state.currentPosition.latitude} , ${state.currentPosition.longitude}");
          }
          context
              .read<AddressConversionBloc>()
              .add(FetchConvertedAddress(position: state.currentPosition));
        }
      },
      child: Center(
        child: BlocBuilder<AddressConversionBloc, AddressConversionState>(
          builder: (context, state) {
            if (state is AddressConversionInitialState) {
              return const Text(
                "Waiting ...",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Merienda"),
              );
            } else if (state is AddressConversionLoadingState) {
              return const Text(
                "Fetching ...",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.lime,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Merienda"),
              );
            } else if (state is AddressConversionErrorState) {
              return const Text(
                "Network Error ...",
                maxLines: 1,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.lime,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Merienda"),
              );
            } else {
              (state as AddressConversionLoadedState);

              return Text(
                "${state.placemarks[0].subAdministrativeArea} , ${state.placemarks[0].administrativeArea} , ${state.placemarks[0].country}",
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.cyan,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Merienda"),
              );
            }
          },
        ),
      ),
    );
  }
}

void printCurrentWeatherData(
    double latitudeValue, double longitudeValue) async {
  AddressBasedTodayWeatherApiService weatherApiService =
      AddressBasedTodayWeatherApiService();
  // var dataRecord = (latitudeValue, longitudeValue);
  CurrentWeatherDataModel weatherModelData = await weatherApiService
      .fetchCurrentWeatherDataFromGivenLatitudeAndLongitude(
          latitude: latitudeValue, longitude: longitudeValue);

  developer.log("Weather data is :  .......");
  developer.log(weatherModelData.toString());
}

// void printPastWeatherData(
//     double latitudeValue, double longitudeValue, DateTime dateTime) async {
//   AddressBasedPastWeatherApiService addressBasedPastWeatherApiService =
//       AddressBasedPastWeatherApiService();

//   // var dataRecord = (latitudeValue, longitudeValue);
//   PastWeatherDataModel weatherModelData =
//       await addressBasedPastWeatherApiService
//           .fetchPastWeatherDataFromGivenLongitudeLatitudeOfGivenDate(
//               latitude: latitudeValue,
//               longitude: longitudeValue,
//               day: dateTime.day,
//               month: dateTime.month,
//               year: dateTime.year);

//   developer.log("Weather data is :  .......");
//   developer.log(weatherModelData.toString());
// }
