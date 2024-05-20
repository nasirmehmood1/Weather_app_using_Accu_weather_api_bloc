// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CurrentWeatherDataModel {
  Data data;
  CurrentWeatherDataModel({
    required this.data,
  });

  CurrentWeatherDataModel copyWith({
    Data? data,
  }) {
    return CurrentWeatherDataModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory CurrentWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherDataModel(
      data: Data.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherDataModel.fromJson(String source) =>
      CurrentWeatherDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WeatherModel(data: $data)';

  @override
  bool operator ==(covariant CurrentWeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class Data {
  List<Request> request;
  // List<CurrentCondition> currentCondition;
  List<WeatherElement> weather;
  // List<ClimateAverage?>? climateAverages ;
  Data({
    required this.request,
    // required this.currentCondition,
    required this.weather,
    // required this.climateAverages,
  });

  Data copyWith({
    List<Request>? request,
    // List<CurrentCondition>? currentCondition,
    List<WeatherElement>? weather,
    List<ClimateAverage>? climateAverages,
  }) {
    return Data(
      request: request ?? this.request,
      // currentCondition: currentCondition ?? this.currentCondition,
      weather: weather ?? this.weather,
      // climateAverages: climateAverages ?? this.climateAverages,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request': request.map((x) => x.toMap()).toList(),
      // 'currentCondition': currentCondition.map((x) => x.toMap()).toList(),
      'weather': weather.map((x) => x.toMap()).toList(),
      // 'climateAverages': climateAverages?.map((x) => x?.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      request: List<Request>.from(
        (map['request'] as List<dynamic>).map<Request>(
          (x) => Request.fromMap(x as Map<String, dynamic>),
        ),
      ),
      // currentCondition: List<CurrentCondition>.from(
      //   (map['currentCondition'] as List<dynamic>).map<CurrentCondition>(
      //     (x) => CurrentCondition.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      weather: List<WeatherElement>.from(
        (map['weather'] as List<dynamic>).map<WeatherElement>(
          (x) => WeatherElement.fromMap(x as Map<String, dynamic>),
        ),
      ),
      // climateAverages: List<ClimateAverage?>.from(
      //   (map['climateAverages'] as List<num> ?? <num>[0]).map<ClimateAverage>(
      //     (x) => ClimateAverage.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(request: $request, weather: $weather)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return listEquals(other.request, request) &&
        // listEquals(other.currentCondition, currentCondition) &&
        listEquals(other.weather, weather);
    // listEquals(other.climateAverages, climateAverages);
  }

  @override
  int get hashCode {
    return request.hashCode ^
        // currentCondition.hashCode ^
        weather.hashCode;
    // climateAverages.hashCode;
  }
}

class ClimateAverage {
  List<Month> month;
  ClimateAverage({
    required this.month,
  });

  ClimateAverage copyWith({
    List<Month>? month,
  }) {
    return ClimateAverage(
      month: month ?? this.month,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'month': month.map((x) => x.toMap()).toList(),
    };
  }

  factory ClimateAverage.fromMap(Map<String, dynamic> map) {
    return ClimateAverage(
      month: List<Month>.from(
        (map['month'] as List<int>).map<Month>(
          (x) => Month.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClimateAverage.fromJson(String source) =>
      ClimateAverage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ClimateAverage(month: $month)';

  @override
  bool operator ==(covariant ClimateAverage other) {
    if (identical(this, other)) return true;

    return listEquals(other.month, month);
  }

  @override
  int get hashCode => month.hashCode;
}

class Month {
  String index;
  String name;
  String avgMinTemp;
  String avgMinTempF;
  String absMaxTemp;
  String absMaxTempF;
  String avgDailyRainfall;
  Month({
    required this.index,
    required this.name,
    required this.avgMinTemp,
    required this.avgMinTempF,
    required this.absMaxTemp,
    required this.absMaxTempF,
    required this.avgDailyRainfall,
  });

  Month copyWith({
    String? index,
    String? name,
    String? avgMinTemp,
    String? avgMinTempF,
    String? absMaxTemp,
    String? absMaxTempF,
    String? avgDailyRainfall,
  }) {
    return Month(
      index: index ?? this.index,
      name: name ?? this.name,
      avgMinTemp: avgMinTemp ?? this.avgMinTemp,
      avgMinTempF: avgMinTempF ?? this.avgMinTempF,
      absMaxTemp: absMaxTemp ?? this.absMaxTemp,
      absMaxTempF: absMaxTempF ?? this.absMaxTempF,
      avgDailyRainfall: avgDailyRainfall ?? this.avgDailyRainfall,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'name': name,
      'avgMinTemp': avgMinTemp,
      'avgMinTempF': avgMinTempF,
      'absMaxTemp': absMaxTemp,
      'absMaxTempF': absMaxTempF,
      'avgDailyRainfall': avgDailyRainfall,
    };
  }

  factory Month.fromMap(Map<String, dynamic> map) {
    return Month(
      index: map['index'] as String,
      name: map['name'] as String,
      avgMinTemp: map['avgMinTemp'] as String,
      avgMinTempF: map['avgMinTempF'] as String,
      absMaxTemp: map['absMaxTemp'] as String,
      absMaxTempF: map['absMaxTempF'] as String,
      avgDailyRainfall: map['avgDailyRainfall'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Month.fromJson(String source) =>
      Month.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Month(index: $index, name: $name, avgMinTemp: $avgMinTemp, avgMinTempF: $avgMinTempF, absMaxTemp: $absMaxTemp, absMaxTempF: $absMaxTempF, avgDailyRainfall: $avgDailyRainfall)';
  }

  @override
  bool operator ==(covariant Month other) {
    if (identical(this, other)) return true;

    return other.index == index &&
        other.name == name &&
        other.avgMinTemp == avgMinTemp &&
        other.avgMinTempF == avgMinTempF &&
        other.absMaxTemp == absMaxTemp &&
        other.absMaxTempF == absMaxTempF &&
        other.avgDailyRainfall == avgDailyRainfall;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        name.hashCode ^
        avgMinTemp.hashCode ^
        avgMinTempF.hashCode ^
        absMaxTemp.hashCode ^
        absMaxTempF.hashCode ^
        avgDailyRainfall.hashCode;
  }
}

class CurrentCondition {
  String observationTime;
  String tempC;
  String tempF;
  String weatherCode;
  List<Weather> weatherIconUrl;
  List<Weather> weatherDesc;
  String windspeedMiles;
  String windspeedKmph;
  String winddirDegree;
  String winddir16Point;
  String precipMm;
  String precipInches;
  String humidity;
  String visibility;
  String visibilityMiles;
  String pressure;
  String pressureInches;
  String cloudcover;
  String feelsLikeC;
  String feelsLikeF;
  String uvIndex;
  CurrentCondition({
    required this.observationTime,
    required this.tempC,
    required this.tempF,
    required this.weatherCode,
    required this.weatherIconUrl,
    required this.weatherDesc,
    required this.windspeedMiles,
    required this.windspeedKmph,
    required this.winddirDegree,
    required this.winddir16Point,
    required this.precipMm,
    required this.precipInches,
    required this.humidity,
    required this.visibility,
    required this.visibilityMiles,
    required this.pressure,
    required this.pressureInches,
    required this.cloudcover,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.uvIndex,
  });

  CurrentCondition copyWith({
    String? observationTime,
    String? tempC,
    String? tempF,
    String? weatherCode,
    List<Weather>? weatherIconUrl,
    List<Weather>? weatherDesc,
    String? windspeedMiles,
    String? windspeedKmph,
    String? winddirDegree,
    String? winddir16Point,
    String? precipMm,
    String? precipInches,
    String? humidity,
    String? visibility,
    String? visibilityMiles,
    String? pressure,
    String? pressureInches,
    String? cloudcover,
    String? feelsLikeC,
    String? feelsLikeF,
    String? uvIndex,
  }) {
    return CurrentCondition(
      observationTime: observationTime ?? this.observationTime,
      tempC: tempC ?? this.tempC,
      tempF: tempF ?? this.tempF,
      weatherCode: weatherCode ?? this.weatherCode,
      weatherIconUrl: weatherIconUrl ?? this.weatherIconUrl,
      weatherDesc: weatherDesc ?? this.weatherDesc,
      windspeedMiles: windspeedMiles ?? this.windspeedMiles,
      windspeedKmph: windspeedKmph ?? this.windspeedKmph,
      winddirDegree: winddirDegree ?? this.winddirDegree,
      winddir16Point: winddir16Point ?? this.winddir16Point,
      precipMm: precipMm ?? this.precipMm,
      precipInches: precipInches ?? this.precipInches,
      humidity: humidity ?? this.humidity,
      visibility: visibility ?? this.visibility,
      visibilityMiles: visibilityMiles ?? this.visibilityMiles,
      pressure: pressure ?? this.pressure,
      pressureInches: pressureInches ?? this.pressureInches,
      cloudcover: cloudcover ?? this.cloudcover,
      feelsLikeC: feelsLikeC ?? this.feelsLikeC,
      feelsLikeF: feelsLikeF ?? this.feelsLikeF,
      uvIndex: uvIndex ?? this.uvIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'observationTime': observationTime,
      'tempC': tempC,
      'tempF': tempF,
      'weatherCode': weatherCode,
      'weatherIconUrl': weatherIconUrl.map((x) => x.toMap()).toList(),
      'weatherDesc': weatherDesc.map((x) => x.toMap()).toList(),
      'windspeedMiles': windspeedMiles,
      'windspeedKmph': windspeedKmph,
      'winddirDegree': winddirDegree,
      'winddir16Point': winddir16Point,
      'precipMm': precipMm,
      'precipInches': precipInches,
      'humidity': humidity,
      'visibility': visibility,
      'visibilityMiles': visibilityMiles,
      'pressure': pressure,
      'pressureInches': pressureInches,
      'cloudcover': cloudcover,
      'feelsLikeC': feelsLikeC,
      'feelsLikeF': feelsLikeF,
      'uvIndex': uvIndex,
    };
  }

  factory CurrentCondition.fromMap(Map<String, dynamic> map) {
    return CurrentCondition(
      observationTime: map['observationTime'] as String,
      tempC: map['tempC'] as String,
      tempF: map['tempF'] as String,
      weatherCode: map['weatherCode'] as String,
      weatherIconUrl: List<Weather>.from(
        (map['weatherIconUrl'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weatherDesc: List<Weather>.from(
        (map['weatherDesc'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      windspeedMiles: map['windspeedMiles'] as String,
      windspeedKmph: map['windspeedKmph'] as String,
      winddirDegree: map['winddirDegree'] as String,
      winddir16Point: map['winddir16Point'] as String,
      precipMm: map['precipMm'] as String,
      precipInches: map['precipInches'] as String,
      humidity: map['humidity'] as String,
      visibility: map['visibility'] as String,
      visibilityMiles: map['visibilityMiles'] as String,
      pressure: map['pressure'] as String,
      pressureInches: map['pressureInches'] as String,
      cloudcover: map['cloudcover'] as String,
      feelsLikeC: map['feelsLikeC'] as String,
      feelsLikeF: map['feelsLikeF'] as String,
      uvIndex: map['uvIndex'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentCondition.fromJson(String source) =>
      CurrentCondition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentCondition(observationTime: $observationTime, tempC: $tempC, tempF: $tempF, weatherCode: $weatherCode, weatherIconUrl: $weatherIconUrl, weatherDesc: $weatherDesc, windspeedMiles: $windspeedMiles, windspeedKmph: $windspeedKmph, winddirDegree: $winddirDegree, winddir16Point: $winddir16Point, precipMm: $precipMm, precipInches: $precipInches, humidity: $humidity, visibility: $visibility, visibilityMiles: $visibilityMiles, pressure: $pressure, pressureInches: $pressureInches, cloudcover: $cloudcover, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, uvIndex: $uvIndex)';
  }

  @override
  bool operator ==(covariant CurrentCondition other) {
    if (identical(this, other)) return true;

    return other.observationTime == observationTime &&
        other.tempC == tempC &&
        other.tempF == tempF &&
        other.weatherCode == weatherCode &&
        listEquals(other.weatherIconUrl, weatherIconUrl) &&
        listEquals(other.weatherDesc, weatherDesc) &&
        other.windspeedMiles == windspeedMiles &&
        other.windspeedKmph == windspeedKmph &&
        other.winddirDegree == winddirDegree &&
        other.winddir16Point == winddir16Point &&
        other.precipMm == precipMm &&
        other.precipInches == precipInches &&
        other.humidity == humidity &&
        other.visibility == visibility &&
        other.visibilityMiles == visibilityMiles &&
        other.pressure == pressure &&
        other.pressureInches == pressureInches &&
        other.cloudcover == cloudcover &&
        other.feelsLikeC == feelsLikeC &&
        other.feelsLikeF == feelsLikeF &&
        other.uvIndex == uvIndex;
  }

  @override
  int get hashCode {
    return observationTime.hashCode ^
        tempC.hashCode ^
        tempF.hashCode ^
        weatherCode.hashCode ^
        weatherIconUrl.hashCode ^
        weatherDesc.hashCode ^
        windspeedMiles.hashCode ^
        windspeedKmph.hashCode ^
        winddirDegree.hashCode ^
        winddir16Point.hashCode ^
        precipMm.hashCode ^
        precipInches.hashCode ^
        humidity.hashCode ^
        visibility.hashCode ^
        visibilityMiles.hashCode ^
        pressure.hashCode ^
        pressureInches.hashCode ^
        cloudcover.hashCode ^
        feelsLikeC.hashCode ^
        feelsLikeF.hashCode ^
        uvIndex.hashCode;
  }
}

class Weather {
  String value;
  Weather({
    required this.value,
  });

  Weather copyWith({
    String? value,
  }) {
    return Weather(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Weather(value: $value)';

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
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

class WeatherElement {
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
  List<Hourly> hourly;
  WeatherElement({
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

  WeatherElement copyWith({
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
    List<Hourly>? hourly,
  }) {
    return WeatherElement(
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

  factory WeatherElement.fromMap(Map<String, dynamic> map) {
    return WeatherElement(
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
      hourly: List<Hourly>.from(
        (map['hourly'] as List<dynamic>).map<Hourly>(
          (x) => Hourly.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherElement.fromJson(String source) =>
      WeatherElement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherElement(date: $date, astronomy: $astronomy, maxtempC: $maxtempC, maxtempF: $maxtempF, mintempC: $mintempC, mintempF: $mintempF, avgtempC: $avgtempC, avgtempF: $avgtempF, totalSnowCm: $totalSnowCm, sunHour: $sunHour, uvIndex: $uvIndex, hourly: $hourly)';
  }

  @override
  bool operator ==(covariant WeatherElement other) {
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

class Hourly {
  String? time;
  String? tempC;
  String? tempF;
  String? windspeedMiles;
  String? windspeedKmph;
  String? winddirDegree;
  String? winddir16Point;
  String? weatherCode;
  List<Weather>? weatherIconUrl;
  List<Weather>? weatherDesc;
  String? precipMm;
  String? precipInches;
  String? humidity;
  String? visibility;
  String? visibilityMiles;
  String? pressure;
  String? pressureInches;
  String? cloudcover;
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
  String? chanceofrain;
  String? chanceofremdry;
  String? chanceofwindy;
  String? chanceofovercast;
  String? chanceofsunshine;
  String? chanceoffrost;
  String? chanceofhightemp;
  String? chanceoffog;
  String? chanceofsnow;
  String? chanceofthunder;
  String? uvIndex;
  String? shortRad;
  String? diffRad;
  Hourly({
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
    required this.chanceofrain,
    required this.chanceofremdry,
    required this.chanceofwindy,
    required this.chanceofovercast,
    required this.chanceofsunshine,
    required this.chanceoffrost,
    required this.chanceofhightemp,
    required this.chanceoffog,
    required this.chanceofsnow,
    required this.chanceofthunder,
    required this.uvIndex,
    required this.shortRad,
    required this.diffRad,
  });

  Hourly copyWith({
    String? time,
    String? tempC,
    String? tempF,
    String? windspeedMiles,
    String? windspeedKmph,
    String? winddirDegree,
    String? winddir16Point,
    String? weatherCode,
    List<Weather>? weatherIconUrl,
    List<Weather>? weatherDesc,
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
    String? chanceofrain,
    String? chanceofremdry,
    String? chanceofwindy,
    String? chanceofovercast,
    String? chanceofsunshine,
    String? chanceoffrost,
    String? chanceofhightemp,
    String? chanceoffog,
    String? chanceofsnow,
    String? chanceofthunder,
    String? uvIndex,
    String? shortRad,
    String? diffRad,
  }) {
    return Hourly(
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
      chanceofrain: chanceofrain ?? this.chanceofrain,
      chanceofremdry: chanceofremdry ?? this.chanceofremdry,
      chanceofwindy: chanceofwindy ?? this.chanceofwindy,
      chanceofovercast: chanceofovercast ?? this.chanceofovercast,
      chanceofsunshine: chanceofsunshine ?? this.chanceofsunshine,
      chanceoffrost: chanceoffrost ?? this.chanceoffrost,
      chanceofhightemp: chanceofhightemp ?? this.chanceofhightemp,
      chanceoffog: chanceoffog ?? this.chanceoffog,
      chanceofsnow: chanceofsnow ?? this.chanceofsnow,
      chanceofthunder: chanceofthunder ?? this.chanceofthunder,
      uvIndex: uvIndex ?? this.uvIndex,
      shortRad: shortRad ?? this.shortRad,
      diffRad: diffRad ?? this.diffRad,
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
      'weatherIconUrl': weatherIconUrl?.map((x) => x.toMap()).toList(),
      'weatherDesc': weatherDesc?.map((x) => x.toMap()).toList(),
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
      'chanceofrain': chanceofrain,
      'chanceofremdry': chanceofremdry,
      'chanceofwindy': chanceofwindy,
      'chanceofovercast': chanceofovercast,
      'chanceofsunshine': chanceofsunshine,
      'chanceoffrost': chanceoffrost,
      'chanceofhightemp': chanceofhightemp,
      'chanceoffog': chanceoffog,
      'chanceofsnow': chanceofsnow,
      'chanceofthunder': chanceofthunder,
      'uvIndex': uvIndex,
      'shortRad': shortRad,
      'diffRad': diffRad,
    };
  }

  factory Hourly.fromMap(Map<String, dynamic> map) {
    return Hourly(
      time: map['time'] as String,
      tempC: map['tempC'] as String,
      tempF: map['tempF'] as String,
      windspeedMiles: map['windspeedMiles'] as String,
      windspeedKmph: map['windspeedKmph'] as String,
      winddirDegree: map['winddirDegree'] as String,
      winddir16Point: map['winddir16Point'] as String,
      weatherCode: map['weatherCode'] as String,
      weatherIconUrl: List<Weather>.from(
        (map['weatherIconUrl'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      weatherDesc: List<Weather>.from(
        (map['weatherDesc'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      precipMm: map['precipMm'] as String?,
      precipInches: map['precipInches'] as String?,
      humidity: map['humidity'] as String?,
      visibility: map['visibility'] as String?,
      visibilityMiles: map['visibilityMiles'] as String?,
      pressure: map['pressure'] as String?,
      pressureInches: map['pressureInches'] as String?,
      cloudcover: map['cloudcover'] as String?,
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
      chanceofrain: map['chanceofrain'] as String?,
      chanceofremdry: map['chanceofremdry'] as String?,
      chanceofwindy: map['chanceofwindy'] as String?,
      chanceofovercast: map['chanceofovercast'] as String?,
      chanceofsunshine: map['chanceofsunshine'] as String?,
      chanceoffrost: map['chanceoffrost'] as String?,
      chanceofhightemp: map['chanceofhightemp'] as String?,
      chanceoffog: map['chanceoffog'] as String?,
      chanceofsnow: map['chanceofsnow'] as String?,
      chanceofthunder: map['chanceofthunder'] as String?,
      uvIndex: map['uvIndex'] as String?,
      shortRad: map['shortRad'] as String?,
      diffRad: map['diffRad'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hourly.fromJson(String source) =>
      Hourly.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Hourly(time: $time, tempC: $tempC, tempF: $tempF, windspeedMiles: $windspeedMiles, windspeedKmph: $windspeedKmph, winddirDegree: $winddirDegree, winddir16Point: $winddir16Point, weatherCode: $weatherCode, weatherIconUrl: $weatherIconUrl, weatherDesc: $weatherDesc, precipMm: $precipMm, precipInches: $precipInches, humidity: $humidity, visibility: $visibility, visibilityMiles: $visibilityMiles, pressure: $pressure, pressureInches: $pressureInches, cloudcover: $cloudcover, heatIndexC: $heatIndexC, heatIndexF: $heatIndexF, dewPointC: $dewPointC, dewPointF: $dewPointF, windChillC: $windChillC, windChillF: $windChillF, windGustMiles: $windGustMiles, windGustKmph: $windGustKmph, feelsLikeC: $feelsLikeC, feelsLikeF: $feelsLikeF, chanceofrain: $chanceofrain, chanceofremdry: $chanceofremdry, chanceofwindy: $chanceofwindy, chanceofovercast: $chanceofovercast, chanceofsunshine: $chanceofsunshine, chanceoffrost: $chanceoffrost, chanceofhightemp: $chanceofhightemp, chanceoffog: $chanceoffog, chanceofsnow: $chanceofsnow, chanceofthunder: $chanceofthunder, uvIndex: $uvIndex, shortRad: $shortRad, diffRad: $diffRad)';
  }

  @override
  bool operator ==(covariant Hourly other) {
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
        other.chanceofrain == chanceofrain &&
        other.chanceofremdry == chanceofremdry &&
        other.chanceofwindy == chanceofwindy &&
        other.chanceofovercast == chanceofovercast &&
        other.chanceofsunshine == chanceofsunshine &&
        other.chanceoffrost == chanceoffrost &&
        other.chanceofhightemp == chanceofhightemp &&
        other.chanceoffog == chanceoffog &&
        other.chanceofsnow == chanceofsnow &&
        other.chanceofthunder == chanceofthunder &&
        other.uvIndex == uvIndex &&
        other.shortRad == shortRad &&
        other.diffRad == diffRad;
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
        chanceofrain.hashCode ^
        chanceofremdry.hashCode ^
        chanceofwindy.hashCode ^
        chanceofovercast.hashCode ^
        chanceofsunshine.hashCode ^
        chanceoffrost.hashCode ^
        chanceofhightemp.hashCode ^
        chanceoffog.hashCode ^
        chanceofsnow.hashCode ^
        chanceofthunder.hashCode ^
        uvIndex.hashCode ^
        shortRad.hashCode ^
        diffRad.hashCode;
  }
}
