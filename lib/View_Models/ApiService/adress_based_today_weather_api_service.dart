import 'package:flutter_weather_app/Constants/utils.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:flutter_weather_app/View_Models/ApiService/api_service.dart';
import 'package:http/http.dart' as http;
// https://api.worldweatheronline.com/premium/v1/weather.ashx?key=4a0719fa9e944d569d732502240805&q=29.396350450000014,%2071.7492265856952&format=json

class AddressBasedTodayWeatherApiService extends ApiService {
  @override
  // TODO: implement ApiUrl
  String get ApiUrl =>
      "premium/v1/weather.ashx?key=4a0719fa9e944d569d732502240805&q=";

// 29.396350450000014,%2071.7492265856952&format=json
  Future<CurrentWeatherDataModel>
      fetchCurrentWeatherDataFromGivenLatitudeAndLongitude(
          {required double latitude, required double longitude}) async {
    String endPoint = "$latitude,$longitude&format=json";

    var map = await fetch(endPoints: endPoint);

    return CurrentWeatherDataModel.fromMap(map);
  }

  @override
  // TODO: implement baseUrl
  String get baseUrl => "https://api.worldweatheronline.com/";
}
