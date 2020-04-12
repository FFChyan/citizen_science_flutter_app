import 'package:citizen_science/commentPage/commentPage.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//TODO 点击卡片变灰，状态传回数据库，点击跳转
class MessageCard extends StatefulWidget {
  final String time, from, content, state;

  MessageCard({
    Key key,
    this.time,
    this.from,
    this.content,
    this.state,
  }) : super(key: key);

  _MessageCard createState() => _MessageCard();
}

class _MessageCard extends State<MessageCard> {
  String state, content, time, from;

  @override
  void initState() {
    state = widget.state;
    content = widget.content;
    from = widget.from;
    time = widget.time;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Icon _stateIcon;
    Color _titleColor;
    print(state);
    if (state == "checked") {
      _stateIcon = Icon(Icons.done_all, color: Colors.grey);
      _titleColor = Colors.black54;
    } else {
      _stateIcon = Icon(Icons.notifications_none, color: Color(0xff4caf50));
      _titleColor = Colors.lightBlue[900];
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (context) => CommentPage()));
        },
        child: Column(
          children: <Widget>[
            Material(
//          borderRadius: BorderRadius.circular(15.0),
              elevation: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              _stateIcon,
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  from,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: _titleColor),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  " — " + time,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: _titleColor),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            content,
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2,
                                color: Colors.black54),
                            softWrap: true,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(
              height: 1.0,
              indent: 20.0,
              endIndent: 20.0,
//              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
