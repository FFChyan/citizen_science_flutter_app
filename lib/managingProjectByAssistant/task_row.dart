import 'package:citizen_science/utils/task.dart';
import 'package:citizen_science/projectDetail/project_navigator.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostedTaskRow extends StatelessWidget {
  final Task task;
  final double dotSize = 12.0;
  final Animation<double> animation;

  const PostedTaskRow({Key key, this.task, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FadeTransition(
      opacity: animation,
      child: new SizeTransition(
          sizeFactor: animation,
          child: GestureDetector(
            onTap: () {
//              print("navigator");
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) {
                  return ProjDetailNavigator();
                }),
              );
            },
            child: new Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.symmetric(
                        horizontal: 32.0 - dotSize / 2),
                    child: new Container(
                      height: dotSize,
                      width: dotSize,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: task.color),
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          task.name,
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          task.category,
                          style:
                              new TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                        Row(
                          children: <Widget>[
                            new Icon(
                              Icons.priority_high,
                              size: 15,
                              color: ThemeColorBlackberryWine.orange[900],
                            ),
                            new SizedBox(
                              width: 5,
                            ),
                            new Text(
                              '有' + task.newDataNum.toString() + '条待评价的数据（请前往管理端查看）',
                              style: new TextStyle(
                                  color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: new Text(
                      task.time,
                      style: new TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
