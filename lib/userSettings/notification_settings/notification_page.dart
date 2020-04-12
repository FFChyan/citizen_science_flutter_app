import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  _NotificationPage createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  NotificationSettings _settings;

  void initState() {
    super.initState();
    _settings = new NotificationSettings(
      allowPushNotifications: true,
      newActivities: true,
      vibrate: true,
      newComment: true,
      sound: true,
      newInvitation: true,
    );
  }

  Widget _buildEntry(String str, String entryName) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                str,
                style:
                    CSTextStyle.midtitleTextStyle.copyWith(letterSpacing: 0.8),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              CupertinoSwitch(
                value: _settings.getValue(entryName),
                onChanged: (bool value) {
                  setState(() {
                    _settings.setValue(entryName, value);
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "全局设置",
              style: CSTextStyle.notificationTitle,
            ),
          ),
          _buildEntry("允许本应用推送消息", "allowPushNotifications"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "允许以下通知",
              style: CSTextStyle.notificationTitle,
            ),
          ),
          _buildEntry("采集任务通知", 'newInvitation'),
          SizedBox(
            height: 1,
          ),
          _buildEntry("数据标注与评价", 'newComment'),
          SizedBox(
            height: 1,
          ),
          _buildEntry("新活动信息", 'newActivities'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              "提醒方式",
              style: CSTextStyle.notificationTitle,
            ),
          ),
          _buildEntry("声音", 'sound'),
          _buildEntry("震动", 'vibrate'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColorBlackberryWine.lightGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text(
          "提醒设置",
          style: CSTextStyle.subtitleTextStyle
              .copyWith(fontSize: 18, color: Colors.white, letterSpacing: 3),
        ),
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//          topLeft: Radius.circular(0),
//          topRight: Radius.circular(0),
//          bottomRight: Radius.elliptical(40, 30),
//          bottomLeft: Radius.elliptical(40, 30),
//        )),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: _buildList(),
    );
  }
}

class NotificationSettings {
  NotificationSettings({
    Key key,
    @required this.allowPushNotifications,
    @required this.newActivities,
    @required this.newComment,
    @required this.newInvitation,
    @required this.sound,
    @required this.vibrate,
  });

  bool allowPushNotifications = true; // 允许推送，全局开关
  bool newInvitation = true; // 科学家新的邀请
  bool newComment = true; // 新的数据的标注与评价信息
  bool newActivities = true; // 新闻、新的活动

  bool sound = true; // 响铃
  bool vibrate = true; // 震动

  void setValue(String entryName, bool input) {
    switch (entryName) {
      case 'allowPushNotifications':
        allowPushNotifications = input;
        break;
      case 'newInvitation':
        newInvitation = input;
        break;
      case 'newComment':
        newComment = input;
        break;
      case 'newActivities':
        newActivities = input;
        break;
      case 'sound':
        sound = input;
        break;
      case 'vibrate':
        vibrate = input;
        break;
    }
  }

  bool getValue(String entryName) {
    switch (entryName) {
      case 'allowPushNotifications':
        return allowPushNotifications;
      case 'newInvitation':
        return newInvitation;
      case 'newComment':
        return newComment;
      case 'newActivities':
        return newActivities;
      case 'sound':
        return sound;
      case 'vibrate':
        return vibrate;
    }
  }
}
