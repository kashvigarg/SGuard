import 'package:flutter/material.dart';

// class DeviceMedia extends MediaQuery {
//   final deviceInfo = MediaQuery.of(context);
//     final screenHeight = deviceInfo.size.height;
//     final screenWidth = deviceInfo.size.width;

//   const DeviceMedia({super.key});
// }

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
