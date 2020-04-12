import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/uploadData/myDataPage/pageContent.dart';
import 'myDataPage/dataCard.dart';

class MyData extends StatelessWidget {
  MyData({Key key, this.context2});

  BuildContext context2;

  Widget _buildBackgroundIamge() {
    return new Positioned(
      child: Container(
//        clipper: new DialogonalClipper(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pap.er/CIMk0FSOrAE.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.white12, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.white12,
            ),
          ),
        ),
//        child: new Image.asset(
//          'assets/images/pap.er/CIMk0FSOrAE.jpg', // personalImage
//          fit: BoxFit.cover,
////          height: 200,
//          colorBlendMode: BlendMode.softLight,
//          color: new Color.fromARGB(60, 200, 200, 200),
//        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackgroundIamge(),
        Positioned(
          child: PageContent(context2: context2),
          top: 40,
          right: 0,
          left: 0,
        ),
        Positioned(
          top: 250,
          bottom: 0,
          left: 0,
          right: 0,
          child: DataCard(
            context2: context2,
          ),
        ),
      ],
    );
  }
}
