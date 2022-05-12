import 'package:flutter/material.dart';

import '../../themes/app_themes.dart';

class HG_BaseScreen extends StatefulWidget {
  late Widget childView;
  bool? showAppbar;
  String? titleBar;
  VoidCallback? onBackPressed;
  VoidCallback? onLongPressTitle;
  List<Widget>? actionBar;
  bool icBack;
  Widget? floatingButton;

  HG_BaseScreen({
    Key? key,
    required this.childView, // NOT NULL
    bool? this.showAppbar, //TRUE Default show, to hide ste FALSE
    bool this.icBack = true, //TRUE Default show, to hide ste FALSE
    String? this.titleBar,
    this.actionBar,
    this.floatingButton,
    VoidCallback? this.onBackPressed,
    VoidCallback? this.onLongPressTitle,
  });
  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<HG_BaseScreen> {
  @override
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: SafeArea(
            top: true,
            bottom: true,
            child: Scaffold(
              appBar: widget.showAppbar == true
                  ? AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      title: InkWell(
                        onLongPress: widget.onLongPressTitle,
                        child: Text(
                          widget.titleBar.toString() == 'null'
                              ? ''
                              : widget.titleBar.toString(),
                          style: const TextStyle(
                              color: AppTheme.colorText, fontSize: 17),
                        ),
                      ),
                      leading: widget.icBack
                          ? IconButton(
                              iconSize: 20,
                              color: Color(0xFF999999),
                              icon: Icon(Icons.backspace),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                          : Container(),
                      actions: widget.actionBar)
                  : null,
              body: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Stack(children: <Widget>[widget.childView])),
                    )),
              ),
              floatingActionButton: widget.floatingButton,
            )));
  }
}
