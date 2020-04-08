import 'package:citizen_science/userSettings/user_settings_main_page.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/drawer/dependency/hidden_drawer/hidden_drawer_menu.dart';
import 'package:citizen_science/personalTasks/personal_tasks_page.dart';
import 'package:citizen_science/browserProject/browse_page.dart';
import 'package:flutter/painting.dart';

class LeftDrawer extends StatelessWidget {
  final List<ScreenHiddenDrawer> itens = [
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "我参与的项目",
          colorLineSelected: Colors.lightGreenAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.lightGreenAccent),
        ),
        PersonalTasksPage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "搜索新项目",
          colorLineSelected: Colors.orange,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.orange),
          onTap: () {
            print("Click item");
          },
        ),
        BrowsePage()),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "设置",
          colorLineSelected: Colors.pinkAccent,
          baseStyle:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.pinkAccent),
          onTap: () {
            print("Click item");
          },
        ),
        UserSettings()),
  ];

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: itens,
//      backgroundColorMenu: Colors.cyan,
      backgroundMenu: DecorationImage(
          image: AssetImage("assets/images/pap.er/jb1Mc1lv8X0.jpg"),
          fit: BoxFit.fitHeight),
      //    typeOpen: TypeOpen.FROM_RIGHT,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
      //    slidePercent: 80.0,
      //    verticalScalePercent: 80.0,
      //    contentCornerRadius: 10.0,
      //    iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
      //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    backgroundColorAppBar: Colors.blue,
      //    elevationAppBar: 4.0,
      //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
      //    enableShadowItensMenu: true,
      //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    );
  }
}
