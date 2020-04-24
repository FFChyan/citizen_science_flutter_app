import 'package:citizen_science/postedProjectByScientists/task_row.dart';
import 'package:citizen_science/utils/animated_fab.dart';
import 'package:citizen_science/utils/diagonal_clipper.dart';
import 'package:citizen_science/utils/list_model.dart';
import 'package:citizen_science/utils/task.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:citizen_science/userSettings/user_settings_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'initial_list.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PostedProjectByScientists(),
    );
  }
}

class PostedProjectByScientists extends StatefulWidget {
  PostedProjectByScientists({Key key}) : super(key: key);

  @override
  _PostedProjectByScientists createState() => new _PostedProjectByScientists();
}

class _PostedProjectByScientists extends State<PostedProjectByScientists> {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  final double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  String _personalImage = 'assets/images/birds.jpg';
  String _personalProfile = 'assets/images/mucha_profile.jpg';
  String _userName = '穆科学Mucha';
  String _role = '科学家';

  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    tasks.forEach((element) {
      _tasks.add(element);
    });

    listModel = new ListModel(_listKey, _tasks);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
//          _buildPositioned(),
          _buildBackgroundIamge(),
//          _buildMenuHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
//          _buildBtn(),
        ],
      ),
    );
  }

  Widget _buildBtn() {
    return new Positioned(
        top: _imageHeight - 100.0,
        right: -40.0,
        child: new AnimatedFab(
          onClick: _changeFilterState,
        ));
  }

  void _changeFilterState() {
    showOnlyCompleted = !showOnlyCompleted;
    _tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(_tasks.indexOf(task), task);
      }
    });
  }

  Widget _buildBackgroundIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new DialogonalClipper(),
        child: new Image.asset(
          _personalImage, // personalImage
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildMenuHeader() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.menu, size: 32.0, color: Colors.white),
            onPressed: null,
          ),
          new Expanded(
            child: new Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Text(
                "", // 我的任务列表
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          new IconButton(
            icon: Icon(Icons.linear_scale, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return new Padding(
      padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: new Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) {
                  return UserSettings();
                }),
              );
            },
            child: CircleAvatar(
              minRadius: 28.0,
              maxRadius: 28.0,
              backgroundImage: new AssetImage(_personalProfile),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  _userName,
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                new Text(
                  _role,
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return new Padding(
      padding: new EdgeInsets.only(top: _imageHeight),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return new Expanded(
      child: new AnimatedList(
          initialItemCount: _tasks.length,
          key: _listKey,
          itemBuilder: (context, index, animation) {
            return new PostedTaskRow(
//                task: new ListModel(_listKey, _tasks)[index],
              task: listModel[index],
              animation: animation,
            );
          }),
    );
  }

  Widget _buildMyTasksHeader() {
    return new Padding(
      padding: new EdgeInsets.only(left: 40),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new SizedBox(
                width: 15,
              ),
              new Text(
                '已',
                style: CSTextStyle.hugeTitleTextStyle
                    .copyWith(color: ThemeColorBlackberryWine.darkBlue[800]),
              ),
              new Text(
                '发布的项目',
                style: CSTextStyle.titleTextStyle
                    .copyWith(color: ThemeColorBlackberryWine.darkBlue[100]),
                maxLines: 1,
              ),
            ],
          ),
//          Row(
//            children: <Widget>[
//              new SizedBox(
//                width: 20,
//              ),
//              new Text(
//                '已完成 2 / 5',
//                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
//              ),
//            ],
//          ),
          new SizedBox(
            height: 5,
          ),
//          Row(
//            children: <Widget>[
//              new Icon(
//                Icons.assignment,
//                size: 15,
//                color: ThemeColorBlackberryWine.orange[900],
//              ),
//              new SizedBox(
//                width: 5,
//              ),
//              new Text(
//                '有3条待评价的数据（请前往管理端查看）',
//                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
//              ),
//            ],
//          ),
          Row(
            children: <Widget>[
              new Icon(
                Icons.mail_outline,
                size: 15,
                color: ThemeColorBlackberryWine.redWine[100],
              ),
              new SizedBox(
                width: 5,
              ),
              new Text(
                '有2条新的助理申请（请前往管理端查看）',
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPositioned() {
    return new Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: new Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
