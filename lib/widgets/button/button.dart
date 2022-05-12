import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class HG_Button extends StatefulWidget {
  final String titleText;
  final dynamic colorButton;
  final dynamic colorText;
  final dynamic width;
  final dynamic disable;
  final VoidCallback onPressed;

  HG_Button({
    Key? key,
    this.titleText = '',
    this.width,
    this.disable,
    required this.onPressed,
    this.colorButton = AppTheme.mainColor,
    this.colorText = Colors.black,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<HG_Button> {
  bool ignoring = false;

  void btnClick(onPressed) async {
    Duration time = const Duration(seconds: 5);
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
    double widthButton = MediaQuery.of(context).size.width - 20;
    double heightButton = 58;

    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: IgnorePointer(
          ignoring: ignoring,
          child: MaterialButton(
              disabledColor: AppTheme.grey,
              color: widget.colorButton,
              minWidth: widget.width ?? widthButton,
              height: heightButton,
              onPressed: (widget.disable == true) ? null : widget.onPressed,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  widget.titleText,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              )),
        ));
  }
}
