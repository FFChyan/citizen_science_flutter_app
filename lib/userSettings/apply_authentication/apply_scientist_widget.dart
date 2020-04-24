import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyScientist extends StatefulWidget {
  _ApplyScientist createState() => _ApplyScientist();
}

class _ApplyScientist extends State<ApplyScientist>
    with TickerProviderStateMixin {
  bool _tick = false;
  TextEditingController _nameController;
  TextEditingController _institutionNameController;
  TextEditingController _positionController;
  FocusNode _nameFocusNode = new FocusNode();
  FocusNode _institutionNameFocusNode = new FocusNode();
  FocusNode _positionFocusNode = new FocusNode();

  Widget _buildRect() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        color: Colors.white,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 80,
              ),
              Text(
                "科学家认证",
                style: CSTextStyle.titleTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: ThemeColorBlackberryWine.darkBlue,
                    shadows: [
                      Shadow(
                          color: Colors.black26,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0)
                    ]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "我觉得这里应该有一行小字但不知写啥",
                style: CSTextStyle.subtitleTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  color: ThemeColorBlackberryWine.darkBlue,
//                      shadows: [
//                        Shadow(
//                            color: Colors.black26,
//                            offset: Offset(2.0, 2.0),
//                            blurRadius: 2.0)
//                      ]
                ),
              ),
              Center(
                child: _buildShortDivider(MainAxisAlignment.center),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("一个像"),
                        Text("夏天"),
                      ],
                    ),
                    Icon(Icons.directions_walk),
                    Container(
                      color: Colors.black12,
                      width: 2,
                      height: 30,
                      child: Divider(),
                    ),
                    Column(
                      children: <Widget>[
                        Text("一个像"),
                        Text("秋天"),
                      ],
                    ),
                    Icon(Icons.music_note),
                  ],
                ),
              ),
//              SizedBox(
//                height: 50,
//              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShortDivider(MainAxisAlignment position) {
    return Row(
      mainAxisAlignment: position,
      children: <Widget>[
//        SizedBox(
//          width: leftSize,
//        ),
        SizedBox(
          width: 50,
          child: Divider(
            thickness: 5,
            color: ThemeColorBlackberryWine.orange[50],
          ),
        ),
      ],
    );
  }

  Widget _buildMemberCard() {
    return Padding(
      padding: EdgeInsets.only(top: 120),
      child: SizedBox(
        height: 300,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/membercard.png'),
            ),
//                      Text(
//                        "科学家认证",
//                        style: CSTextStyle.largeTitleTextStyle.copyWith(
//                            fontWeight: FontWeight.w600,
//                            color: ThemeColorBlackberryWine.darkBlue,
//                            shadows: [
//                              Shadow(
//                                  color: Colors.black26,
//                                  offset: Offset(2.0, 2.0),
//                                  blurRadius: 2.0)
//                            ]),
//                      ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 0,
            child: Container(
//                    color: Colors.black54,
              decoration: BoxDecoration(
//                backgroundBlendMode: BlendMode.multiply,
//                color: new Color.fromARGB(200, 20, 10, 40),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/ciyun3.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      _buildRect(),
                      _buildMemberCard(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "科学家认证条件",
                style: CSTextStyle.titleTextStyle,
              ),
              _buildShortDivider(MainAxisAlignment.start),
              Text(
                  "科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件科学家认证条件",
                  style: CSTextStyle.subtitleTextStyle),
              SizedBox(
                height: 30,
              ),
              Text(
                "学术诚信保证条例",
                style: CSTextStyle.titleTextStyle,
              ),
              _buildShortDivider(MainAxisAlignment.start),
              Text(
                  "保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书保证书",
                  style: CSTextStyle.subtitleTextStyle),
              SizedBox(
                height: 30,
              ),
              Text(
                "职责说明",
                style: CSTextStyle.titleTextStyle,
              ),
              _buildShortDivider(MainAxisAlignment.start),
              Text(
                  "职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明职责说明",
                  style: CSTextStyle.subtitleTextStyle),
              SizedBox(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      _tick ? Icons.check_box : Icons.check_box_outline_blank,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _tick = !_tick;
                      });
                    },
                  ),
//                  SizedBox(width: 5,),
                  Text(
                    "我已仔细阅读并同意上述协议",
                    style: CSTextStyle.subtitleTextStyle.copyWith(
                        fontSize: 16,
                        color: ThemeColorBlackberryWine.darkBlue[100],
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
//              TextFormField(
//                controller: _nameController,
//                focusNode: _nameFocusNode,
//                style: CSTextStyle.titleTextStyle.copyWith(
//                    letterSpacing: 3,
//                    color: Colors.black54,
//                    fontWeight: FontWeight.w400),
////                textAlignVertical: TextAlignVertical.bottom,
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.only(top: 20, bottom: 5),
//                  labelText: "姓名",
//                  labelStyle: CSTextStyle.normal,
////                  hintText: "姓名"
//                ),
//              ),
//              TextFormField(
//                textAlignVertical: TextAlignVertical.bottom,
//                cursorWidth: 1.5,
////                maxLength: 50,
//                cursorColor: Colors.black54,
//                controller: _institutionNameController,
//                focusNode: _institutionNameFocusNode,
//                style: CSTextStyle.titleTextStyle.copyWith(
//                    letterSpacing: 3,
//                    color: Colors.black54,
//                    fontWeight: FontWeight.w400),
////                textAlignVertical: TextAlignVertical.bottom,
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.only(top: 30, bottom: 5),
//                  labelText: "所属单位或机构",
//                  labelStyle: CSTextStyle.normal,
////                  hintText: "姓名"
//                ),
//              ),
//              TextFormField(
//                textAlignVertical: TextAlignVertical.bottom,
//                cursorWidth: 1.5,
//                cursorColor: Colors.black54,
//                controller: _positionController,
//                focusNode: _positionFocusNode,
//                style: CSTextStyle.titleTextStyle.copyWith(
//                    letterSpacing: 3,
//                    color: Colors.black54,
//                    fontWeight: FontWeight.w400),
////                textAlignVertical: TextAlignVertical.bottom,
//                decoration: InputDecoration(
//                  contentPadding: EdgeInsets.only(top: 30, bottom: 5),
//                  labelText: "职称（职位）",
//                  labelStyle: CSTextStyle.normal,
////                  hintText: "姓名"
//                ),
//              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "上传相关证件（或其他证明文件）正反面照片",
                    style: CSTextStyle.subtitleTextStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.file_upload,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                    onPressed: () {
                      print("传照片");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "上传简历",
                    style: CSTextStyle.subtitleTextStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.file_upload,
                      color: Colors.blueAccent,
                      size: 40,
                    ),
                    onPressed: () {
                      print("传简历");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: ThemeColorBlackberryWine.orange,
                    elevation: 4,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        "提交申请",
                        style: CSTextStyle.button.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
