import 'package:citizen_science/projectDetail/project_intro.dart';
import 'package:citizen_science/projectDetail/sponsor_intro.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/projectDetail/circular_bottom_navigation.dart';
import 'package:citizen_science/projectDetail/tab_item.dart';
import 'package:flutter_beautiful_popup/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ProjDetailNavigator(),
    );
  }
}

class ProjDetailNavigator extends StatefulWidget {
  _ProjDetailNavigator createState() => _ProjDetailNavigator();
}

class _ProjDetailNavigator extends State<ProjDetailNavigator> {
  static int selectedPage = 0;
  CircularBottomNavigationController _navigationController =
      new CircularBottomNavigationController(0);

  @override
  void initState(){
    selectedPage = 0;
  }

  @override
  void dispose() {
    if (_navigationController != null) _navigationController.dispose();
    super.dispose();
  }

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "项目介绍", ThemeColorBlackberryWine.darkPurpleBlue[50],
        labelStyle: CSTextStyle.subtitleTextStyle
            .copyWith(color: ThemeColorBlackberryWine.darkPurpleBlue[50])),
    new TabItem(
      Icons.search,
      "发起人",
      ThemeColorBlackberryWine.redWine[800],
      labelStyle: CSTextStyle.subtitleTextStyle
          .copyWith(color: ThemeColorBlackberryWine.redWine[800]),
    ),
    new TabItem(Icons.layers, "公开数据", ThemeColorBlackberryWine.darkBlue[50],
        labelStyle: CSTextStyle.subtitleTextStyle
            .copyWith(color: ThemeColorBlackberryWine.darkBlue[50])),
//    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);

  Widget _buildPage(int whichPage, BuildContext context) {
    switch (whichPage) {
      case 0:
        return ProjectIntroduction(navigationController: _navigationController);
      case 1:
        return SponsorIntroduction(
            navigationController: _navigationController, context: context);
      case 2:
        return Container(
          color: ThemeColorBlackberryWine.darkBlue[50],
        );
    }
  }

  Color _changeColor(int whichPage) {
    switch (whichPage) {
      case 0:
        return ThemeColorBlackberryWine.darkPurpleBlue[50];
      case 1:
        return ThemeColorBlackberryWine.redWine[800];
      case 2:
        return ThemeColorBlackberryWine.darkBlue[50];
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        body: _buildPage(selectedPage, context),
        bottomNavigationBar: CircularBottomNavigation(
          tabItems,
          barHeight: 60,
          normalIconColor: Colors.black,
          barBackgroundColor: Colors.transparent,
          controller: _navigationController,
          selectedCallback: (int selectedPos) {
            setState(() {
              selectedPage = selectedPos;
            });
            print("clicked on $selectedPos");
          },
        ),
      ),
    );
  }
}
