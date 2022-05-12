import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';
import 'package:heligate/widgets/button/button.dart';
import 'package:heligate/widgets/text/textBold.dart';

class HG_PageError extends StatefulWidget {
  dynamic titleError;
  HG_PageError({Key? key, this.titleError = 'Page Error'}) : super(key: key);

  @override
  _PageErrorState createState() => _PageErrorState();
}

class _PageErrorState extends State<HG_PageError> {
  var isShow = false;

  late Timer timer;

  @override
  void initState() {
    onShowPageError();
    super.initState();
  }

  onShowPageError() {
    if (!mounted) return;
    if (mounted) {
      timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        setState(() {
          isShow = true;
        });
      });
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isShow == true
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HG_TextBold(
                size: 35.0,
                color: AppTheme.mainColor,
                title: widget.titleError,
              ),
              const SizedBox(
                height: 100,
              ),
              const SizedBox(
                height: 150,
              ),
              HG_Button(
                onPressed: () => Navigator.pop(context),
                titleText: 'Trở lại',
                width: 80.0,
              )
            ],
          )
        : Container();
  }
}
