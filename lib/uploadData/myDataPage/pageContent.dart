import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/uploadData/myDataClass/MyPop.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:citizen_science/uploadData/myDataPage/uploadContent.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageContent extends StatefulWidget {
  PageContent({Key key, this.context2});

  BuildContext context2;

  _PageContent createState() => _PageContent();
}

class _PageContent extends State<PageContent> {
  String _projectName = "寻找布谷鸟";
  int _totalData = 5;
  var _isthumbsUp = false;
  var _isHearted = false;
  var _isJoined = false;
  var _isShared = false;
  FocusNode _inviteFocusNode = new FocusNode();
  TextEditingController _inviteController;

//  @override
//  void initState() {
//    // TODO: implement initState
//  }

  YYDialog inviteDialog() {
    return YYDialog().build(context)
      ..width = 220
      ..borderRadius = 15.0
      ..text(
        padding: EdgeInsets.fromLTRB(5.0, 20, 5, 0),
        alignment: Alignment.center,
        text: "我想邀请的用户：",
        color: ThemeColorBlackberryWine.darkPurpleBlue,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      )
      ..widget(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.bottom,
            cursorWidth: 1,
//                maxLength: 20,
            cursorColor: Colors.black54,
            controller: _inviteController,
            focusNode: _inviteFocusNode,
            style: CSTextStyle.subtitleTextStyle.copyWith(
                letterSpacing: 1,
                color: Colors.black54,
                fontWeight: FontWeight.w400),
//                textAlignVertical: TextAlignVertical.bottom,
//            decoration: InputDecoration(
//              contentPadding: EdgeInsets.only(top: 30, bottom: 5),
//              labelText: "我想邀请的用户：",
//              labelStyle: CSTextStyle.normal,
////                  hintText: "姓名"
//            ),
          ),
        ),
      )
      ..doubleButton(
        gravity: Gravity.center,
        withDivider: false,
        text1: "取消",
        color1: ThemeColorBlackberryWine.lightGrey[900],
        fontSize1: 14.0,
        fontWeight1: FontWeight.bold,
        onTap1: () {
          print("取消");
        },
        text2: "确定",
        color2: ThemeColorBlackberryWine.redWine,
        fontSize2: 14.0,
        fontWeight2: FontWeight.bold,
        onTap2: () {
          print("确定");
        },
      )
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 269,
//      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                  DropdownButton(
//                    underline: Container(),
//                    items: [
//                      DropdownMenuItem(
//                        //TODO 换页路由
//                        child: Text(
//                          "寻找布谷鸟",
//                          style: CSTextStyle.titleTextStyle.copyWith(
//                              color: ThemeColorBlackberryWine.darkPurpleBlue,
//                              fontSize: 15.0),
//                        ),
//                      ),
//                    ],
//                    onChanged: (data) {},
//                  ),
//                DropdownButton(
//                  underline: Container(),
//                  items: [
//                    DropdownMenuItem(
//                      child: Text(
//                        "寻找布谷鸟",
//                        style: TextStyle(color: Colors.white, fontSize: 15.0),
//                        overflow: TextOverflow.ellipsis,
//                      ),
//                    ),
//                  ],
//                  onChanged: (data) {},
//                ),
              ],
            ),
          ),
//          Divider(),
//            SizedBox(
//              height: 15,
//            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 30),
              Text("我上传的数据条数", style: Theme.of(context).textTheme.subhead),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _totalData.toString(),
                    style: CSTextStyle.largeTitleTextStyle,
                  ),
                  CustomButton(context2: widget.context2),
                ],
              ),
//              Divider(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(_projectName, style: CSTextStyle.titleTextStyle),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              _isHearted
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              color: Colors.white,
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                _isHearted = !_isHearted;
                              });
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_SHORT,
                                  msg: _isHearted ? "已关注" : "取消关注",
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 0,
                                  backgroundColor: Colors.white30,
                                  textColor: Colors.black54,
                                  fontSize: 16.0);
                            },
                          ),
//                          Text(
//                            "关注",
//                            style: CSTextStyle.button,
//                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              _isJoined ? Icons.star : Icons.star_border,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                _isJoined = !_isJoined;
                              });
                              Fluttertoast.showToast(
                                  msg: _isJoined ? '已加入' : "已退出项目",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.white30,
                                  textColor: Colors.black54,
                                  fontSize: 16.0);
                            },
                          ),

//                          Text(
//                            "加入",
//                            style: CSTextStyle.button,
//                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _isthumbsUp = !_isthumbsUp;
                              });
                              Fluttertoast.showToast(
                                  msg: _isthumbsUp ? '已点赞' : "取消点赞",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.white30,
                                  textColor: Colors.black54,
                                  fontSize: 16.0);
                            },
                            icon: Icon(
                              _isthumbsUp
                                  ? FontAwesomeIcons.solidThumbsUp
                                  : FontAwesomeIcons.thumbsUp,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
//                              setState(() {
//                                _isShared = !_isShared;
//                              });

                              inviteDialog();
                              Fluttertoast.showToast(
                                  msg: '分享成功',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIos: 1,
                                  backgroundColor: Colors.white30,
                                  textColor: Colors.black54,
                                  fontSize: 16.0);
                            },
                            icon: Icon(
                              FontAwesomeIcons.shareAlt,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({Key key, this.context2});

  BuildContext context2;

  @override
  Widget build(BuildContext context) {
    final popup = BeautifulPopup.customize(
      context: context2,
      build: (options) => MyTemplate(options),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          popup.show(title: '', content: UploadContent(), actions: [
            popup.button(
                label: '提交',
                onPressed: () {
                  Navigator.of(context2).pop();
                }),
          ]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "上传数据",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
