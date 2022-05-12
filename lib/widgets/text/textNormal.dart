import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class HG_TextNormal extends StatelessWidget {
  late String title;
  late double size;
  late int maxLines;
  late TextAlign textAlign;
  late FontWeight fontWeight;
  late TextDecoration decoration;
  late Color color;
  Function()? onTap;

  HG_TextNormal({
    Key? key,
    this.title = '',
    this.size = 15,
    this.maxLines = 1,
    this.decoration = TextDecoration.none,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.center,
    this.color = AppTheme.darkText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(
          title.toString(),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: size,
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        ));
  }
}
