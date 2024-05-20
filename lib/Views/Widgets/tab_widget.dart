import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Constants/colors.dart';

class TabWidget extends StatelessWidget {
  const TabWidget(
      {super.key,
      required this.tabText,
      required this.mainText,
      required this.image});
  final String tabText;
  final String mainText;
  final String image;
  @override
  Widget build(BuildContext context) {
    final Size(:height, :width) = MediaQuery.of(context).size;
    return Container(
      height: height * 0.2,
      width: width * 0.43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.03),
          gradient:
              LinearGradient(colors: [ColorsOptions().g1, ColorsOptions().g2])),
      child: Stack(
        children: [
          Positioned(
            top: height * 0.01,
            left: width * 0.02,
            child: Text(
              tabText,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: height * 0.045,
            left: width * 0.13,
            child: Text(
              mainText,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Positioned(
            top: height * 0.08,
            child: SizedBox(
                height: 120,
                width: 150,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                )),
          ),
        ],
      ),
    );
  }
}
