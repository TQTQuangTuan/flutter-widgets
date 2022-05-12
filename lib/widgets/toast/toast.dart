import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HG_Toast {
  HG_Toast({
    this.title = 'Thành công!',
  });

  String title;

  void show() {
    Fluttertoast.showToast(
        msg: title,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
