import 'package:empowering_humanity/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.buttonColor,
      required this.buttonText,
      this.height,
      this.width,
      this.icon,
      this.textColor,
      required this.pressedFunc});

  final Color? buttonColor;
  final String buttonText;
  final double? height;
  final double? width;
  final IconData? icon;
  final Color? textColor;

  final Function() pressedFunc;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? InkWell(
            onTap: pressedFunc,
            child: Container(
              height: height ?? SizeConfig.screenHeight * 0.06,
              width: width ?? SizeConfig.screenWidth * 0.6,
              decoration: BoxDecoration(
                color: buttonColor ?? const Color.fromRGBO(245, 246, 241, 0.67),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(fontSize: 20, color: textColor),
              )),
            ),
          )
        : Container(
            height: height ?? SizeConfig.screenHeight * 0.06,
            width: width ?? SizeConfig.screenWidth * 0.6,
            decoration: BoxDecoration(
              color: buttonColor ?? const Color.fromRGBO(245, 246, 241, 0.67),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.purple,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                  style: TextStyle(fontSize: 15, color: textColor),
                ),
              ],
            ),
          );
  }
}
