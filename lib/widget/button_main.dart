import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonMain extends StatelessWidget {
  double height;
  double width;
  String text;
  Color? buttonColor;
  Color? textColor;
  TextAlign? alignText;
  double? borderRadius;
  ButtonMain(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      this.buttonColor,
      this.alignText,
      this.borderRadius,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: buttonColor??const Color.fromARGB(255, 34, 74, 134),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius??10.0))),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Lora',
              color: textColor??const Color.fromARGB(255, 226, 225, 225)),
          textAlign: alignText??TextAlign.center,
        ),
      ),
    );
  }
}
