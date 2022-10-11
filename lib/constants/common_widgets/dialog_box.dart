import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  static String infoText =
      "Double Tap to live-ping your location, audio and video to the local admin. Single Tap to alert close contact circle and immediate police.";
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 1.0,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            infoText,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ));
  }
}
