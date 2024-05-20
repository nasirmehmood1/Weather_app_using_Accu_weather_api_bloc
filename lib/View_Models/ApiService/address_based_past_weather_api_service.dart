// https://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=4a0719fa9e944d569d732502240805&q=29.396350450000014,71.7492265856952&date=2009-07-22&format=json

import 'package:flutter_weather_app/Model/past_Weather_data_model.dart';
import 'package:flutter_weather_app/View_Models/ApiService/api_service.dart';

class AddressBasedPastWeatherApiService extends ApiService {
  @override
  String get ApiUrl =>
      "premium/v1/past-weather.ashx?key=4a0719fa9e944d569d732502240805&q=";

// 29.396350450000014,71.7492265856952&date=2009-07-22&format=json
  Future<PastWeatherDataModel>
      fetchPastWeatherDataFromGivenLongitudeLatitudeOfGivenDate({
    required double latitude,
    required double longitude,
    required int day,
    required int month,
    required int year,
  }) async {
    String endPoint = "$latitude,$longitude&date=$year-$month-$day&format=json";

    var map = await fetch(endPoints: endPoint);
    return PastWeatherDataModel.fromMap(map);
  }

  @override
  // TODO: implement baseUrl
  String get baseUrl => "https://api.worldweatheronline.com/";
}
