import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heligate/themes/app_themes.dart';
import 'package:heligate/widgets/button/button.dart';
import 'package:heligate/widgets/loading/loading.dart';
import 'package:heligate/widgets/text/textBold.dart';

class HG_NoData extends StatefulWidget {
  dynamic titleError;
  dynamic showButton;
  dynamic titleOntap;
  dynamic onPressed;

  HG_NoData(
      {Key? key,
      this.titleError = 'Page Error',
      this.titleOntap = 'Trở lại',
      this.showButton = true,
      this.onPressed})
      : super(key: key);

  @override
  _NoDataState createState() => _NoDataState();
}

class _NoDataState extends State<HG_NoData> {
  var isShow = false;

  late Timer timer;

  @override
  void initState() {
    HG_Loading().show();
    onShowPageError();
    super.initState();
  }

  onShowPageError() {
    timer = Timer(
        const Duration(milliseconds: 500),
        () => {
              HG_Loading().hide(),
              setState(() {
                isShow = true;
              })
            });
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
              const SizedBox(
                height: 40,
              ),
              HG_TextBold(
                textAlign: TextAlign.center,
                maxLines: 2,
                size: 17.0,
                color: AppTheme.mainColor,
                title: widget.titleError,
              ),
              const SizedBox(
                height: 150,
              ),
              widget.showButton == true
                  ? HG_Button(
                      onPressed:
                          widget.onPressed ?? () => Navigator.pop(context),
                      titleText: widget.titleOntap,
                      width: 80.0,
                    )
                  : Container()
            ],
          )
        : Container();
  }
}
