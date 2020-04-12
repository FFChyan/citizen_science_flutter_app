import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/message/myMessageCard/messageCard.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key, this.bartitle}) : super(key: key);

  String bartitle;

  _MessagePage createState() => _MessagePage();
}

class _MessagePage extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    var dataCard = [
      {
        'time': "15 minutes ago",
        'from': "丁小开发天才",
        'state': '',
        'content':
            "回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复",
      },
      {
        'time': "15 minutes ago",
        'from': "丁小开发天才",
        'state': '',
        'content':
            "回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复",
      },
      {
        'time': "15 minutes ago",
        'from': "丁小开发天才",
        'state': "checked",
        'content':
            "回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复",
      },
      {
        'time': "15 minutes ago",
        'from': "丁小开发天才",
        'state': 'checked',
        'content':
            "回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复",
      },
    ];

    List<Widget> _list = new List();
    for (int i = 0; i < dataCard.length; i++) {
      _list.add(MessageCard(
        from: dataCard[i]['from'],
        time: dataCard[i]['time'],
        state: dataCard[i]['state'],
        content: dataCard[i]['content'],
      ));
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6699CC),
        title: Text(
          widget.bartitle,
          style: CSTextStyle.titleTextStyle
              .copyWith(fontSize: 18, color: Colors.white, letterSpacing: 3),
        ),
        elevation: 8,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.elliptical(40, 30),
          bottomLeft: Radius.elliptical(20, 10),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ListView(
          children: _list,
        ),
      ),
    );
  }
}
