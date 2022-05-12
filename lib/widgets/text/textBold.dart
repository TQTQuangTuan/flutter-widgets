import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';

class HG_TextBold extends StatelessWidget {
  late String title;
  late double size;
  late int maxLines;
  late TextAlign textAlign;

  late Color color;
  Function()? onTap;

  HG_TextBold({
    Key? key,
    this.title = '',
    this.size = 15,
    this.maxLines = 1,
    this.color = AppTheme.darkText,
    this.textAlign = TextAlign.start,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(
          title.toString(),
          textAlign: textAlign,
          maxLines: maxLines,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w600),
        ));
  }
}
