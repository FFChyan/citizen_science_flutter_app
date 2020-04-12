import 'dart:ui';

//import 'package:ant_icons/ant_icons.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:citizen_science/userSettings/about_us/about_us.dart';
import 'package:citizen_science/userSettings/apply_authentication/apply_scientist_n_assist.dart';
import 'package:citizen_science/userSettings/general/general_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'apply_authentication/apply_scientist_n_assist.dart';
import 'notification_settings/notification_page.dart';

class UserSettings extends StatefulWidget {
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  Widget _buildDivider() {
    return Container(
      color: ThemeColorBlackberryWine.lightGrey[100],
      width: 10,
      height: 1,
      child: Divider(
        color: ThemeColorBlackberryWine.lightGrey[100],
        thickness: 0.7,
        height: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
//      body: Container(
//        color: Colors.white,
//        child: NestedScrollView(
//          headerSliverBuilder:
//              (BuildContext _context, bool innerBoxlsScrolled) {
//            return <Widget>[
//              SliverAppBar(
//                elevation: 0,
////                leading: IconButton(
//////                  icon: Icon(
//////                    Icons.arrow_back_ios,
//////                    size: 20,
//////                  ),
//////                  onPressed: () {
//////                    Navigator.of(context).pop();
//////                  },
////                ),
////                bottom: PreferredSize(
////                    child: Text("butotn"), preferredSize: Size.infinite),
//                primary: true,
//                // 是否预留高度
//                forceElevated: true,
//                automaticallyImplyLeading: true,
////                title: Text(
////                  "设置",
////                  style: CSTextStyle.titleTextStyle
////                      .copyWith(color: Colors.black54),
////                ),
////                titleSpacing: NavigationToolbar.kMiddleSpacing,
//                backgroundColor: Colors.transparent,
//                snap: false,
//                expandedHeight: 150.0,
//                floating: true,
//                pinned: false,
//                flexibleSpace: FlexibleSpaceBar(
//                  collapseMode: CollapseMode.pin,
//                  stretchModes: <StretchMode>[StretchMode.fadeTitle],
//                  titlePadding: EdgeInsets.only(
//                      top: 10, bottom: 10, left: 10, right: 150),
//                  centerTitle: false,
//                  title: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    children: <Widget>[
//                      CircleAvatar(
//                        minRadius: 28.0,
//                        maxRadius: 28.0,
//                        backgroundImage:
//                            new AssetImage("assets/images/mucha_profile.jpg"),
//                      ),
//                      Column(
//                        mainAxisAlignment: MainAxisAlignment.end,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            "穆夏Mucha",
//                            style: CSTextStyle.subtitleTextStyle
//                                .copyWith(fontSize: 20),
//                          ),
//                          Text("志愿者", style: CSTextStyle.normal),
//                        ],
//                      ),
//                    ],
//                  ),
//                  background: Container(
//                    color: Colors.white,
//                  ),
////                  Column(
////                    crossAxisAlignment: CrossAxisAlignment.start,
////                    children: <Widget>[
////                      Container(
////                    decoration: new BoxDecoration(
////                      image: DecorationImage(
////                          image: AssetImage("assets/images/mucha_profile.jpg"),
////                          fit: BoxFit.cover),
////                    ),
////                    child: BackdropFilter(
////                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
////                      child: Container(
////                        color: Colors.white30,
////                      ),
////                    ),
////                  ),
////                      Container(height: 50,color: Colors.yellowAccent,),
////                    ],
////                  ),
//
////                  BackdropFilter(
////                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
////                    child: Container(
////                      color: Colors.black12,
////                      child: Image(
////                        image: AssetImage("assets/images/mucha_profile.jpg"),
////                        colorBlendMode: BlendMode.hue,
////                        color: new Color.fromARGB(60, 20, 10, 40),
////                        fit: BoxFit.cover,
////                      ),
////                    ),
////                  ),
//                ),
//              ),
//            ];
//          },
      body: Container(
//        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CircleAvatar(
                    minRadius: 38.0,
                    maxRadius: 38.0,
                    backgroundImage:
                        new AssetImage("assets/images/mucha_profile.jpg"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "穆夏Mucha",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      Text("志愿者", style: CSTextStyle.subtitleTextStyle),
                    ],
                  ),
                ],
              ),
//          ],
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(
                height: 20,
              ),
//                  background: Container(
//                    color: Colors.white,
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Container(
//                    decoration: new BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage("assets/images/mucha_profile.jpg"),
//                          fit: BoxFit.cover),
//                    ),
//                    child: BackdropFilter(
//                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//                      child: Container(
//                        color: Colors.white30,
//                      ),
//                    ),
//                  ),
//                      Container(height: 50,color: Colors.yellowAccent,),
//                    ],
//                  ),

//                  BackdropFilter(
//                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
//                    child: Container(
//                      color: Colors.black12,
//                      child: Image(
//                        image: AssetImage("assets/images/mucha_profile.jpg"),
//                        colorBlendMode: BlendMode.hue,
//                        color: new Color.fromARGB(60, 20, 10, 40),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                ),
              _buildEntry(
                funcName: "申请身份认证",
                iconColor: ThemeColorBlackberryWine.darkBlue[50],
                // Color(0xFFAACCCC),
                icon: Icons.perm_contact_calendar,
                ontap: () {
                  print(
                    "申请身份认证",
                  );
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return ApplyScientistnAssist();
                    }),
                  );
                },
              ),
              _buildEntry(
                funcName: "个人统计",
                iconColor: Color(0xFF66BBBB),
                icon: Icons.equalizer,
                ontap: () {
                  print(
                    "个人统计",
                  );
                },
              ),
              _buildEntry(
                funcName: "提醒设置",
                iconColor: Colors.teal, // Color(0xFFCCAAAA),
                icon: Icons.sms,
                ontap: () {
                  print(
                    "提醒设置",
                  );
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return NotificationPage();
                  }));
                },
              ),
              _buildEntry(
                funcName: "主题颜色",
                icon: Icons.brush,
                iconColor: Color(0xFF6699FF),
                ontap: () {
                  print(
                    "主题颜色",
                  );
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new ListTile(
                              subtitle: Text("深紫 / 深红 / 浅灰"),
//                                leading: new Icon(Icons.fiber_manual_record),
                              title: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.fiber_manual_record,
                                    color:
                                        ThemeColorBlackberryWine.darkPurpleBlue,
                                  ),
                                  Icon(Icons.fiber_manual_record,
                                      color: ThemeColorBlackberryWine.redWine),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "黑莓酒",
                                    style: CSTextStyle.midtitleTextStyle,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("切换到BlackberryWine主题色");
                              },
                            ),
                            Container(
                              color: ThemeColorBlackberryWine.lightGrey[50],
                              width: size.width - 20.0,
                              height: 0.7,
                              child: Divider(),
                            ),
                            new ListTile(
                              subtitle: Text("明黄 / 藏蓝 / 浅灰"),
                              title: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.fiber_manual_record,
                                    color: ThemeColorBlackberryWine.orange,
                                  ),
                                  Icon(
                                    Icons.fiber_manual_record,
                                    color: ThemeColorBlackberryWine.darkBlue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "蓝橙",
                                    style: CSTextStyle.midtitleTextStyle,
                                  ),
                                ],
                              ),
                              onTap: () {
                                print("切换到orangeBlue主题色");
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      });
                },
              ),
              _buildEntry(
                ontap: () {
                  Fluttertoast.showToast(
                      msg: '推荐给朋友',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.white30,
                      textColor: Colors.black54,
                      fontSize: 16.0);
                },
                iconColor: Color(0xFF66CC99),
                icon: Icons.share,
                funcName: "推荐给朋友  ",
              ),
              _buildEntry(
                ontap: () {
                  Fluttertoast.showToast(
                      msg: '意见反馈',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.white30,
                      textColor: Colors.black54,
                      fontSize: 16.0);
                },
                iconColor: Color(0xFF0099CC),
                icon: Icons.library_books,
                funcName: "意见反馈",
              ),
              _buildEntry(
                funcName: "清理缓存",
                icon: Icons.settings,
                iconColor: Colors.blueGrey,
                ontap: () {
                  Fluttertoast.showToast(
                      msg: '清理缓存中',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.white30,
                      textColor: Colors.black54,
                      fontSize: 16.0);
                },
              ),
              _buildEntry(
                ontap: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
                iconColor: Color(0xFF336699),
                icon: Icons.people,
                funcName: "关于我们",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildEntry extends StatelessWidget {
  Function ontap;
  String funcName;
  Color iconColor;
  IconData icon;

  _buildEntry(
      {Key key,
      @required this.ontap,
      @required this.funcName,
      @required this.iconColor,
      @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  funcName,
                  style: CSTextStyle.settingEntry,
                  maxLines: 1,
                ),
//                SizedBox(
//                  width: 20,
//                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.chevron_right,
                size: 20,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
