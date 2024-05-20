// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PastWeatherDataModel {
  Data data;
  PastWeatherDataModel({
    required this.data,
  });

  PastWeatherDataModel copyWith({
    Data? data,
  }) {
    return PastWeatherDataModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory PastWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return PastWeatherDataModel(
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PastWeatherDataModel.fromJson(String source) =>
      PastWeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PastWeatherDataModel(data: $data)';

  @override
  bool operator ==(covariant PastWeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class Data {
  List<Request> request;
  List<Weather> weather;
  Data({
    required this.request,
    required this.weather,
  });

  Data copyWith({
    List<Request>? request,
    List<Weather>? weather,
  }) {
    return Data(
      request: request ?? this.request,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request': request.map((x) => x.toMap()).toList(),
      'weather': weather.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      request: List<Request>.from(
        (map['request'] as List<dynamic>).map<Request>(
          (x) => Request.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(request: $request, weather: $weather)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return listEquals(other.request, request) &&
        listEquals(other.weather, weather);
  }

  @override
  int get hashCode => request.hashCode ^ weather.hashCode;
}

class Request {
  String type;
  String query;
  Request({
    required this.type,
    required this.query,
  });

  Request copyWith({
    String? type,
    String? query,
  }) {
    return Request(
      type: type ?? this.type,
      query: query ?? this.query,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'query': query,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      type: map['type'] as String,
      query: map['query'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) =>
      Request.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Request(type: $type, query: $query)';

  @override
  bool operator ==(covariant Request other) {
    if (identical(this, other)) return true;

    return other.type == type && other.query == query;
  }

  @override
  int get hashCode => type.hashCode ^ query.hashCode;
}

class Weather {
  String date;
  List<Astronomy> astronomy;
  String maxtempC;
  String maxtempF;
  String mintempC;
  String mintempF;
  String avgtempC;
  String avgtempF;
  String? totalSnowCm;
  String sunHour;
  String uvIndex;
  List<PastHourly> hourly;
  Weather({
    required this.date,
    required this.astronomy,
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.totalSnowCm,
    required this.sunHour,
    required this.uvIndex,
    required this.hourly,
  });

  Weather copyWith({
    String? date,
    List<Astronomy>? astronomy,
    String? maxtempC,
    String? maxtempF,
    String? mintempC,
    String? mintempF,
    String? avgtempC,
    String? avgtempF,
    String? totalSnowCm,
    String? sunHour,
    String? uvIndex,
    List<PastHourly>? hourly,
  }) {
    return Weather(
      date: date ?? this.date,
      astronomy: astronomy ?? this.astronomy,
      maxtempC: maxtempC ?? this.maxtempC,
      maxtempF: maxtempF ?? this.maxtempF,
      mintempC: mintempC ?? this.mintempC,
      mintempF: mintempF ?? this.mintempF,
      avgtempC: avgtempC ?? this.avgtempC,
      avgtempF: avgtempF ?? this.avgtempF,
      totalSnowCm: totalSnowCm ?? this.totalSnowCm,
      sunHour: sunHour ?? this.sunHour,
      uvIndex: uvIndex ?? this.uvIndex,
      hourly: hourly ?? this.hourly,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'astronomy': astronomy.map((x) => x.toMap()).toList(),
      'maxtempC': maxtempC,
      'maxtempF': maxtempF,
      'mintempC': mintempC,
      'mintempF': mintempF,
      'avgtempC': avgtempC,
      'avgtempF': avgtempF,
      'totalSnowCm': totalSnowCm,
      'sunHour': sunHour,
      'uvIndex': uvIndex,
      'hourly': hourly.map((x) => x.toMap()).toList(),
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      date: map['date'] as String,
      astronomy: List<Astronomy>.from(
        (map['astronomy'] as List<dynamic>).map<Astronomy>(
          (x) => Astronomy.fromMap(x as Map<String, dynamic>),
        ),
      ),
      maxtempC: map['maxtempC'] as String,
      maxtempF: map['maxtempF'] as String,
      mintempC: map['mintempC'] as String,
      mintempF: map['mintempF'] as String,
      avgtempC: map['avgtempC'] as String,
      avgtempF: map['avgtempF'] as String,
      totalSnowCm: map['totalSnowCm'] as String?,
      sunHour: map['sunHour'] as String,
      uvIndex: map['uvIndex'] as String,
      hourly: List<PastHourly>.from(
        (map['hourly'] as List<dynamic>).map<PastHourly>(
          (x) => PastHourly.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(date: $date, astronomy: $astronomy, maxtempC: $maxtempC, maxtempF: $maxtempF, mintempC: $mintempC, mintempF: $mintempF, avgtempC: $avgtempC, avgtempF: $avgtempF, totalSnowCm: $totalSnowCm, sunHour: $sunHour, uvIndex: $uvIndex, hourly: $hourly)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        listEquals(other.astronomy, astronomy) &&
        other.maxtempC == maxtempC &&
        other.maxtempF == maxtempF &&
        other.mintempC == mintempC &&
        other.mintempF == mintempF &&
        other.avgtempC == avgtempC &&
        other.avgtempF == avgtempF &&
        other.totalSnowCm == totalSnowCm &&
        other.sunHour == sunHour &&
        other.uvIndex == uvIndex &&
        listEquals(other.hourly, hourly);
  }

  @override
  int get hashCode {
    return date.hashCode ^
        astronomy.hashCode ^
        maxtempC.hashCode ^
        maxtempF.hashCode ^
        mintempC.hashCode ^
        mintempF.hashCode ^
        avgtempC.hashCode ^
        avgtempF.hashCode ^
        totalSnowCm.hashCode ^
        sunHour.hashCode ^
        uvIndex.hashCode ^
        hourly.hashCode;
  }
}

class Astronomy {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;
  String? moonPhase;
  String? moonIllumination;
  Astronomy({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  Astronomy copyWith({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    String? moonIllumination,
  }) {
    return Astronomy(
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      moonPhase: moonPhase ?? this.moonPhase,
      moonIllumination: moonIllumination ?? this.moonIllumination,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moonPhase': moonPhase,
      'moonIllumination': moonIllumination,
    };
  }

  factory Astronomy.fromMap(Map<String, dynamic> map) {
    return Astronomy(
      sunrise: map['sunrise'] as String,
      sunset: map['sunset'] as String,
      moonrise: map['moonrise'] as String,
      moonset: map['moonset'] as String,
      moonPhase: map['moonPhase'] as String?,
      moonIllumination: map['moonIllumination'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Astronomy.fromJson(String source) =>
      Astronomy.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Astronomy(sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, moonPhase: $moonPhase, moonIllumination: $moonIllumination)';
  }

  @override
  bool operator ==(covariant Astronomy other) {
    if (identical(this, other)) return true;

    return other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.moonrise == moonrise &&
        other.moonset == moonset &&
        other.moonPhase == moonPhase &&
        other.moonIllumination == moonIllumination;
  }

  @override
  int get hashCode {
    return sunrise.hashCode ^
        sunset.hashCode ^
        moonrise.hashCode ^
        moonset.hashCode ^
        moonPhase.hashCode ^
        moonIllumination.hashCode;
  }
}

class PastHourly {
  String time;
  String tempC;
  String tempF;
  String windspeedMiles;
  String windspeedKmph;
  String winddirDegree;
  String winddir16Point;
  String weatherCode;
  List<WeatherDescElement> weatherIconUrl;
  List<WeatherDescElement> weatherDesc;
  String? precipMm;
  String precipInches;
  String humidity;
  String visibility;
  String visibilityMiles;
  String pressure;
  String pressureInches;
  String cloudcover;
  String? heatIndexC;
  String? heatIndexF;
  String? dewPointC;
  String? dewPointF;
  String? windChillC;
  String? windChillF;
  String? windGustMiles;
  String? windGustKmph;
  String? feelsLikeC;
  String? feelsLikeF;
  String? uvIndex;
  PastHourly({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.windspeedMiles,
    required this.windspeedKmph,
    required this.winddirDegree,
    required this.winddir16Point,
    required this.weatherCode,
    required this.weatherIconUrl,
    required this.weatherDesc,
    required this.precipMm,
    required this.precipInches,
    required this.humidity,
    required this.visibility,
    required this.visibilityMiles,
    required this.pressure,
    required this.pressureInches,
    required this.cloudcover,
    required this.heatIndexC,
    required this.heatIndexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.windChillC,
    required this.windChillF,
    required this.windGustMiles,
    required this.windGustKmph,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.uvIndex,
  });

  PastHourly copyWith({
    String? time,
    String? tempC,
    String? tempF,
    String? windspeedMiles,
    String? windspeedKmph,
    String? winddirDegree,
    String? winddir16Point,
    String? weatherCode,
    List<WeatherDescElement>? weatherIconUrl,
    List<WeatherDescElement>? weatherDesc,
    String? precipMm,
    String? precipInches,
    String? humidity,
    String? visibility,
    String? visibilityMiles,
    String? pressure,
    String? pressureInches,
    String? cloudcover,
    String? heatIndexC,
    String? heatIndexF,
    String? dewPointC,
    String? dewPointF,
    String? windChillC,
    String? windChillF,
    String? windGustMiles,
    String? windGustKmph,
    String? feelsLikeC,
    String? feelsLikeF,
    String? uvIndex,
  }) {
    return PastHourly(
      time: time ?? this.time,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      windspeedMiles: windspeedMiles ?? this.windspeedMiles,
      windspeedKmph: windspeedKmph ?? this.windspeedKmph,
      winddirDegree: winddirDegree ?? this.winddirDegree,
      winddir16Point: winddir16Point ?? this.winddir16Point,
      weatherCode: weatherCode ?? this.weatherCode,
      weatherIconUrl: weatherIconUrl ?? this.weatherIconUrl,
      weatherDesc: weatherDesc ?? this.weatherDesc,
      precipMm: precipMm ?? this.precipMm,
      precipInches: precipInches ?? this.precipInches,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      visibilityMiles: visibilityMiles ?? this.visibilityMiles,
      pressure: pressure ?? this.pressure,
      pressureInches: pressureInches ?? this.pressureInches,
      cloudcover: cloudcover ?? this.cloudcover,
      heatIndexC: heatIndexC ?? this.heatIndexC,
      heatIndexF: heatIndexF ?? this.heatIndexF,
      dewPointC: dewPointC ?? this.dewPointC,
      dewPointF: dewPointF ?? this.dewPointF,
      windChillC: windChillC ?? this.windChillC,
      windChillF: windChillF ?? this.windChillF,
      windGustMiles: windGustMiles ?? this.windGustMiles,
      windGustKmph: windGustKmph ?? this.windGustKmph,
      feelsLikeC: feelsLikeC ?? this.feelsLikeC,
      feelsLikeF: feelsLikeF ?? this.feelsLikeF,
      uvIndex: uvIndex ?? this.uvIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time,
      'tempC': tempC,
      'tempF': tempF,
      'windspeedMiles': windspeedMiles,
      'windspeedKmph': windspeedKmph,
      'winddirDegree': winddirDegree,
      'winddir16Point': winddir16Point,
      'weatherCode': weatherCode,
      'weatherIconUrl': weatherIconUrl.map((x) => x.toMap()).toList(),
      'weatherDesc': weatherDesc.map((x) => x.toMap()).toList(),
      'precipMm': precipMm,
      'precipInches': precipInches,
      'humidity': humidity,
      'visibility': visibility,
      'visibilityMiles': visibilityMiles,
      'pressure': pressure,
      'pressureInches': pressureInches,
      'cloudcover': cloudcover,
      'heatIndexC': heatIndexC,
      'heatIndexF': heatIndexF,
      'dewPointC': dewPointC,
      'dewPointF': dewPointF,
      'windChillC': windChillC,
      'windChillF': windChillF,
      'windGustMiles': windGustMiles,
      'windGustKmph': windGustKmph,
      'feelsLikeC': feelsLikeC,
      'feelsLikeF': feelsLikeF,
      'uvIndex': uvIndex,
    };
  }

  factory PastHourly.fromMap(Map<String, dynamic> map) {
    return PastHourly(
      time: map['time'] as String,
      tempC: map['tempC'] as String,
      tempF: map['tempF'] as String,
      windspeedMiles: map['windspeedMiles'] as String,
      windspeedKmph: map['windspeedKmph'] as String,
      winddirDegree: map['winddirDegree'] as String,
      winddir16Point: map['winddir16Point'] as String,
      weatherCode: map['weatherCode'] as String,
      weatherIconUrl: List<WeatherDescElement>.from(
        (map['weatherIconUrl'] as List<dynamic>).map<WeatherDescElement>(
          (x) => WeatherDescElement.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weatherDesc: List<WeatherDescElement>.from(
        (map['weatherDesc'] as List<dynamic>).map<WeatherDescElement>(
          (x) => WeatherDescElement.fromMap(x as Map<String, dynamic>),
        ),
      ),
      precipMm: map['precipMm'] as String?,
      precipInches: map['precipInches'] as String,
      humidity: map['humidity'] as String,
      visibility: map['visibility'] as String,
      visibilityMiles: map['visibilityMiles'] as String,
      pressure: map['pressure'] as String,
      pressureInches: map['pressureInches'] as String,
      cloudcover: map['cloudcover'] as String,
      heatIndexC: map['heatIndexC'] as String?,
      heatIndexF: map['heatIndexF'] as String?,
      dewPointC: map['dewPointC'] as String?,
      dewPointF: map['dewPointF'] as String?,
      windChillC: map['windChillC'] as String?,
      windChillF: map['windChillF'] as String?,
      windGustMiles: map['windGustMiles'] as String?,
      windGustKmph: map['windGustKmph'] as String?,
      feelsLikeC: map['feelsLikeC'] as String?,
      feelsLikeF: map['feelsLikeF'] as String?,
      uvIndex: map['uvIndex'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory PastHourly.fromJson(String source) =>
      PastHourly.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hourly(time: $time, tempC: $tempC, tempF: $tempF, windspeedMiles: $windspeedMiles, windspeedKmph: $windspeedKmph, winddirDegree: $winddirDegree, winddir16Point: $winddir16Point, weatherCode: $weatherCode, weatherIconUrl: $weatherIconUrl, weatherDesc: $weatherDesc, precipMm: $precipMm, precipInches: $precipInches, humidity: $humidity, visibility: $visibility, visibilityMiles: $visibilityMiles, pressure: $pressure, pressureInches: $pressureInches, cloudcover: $cloudcover, heatIndexC: $heatIndexC, heatIndexF: $heatIndexF, dewPointC: $dewPointC, dewPointF: $dewPointF, windChillC: $windChillC, windChillF: $windChillF, windGustMiles: $windGustMiles, windGustKmph: $windGustKmph, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, uvIndex: $uvIndex)';
  }

  @override
  bool operator ==(covariant PastHourly other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.windspeedMiles == windspeedMiles &&
        other.windspeedKmph == windspeedKmph &&
        other.winddirDegree == winddirDegree &&
        other.winddir16Point == winddir16Point &&
        other.weatherCode == weatherCode &&
        listEquals(other.weatherIconUrl, weatherIconUrl) &&
        listEquals(other.weatherDesc, weatherDesc) &&
        other.precipMm == precipMm &&
        other.precipInches == precipInches &&
        other.humidity == humidity &&
        other.visibility == visibility &&
        other.visibilityMiles == visibilityMiles &&
        other.pressure == pressure &&
        other.pressureInches == pressureInches &&
        other.cloudcover == cloudcover &&
        other.heatIndexC == heatIndexC &&
        other.heatIndexF == heatIndexF &&
        other.dewPointC == dewPointC &&
        other.dewPointF == dewPointF &&
        other.windChillC == windChillC &&
        other.windChillF == windChillF &&
        other.windGustMiles == windGustMiles &&
        other.windGustKmph == windGustKmph &&
        other.feelsLikeC == feelsLikeC &&
        other.feelsLikeF == feelsLikeF &&
        other.uvIndex == uvIndex;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        tempC.hashCode ^
        tempF.hashCode ^
        windspeedMiles.hashCode ^
        windspeedKmph.hashCode ^
        winddirDegree.hashCode ^
        winddir16Point.hashCode ^
        weatherCode.hashCode ^
        weatherIconUrl.hashCode ^
        weatherDesc.hashCode ^
        precipMm.hashCode ^
        precipInches.hashCode ^
        humidity.hashCode ^
        visibility.hashCode ^
        visibilityMiles.hashCode ^
        pressure.hashCode ^
        pressureInches.hashCode ^
        cloudcover.hashCode ^
        heatIndexC.hashCode ^
        heatIndexF.hashCode ^
        dewPointC.hashCode ^
        dewPointF.hashCode ^
        windChillC.hashCode ^
        windChillF.hashCode ^
        windGustMiles.hashCode ^
        windGustKmph.hashCode ^
        feelsLikeC.hashCode ^
        feelsLikeF.hashCode ^
        uvIndex.hashCode;
  }
}

class WeatherDescElement {
  String value;
  WeatherDescElement({
    required this.value,
  });

  WeatherDescElement copyWith({
    String? value,
  }) {
    return WeatherDescElement(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }

  factory WeatherDescElement.fromMap(Map<String, dynamic> map) {
    return WeatherDescElement(
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDescElement.fromJson(String source) =>
      WeatherDescElement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeatherDescElement(value: $value)';

  @override
  bool operator ==(covariant WeatherDescElement other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
