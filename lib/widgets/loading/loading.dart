import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HG_Loading {
  static const timeHide = 6;

  void show() {
    EasyLoading.show(status: 'Đang tải...');
    Timer(const Duration(seconds: timeHide), () {
      HG_Loading().hide();
    });
  }

  void hide() {
    EasyLoading.dismiss();
  }
}
