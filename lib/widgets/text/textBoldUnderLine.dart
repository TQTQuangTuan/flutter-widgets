import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class HG_TextBoldUnderLine extends StatelessWidget {
  late String title;
  late double size;
  late Color color;
  Function()? onTap;

  HG_TextBoldUnderLine({
    Key? key,
    this.title = '',
    this.size = 15,
    this.color = AppTheme.darkText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: size,
                color: color,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
