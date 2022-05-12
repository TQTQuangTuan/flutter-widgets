import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class HG_ButtonGradient extends StatelessWidget {
  final Widget child;
  // final List<Color> gradient;
  final bool isGradient;
  final double width;
  final double height;
  final double borderWidth;
  final Function()? onPressed;

  const HG_ButtonGradient({
    Key? key,
    required this.child,
    // required this.gradient,
    this.width = double.infinity,
    this.height = 60.0,
    this.borderWidth = 0.8,
    required this.onPressed,
    this.isGradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        border: Border.all(color: AppTheme.colorBorder, width: borderWidth),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
