import 'dart:ui';

//import 'package:ant_icons/ant_icons.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSettings extends StatefulWidget {
  _UserSettings createState() => _UserSettings();
}

class _UserSettings extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColorBlackberryWine.lightGray[50],
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext _context, bool innerBoxlsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
//                leading: IconButton(
////                  icon: Icon(
////                    Icons.arrow_back_ios,
////                    size: 20,
////                  ),
////                  onPressed: () {
////                    Navigator.of(context).pop();
////                  },
//                ),
//                bottom: PreferredSize(
//                    child: Text("butotn"), preferredSize: Size.infinite),
                primary: true,
                // 是否预留高度
                forceElevated: true,
                automaticallyImplyLeading: true,
//                titleSpacing: NavigationToolbar.kMiddleSpacing,
                backgroundColor: Colors.transparent,
                snap: false,
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    stretchModes: <StretchMode>[StretchMode.fadeTitle],
                    titlePadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                    centerTitle: false,
                    title: Text("穆夏Mucha"),
                    background: Container(
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/mucha_profile.jpg"),
                            fit: BoxFit.cover),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          color: Colors.black12,
                        ),
                      ),
                    )

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
                    ),
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print(
                      "申请身份认证",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.perm_contact_calendar,
                          size: 30,
                          color: Color(0xFFAACCCC),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "申请身份认证",
                          style: CSTextStyle.subtitleTextStyle
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: ThemeColorBlackberryWine.lightGray[100],
                  width: 10,
                  height: 1,
                  child: Divider(
                    color: ThemeColorBlackberryWine.lightGray[100],
                    thickness: 0.7,
                    height: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                      "消息设置",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.sms,
                          size: 30,
                          color: Color(0xFFCCAAAA),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "消息设置",
                          style: CSTextStyle.subtitleTextStyle
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: ThemeColorBlackberryWine.lightGray[100],
                  width: 10,
                  height: 1,
                  child: Divider(
                    color: ThemeColorBlackberryWine.lightGray[100],
                    thickness: 0.7,
                    height: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                      "通用",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          size: 30,
                          color: Color(0xFFDDDD99),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "通用",
                          style: CSTextStyle.subtitleTextStyle
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: ThemeColorBlackberryWine.lightGray[100],
                  width: 10,
                  height: 1,
                  child: Divider(
                    color: ThemeColorBlackberryWine.lightGray[100],
                    thickness: 0.7,
                    height: 10,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print(
                      "关于我们",
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.people,
                          size: 30,
                          color: Color(0xFFAACCAA),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "关于我们",
                          style: CSTextStyle.subtitleTextStyle
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
