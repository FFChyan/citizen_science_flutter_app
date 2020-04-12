import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';

class MyTemplate extends BeautifulPopupTemplate {
  final BeautifulPopup options;

  MyTemplate(this.options) : super(options);

  @override
  final illustrationKey = 'assets/images/term.png';

  @override
  Color get primaryColor => options.primaryColor ?? Color(0xff20253d);
  @override
  final maxWidth = 500;
  @override
  final maxHeight = 700;
  @override
  final bodyMargin = 10;

  @override
  get layout {
    return [
      Positioned(
        child: background,
      ),
//      Positioned(
//        top: percentH(10),
//        child: title,
//      ),
      Positioned(
        top: percentH(30),
        //height: percentH(actions == null ? 32 : 42),
        height: percentH(55),
        left: percentW(10),
        right: percentW(10),
        child: content,
//        child: SingleChildScrollView(
//          child: SizedBox(
//            height: 700,
//            child: content,
//          ),
//        ),
      ),
      Positioned(
        bottom: percentW(5),
        left: percentW(15),
        right: percentW(15),
        child: actions ?? Container(),
      ),
    ];
  }
}
