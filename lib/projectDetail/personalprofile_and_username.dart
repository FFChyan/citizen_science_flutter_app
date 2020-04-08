import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PersonalProfileAndUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
//            ClipOvalShadow(
//              shadow: Shadow(
//                color: Colors.black54,
//                offset: Offset(2.0, 2.0),
//                blurRadius: 1,
//              ),
//              clipper: CustomClipperOval(),
//              child:
//
              ClipOval(
                child: Image(
                  image: AssetImage('assets/images/travel.jpeg'),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
//            ),
            Text(
              "你*哥",
              style: CSTextStyle.subtitleTextStyle,
            ),
          ],
        ));
  }
}
