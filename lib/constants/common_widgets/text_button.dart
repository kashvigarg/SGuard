import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required Function() pressedFunc,
      required this.buttonColor,
      required this.buttonText,
      required this.height,
      required this.width,
      this.icon,
      this.textColor});

  final Color? buttonColor;
  final String buttonText;
  final double height;
  final double width;
  final IconData? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: buttonColor != null
                  ? buttonColor
                  : Color.fromRGBO(245, 246, 241, 0.67),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(fontSize: 20, color: textColor),
            )),
          )
        : Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: buttonColor != null
                  ? buttonColor
                  : Color.fromRGBO(245, 246, 241, 0.67),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(
                  width: 20,
                ),
                Text(
                  buttonText,
                  style: TextStyle(fontSize: 20, color: textColor),
                ),
              ],
            ),
          );
  }
}

pressedFunc() {}

// ElevatedButton(
//       style: TextButton.styleFrom(
//           minimumSize: Size.fromRadius(20),
//           backgroundColor: Color.fromRGBO(245, 246, 241, 0.67),
//           padding: EdgeInsets.all(8),
//           textStyle: TextStyle(
//             fontSize: 20,
//             color: Colors.black,
//           )),
//       onPressed: pressedFunc(),
//       child: Text(buttonText),