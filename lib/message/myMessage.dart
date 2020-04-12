import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/message/myMessagePage/messagePage.dart';
//import 'package:citizen_science/uploadData/pageContent.dart';

class aMessagePage extends StatelessWidget {
  aMessagePage({Key key, this.bartitle}) : super(key: key);

  String bartitle;

//  _MessagePage createState()=> _MessagePage();
//
//}
//class _MessagePage extends State<MessagePage> {
//
//  String bartitle;
//
//  @override
//  void initState(){
//    bartitle = widget.bartitle;
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6699CC),
        title: Text(
          bartitle,
          style: CSTextStyle.titleTextStyle
              .copyWith(fontSize: 18, color: Colors.white, letterSpacing: 3),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: MessagePage(),

//        Stack(
//          children: <Widget>[
//            Positioned(
//              top: 20,
//              bottom: 0,
//              left: 0,
//              right: 0,
//              child: MessagePage(),
//            ),
//          ],
//        ),
      ),
    );
  }
}
