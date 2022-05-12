import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class ButtonSmall extends StatefulWidget {
  String titleText;
  dynamic colorButton;
  dynamic colorText;
  VoidCallback onPressed;

  ButtonSmall({
    this.titleText = '',
    required this.onPressed,
    this.colorButton = AppTheme.mainColor,
    this.colorText = Colors.black,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<ButtonSmall> {
  bool ignoring = false;

  void btnClick(onPressed) async {
    Duration time = Duration(seconds: 5);
    setState(() {
      ignoring = true;
      Future.delayed(time, () {
        setState(() {
          ignoring = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthButton = MediaQuery.of(context).size.width / 3 - 20;
    double heightButton = 48;

    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: IgnorePointer(
          ignoring: ignoring,
          child: MaterialButton(
            color: widget.colorButton,
            minWidth: widthButton,
            height: heightButton,
            onPressed: widget.onPressed,
            child: Text(
              widget.titleText,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ));
  }
}
