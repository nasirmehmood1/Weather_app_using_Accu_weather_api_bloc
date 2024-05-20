import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Model/fetch_current_hour_weather_data.dart';
import 'package:flutter_weather_app/Model/weather_model.dart';
import 'package:flutter_weather_app/View_Models/Blocs/TodayWeatherDataBloc/today_weather_data_bloc.dart';
import 'package:flutter_weather_app/Views/Screens/home_page_design.dart';
import 'package:flutter_weather_app/Views/Widgets/image_loader.dart';
import 'package:flutter_weather_app/Views/Widgets/initial_widget.dart';
import 'package:flutter_weather_app/Views/Widgets/loading_widget.dart';
import 'package:flutter_weather_app/Views/Widgets/tab_widget.dart';

class LoadedWidget extends StatefulWidget {
  const LoadedWidget({super.key, required this.userCity});
  final String userCity;
  @override
  State<LoadedWidget> createState() => _LoadedWidgetState();
}

class _LoadedWidgetState extends State<LoadedWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
      body: BlocBuilder<TodayWeatherDataBloc, TodayWeatherDataState>(
          builder: (context, state) {
        if (state is TodayWeatherDataInitialState) {
          return const InitialWidget();
        } else if (state is TodayWeatherDataLoadingState) {
          return const LoadingWidget();
        } else if (state is TodayWeatherDataLoadedState) {
          int currentHour = DateTime.now().hour;
          Hourly currentHourData = currentHourWeatherData(
              currentHour, state.todayWeatherData.data.weather[0].hourly);
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(width * 0.1),
                  width: width,
                  height: height * 0.7,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(width * 0.2),
                        bottomLeft: Radius.circular(width * 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Center(
                        child: Text(
                          '${userCity}',
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          '${currentHourData.tempC}°C',
                          style: const TextStyle(
                              fontSize: 64,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                        width: 300,
                        child: ImageLoader(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildWeatherInfo(
                              Icons.arrow_upward_rounded,
                              'Max Temp',
                              '${state.todayWeatherData.data.weather[0].maxtempC}°C'),
                          _buildWeatherInfo(
                              Icons.wind_power_outlined,
                              'Wind Speed',
                              '${currentHourData.windspeedKmph} KMPH'),
                          _buildWeatherInfo(Icons.water_drop, 'Humidity',
                              '${currentHourData.humidity}%'),
                          _buildWeatherInfo(Icons.arrow_downward, 'Min Temp',
                              '${state.todayWeatherData.data.weather[0].mintempC}°C'),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            'Hourly Forecast',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: height * 0.23,
                        child: ListView.builder(
                          itemCount: state
                              .todayWeatherData.data.weather[0].hourly.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return _buildHourlyForecastCard(state
                                .todayWeatherData
                                .data
                                .weather[0]
                                .hourly[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            ' Daily Forecasting',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    TabWidget(
                        tabText: 'uv index',
                        mainText: '${currentHourData.uvIndex}uv',
                        image: 'assets/images/uv.png'),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    TabWidget(
                        tabText: 'precipitation',
                        mainText: '${currentHourData.precipInches}inch',
                        image: 'assets/images/cloud.png'),
                  ],
                ),
                SizedBox(
                  height: width * 0.07,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    TabWidget(
                        tabText: 'wind dir',
                        mainText: '${currentHourData.winddir16Point}',
                        image: 'assets/images/wind.png'),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    TabWidget(
                        tabText: 'feels like',
                        mainText: '${currentHourData.diffRad} F',
                        image: 'assets/images/temp.png'),
                  ],
                ),
                SizedBox(
                  height: width * 0.07,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    TabWidget(
                        tabText: 'Humidity',
                        mainText: '${currentHourData.humidity}dew',
                        image: 'assets/images/hum.png'),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    TabWidget(
                        tabText: 'Sunshine',
                        mainText: '${currentHourData.chanceofhightemp}F',
                        image: 'assets/images/sunshine.png'),
                  ],
                )
              ],
            ),
          );
        } else {
          if (kDebugMode) {
            print("Error ..............");
          }
          return const SizedBox.shrink();
        }
      }),
    );
  }

  Widget _buildWeatherInfo(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyForecastCard(Hourly hourly) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: backgrounColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${hourly.time}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Icon(
            Icons.sunny,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 5),
          Text(
            '${hourly.tempC}°C',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: blueColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
