part of 'today_weather_data_bloc.dart';

@immutable
sealed class TodayWeatherDataEvent {
  const TodayWeatherDataEvent();
}

class FetchTodayWeatherDataFromCurrentOfGivenLocationEvent
    extends TodayWeatherDataEvent {
  final (double latValue, double lngValue) latLngRecordData;

  const FetchTodayWeatherDataFromCurrentOfGivenLocationEvent(
      {required this.latLngRecordData});
}
