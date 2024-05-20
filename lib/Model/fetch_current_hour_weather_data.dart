import 'package:flutter_weather_app/Model/weather_model.dart';

Hourly currentHourWeatherData(int hourNumber, List<Hourly> hourlyData) {
  switch (hourNumber) {
    case 0 || 1 || 2:
      return hourlyData[0];
    case 3 || 4 || 5:
      return hourlyData[1];

    case 6 || 7 || 8:
      return hourlyData[2];

    case 9 || 10 || 11:
      return hourlyData[3];

    case 12 || 13 || 14:
      return hourlyData[4];

    case 15 || 16 || 17:
      return hourlyData[5];

    case 18 || 19 || 20:
      return hourlyData[6];

    case 21 || 22 || 23:
      return hourlyData[7];

    default:
      return hourlyData[0];
  }
}
