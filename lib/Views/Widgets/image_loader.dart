import 'package:flutter/cupertino.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    int hour = dateTime.hour;
    if (hour >= 6 && hour <= 18) {
      return Image.asset('assets/images/sun.png');
    } else {
      return Image.asset('assets/images/moon.png');
    }
  }
}
