part of 'today_weather_data_bloc.dart';

@immutable
sealed class TodayWeatherDataState {
  const TodayWeatherDataState();
}

final class TodayWeatherDataInitialState extends TodayWeatherDataState {}

final class TodayWeatherDataLoadingState extends TodayWeatherDataState {}

final class TodayWeatherDataLoadedState extends TodayWeatherDataState {
  final CurrentWeatherDataModel todayWeatherData;

  const TodayWeatherDataLoadedState({required this.todayWeatherData});
}

final class TodayWeatherDataErrorState extends TodayWeatherDataState {}
