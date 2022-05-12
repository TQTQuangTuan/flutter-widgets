import 'package:flutter/material.dart';

class HG_Alert {
  HG_Alert({this.title = 'title', this.content = 'content', this.onPressYes});

  String title;
  String content;
  Function()? onPressYes;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            MaterialButton(child: const Text("Yes"), onPressed: onPressYes),
            MaterialButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
