import 'dart:ffi';

import 'package:flutter/material.dart';

class HG_Padding extends StatefulWidget {
  double left;
  double right;
  double top;
  double bottom;
  Widget child;

  HG_Padding(
      {Key? key,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0,
      required this.child})
      : super(key: key);

  @override
  State<HG_Padding> createState() => _HG_PaddingState();
}

class _HG_PaddingState extends State<HG_Padding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.left,
          right: widget.right,
          top: widget.top,
          bottom: widget.bottom),
      child: widget.child,
    );
  }
}
