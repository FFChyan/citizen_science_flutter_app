import 'package:citizen_science/utils/animated_fab.dart';
import 'package:citizen_science/utils/diagonal_clipper.dart';
import 'package:citizen_science/personalTasks/initial_list.dart';
import 'package:citizen_science/utils/list_model.dart';
import 'package:citizen_science/utils/pageroute1.dart';
import 'package:citizen_science/utils/task.dart';
import 'package:citizen_science/personalTasks/task_row.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:citizen_science/userSettings/user_settings_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new PersonalTasksPage(),
    );
  }
}

class PersonalTasksPage extends StatefulWidget {
  PersonalTasksPage({Key key}) : super(key: key);

  @override
  _PersonalTasksPageState createState() => new _PersonalTasksPageState();
}

class _PersonalTasksPageState extends State<PersonalTasksPage> {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  final double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  String _personalImage = 'assets/images/birds.jpg';
  String _personalProfile = 'assets/images/mucha_profile.jpg';
  String _userName = '穆夏Mucha';
  String _role = '志愿者';

  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    tasks.forEach((element) {
      _tasks.add(element);
    });

    listModel = new ListModel(_listKey, _tasks);
  }

  YYDialog confirmDeleteDialog() {
    return YYDialog().build(context)
      ..width = 220
      ..borderRadius = 15.0
      ..text(
        padding: EdgeInsets.fromLTRB(5.0, 20, 5, 0),
        alignment: Alignment.center,
        text: "确认删除",
        color: ThemeColorBlackberryWine.darkPurpleBlue,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
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
          return false;
        },
        text2: "确定",
        color2: ThemeColorBlackberryWine.redWine,
        fontSize2: 14.0,
        fontWeight2: FontWeight.bold,
        onTap2: () {
          print("确定");
          return true;
        },
      )
      ..show();
  }

  Future<bool> showMyCupertinoDialog(BuildContext context) {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            title: new Text("确认退出项目"),
            content: new Text("blabla？"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  return true;
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  return false;
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
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
          _buildBtn(),
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
            return new Dismissible(
              //如果Dismissible是一个列表项 它必须有一个key 用来区别其他项
              key: Key('key$_listKey'),
              onDismissed: (direction) {
                print(direction);
                if (direction == DismissDirection.endToStart) {
                // 左滑取消参与
                _tasks.removeAt(index);
                //这个和Android的SnackBar差不多
//                  Scaffold.of(context).showSnackBar(
//                    new SnackBar(
//                      content: new Text(
//                        "$index dismissed",
//                        style: CSTextStyle.normal,
//                      ),
//                      duration: Duration(milliseconds: 500),
//                      backgroundColor: Colors.transparent,
//                      elevation: 0,
//                    ),
//                  );
                Navigator.of(context).pushReplacement(
                  animation_route(PersonalTasksPage()),
                );
                } else {}
              },
              confirmDismiss: (direction) async {
                if(direction == DismissDirection.endToStart) {
                  var res = showMyCupertinoDialog(context);
                  print(res);
                  return res;
                } else {
                  return false;
                }
              },
              //如果指定了background 他将会堆叠在Dismissible child后面 并在child移除时暴露
              background: Container(
                color: Colors.red,
                // 这里使用 ListTile 因为可以快速设置左右两端的Icon
                child: ListTile(
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Text(
                        "左滑退出项目",
                        style: CSTextStyle.button,
                      ),
                    ],
                  ),
                ),
              ),
              child: new TaskRow(
//                task: new ListModel(_listKey, _tasks)[index],
                task: listModel[index],
                animation: animation,
              ),
            );
//              onDismissed: (direction) {
//                // 删除后刷新列表，以达到真正的删除
//                setState(() {
//                  _tasks.removeAt(index);
//                  index = index - 1;
//                  listModel = new ListModel(_listKey, _tasks);
//                });
//              },
//              background: Container(
//                color: Colors.red,
//                // 这里使用 ListTile 因为可以快速设置左右两端的Icon
//                child: ListTile(
////                  leading: Icon(
////                    Icons.bookmark,
////                    color: Colors.white,
////                  ),
//                  trailing: Icon(
//                    Icons.delete,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
//              key: Key('key$_listKey'),
//              child: new TaskRow(
//                task: new ListModel(_listKey, _tasks)[index],
//                animation: animation,
//              ),
//            );
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
                '参',
                style: CSTextStyle.hugeTitleTextStyle
                    .copyWith(color: ThemeColorBlackberryWine.darkBlue[800]),
              ),
              new Text(
                '与中的项目',
                style: CSTextStyle.titleTextStyle
                    .copyWith(color: ThemeColorBlackberryWine.darkBlue[100]),
                maxLines: 1,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new SizedBox(
                width: 20,
              ),
              new Text(
                '已完成 2 / 5',
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
          new SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              new Icon(
                Icons.assignment,
                size: 15,
                color: ThemeColorBlackberryWine.orange[900],
              ),
              new SizedBox(
                width: 5,
              ),
              new Text(
                '有3条新收到的评价',
                style: new TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
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
                '有2条采集任务通知',
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
