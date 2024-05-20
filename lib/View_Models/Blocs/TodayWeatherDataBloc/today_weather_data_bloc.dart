import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:flutter_weather_app/View_Models/ApiService/adress_based_today_weather_api_service.dart';
import 'package:meta/meta.dart';

part 'today_weather_data_event.dart';
part 'today_weather_data_state.dart';

class TodayWeatherDataBloc
    extends Bloc<TodayWeatherDataEvent, TodayWeatherDataState> {
  AddressBasedTodayWeatherApiService addressBasedTodayWeatherApiService =
      AddressBasedTodayWeatherApiService();
  TodayWeatherDataBloc() : super(TodayWeatherDataInitialState()) {
    on<FetchTodayWeatherDataFromCurrentOfGivenLocationEvent>(
        _mapFetchTodayWeatherDataFromCurrentOfGivenLocationEventToStates);
  }

  FutureOr<void>
      _mapFetchTodayWeatherDataFromCurrentOfGivenLocationEventToStates(
          FetchTodayWeatherDataFromCurrentOfGivenLocationEvent event,
          Emitter<TodayWeatherDataState> emit) async {
    emit(TodayWeatherDataLoadingState());

    try {
      CurrentWeatherDataModel currentWeatherData =
          await addressBasedTodayWeatherApiService
              .fetchCurrentWeatherDataFromGivenLatitudeAndLongitude(
                  latitude: event.latLngRecordData.$1,
                  longitude: event.latLngRecordData.$2);

      emit(TodayWeatherDataLoadedState(todayWeatherData: currentWeatherData));
    } catch (e) {
      TodayWeatherDataErrorState();
    }
  }
}
