import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'apply_assist_widget.dart';
import 'apply_scientist_widget.dart';

class ApplyScientistnAssist extends StatefulWidget {
  _ApplyScientistnAssist createState() => _ApplyScientistnAssist();
}

class _ApplyScientistnAssist extends State<ApplyScientistnAssist>
    with TickerProviderStateMixin {
  TabController _tabController;
  int pageIndex = 0;

//  PageController _pageController;
  var tabs = <Tab>[];

  void initState() {
    super.initState();
    pageIndex = 0;
    tabs = <Tab>[
      Tab(
        text: "认证科学家",
      ),
      Tab(
        text: "认证助理",
      ),
    ];

    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    if (_tabController != null) _tabController.dispose();
    super.dispose();
  }

  Widget _buildPageRoute() {
    if (pageIndex == 0) {
      return ApplyScientist();
    } else {
      return ApplyAssist();
    }
  }





  Widget _buildAssistPage() {
    return Container(
      child: Text("助理认证"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: ThemeColorBlackberryWine.darkBlue[200],
          elevation: 8,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomRight: Radius.elliptical(40, 30),
            bottomLeft: Radius.elliptical(20, 10),
          )),
          title: new TabBar(
            controller: _tabController,
            isScrollable: true,
            labelPadding: EdgeInsets.all(14),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: ThemeColorBlackberryWine.lightGrey[100],
            tabs: tabs,
            labelColor: ThemeColorBlackberryWine.lightGrey[50],
            labelStyle: TextStyle(
              fontSize: 20.0,
            ),
            unselectedLabelColor: ThemeColorBlackberryWine.lightGrey[300],
            unselectedLabelStyle: TextStyle(
              fontSize: 12.0,
            ),
            onTap: (index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
        body: _buildPageRoute(),
      ),
    );
  }
}

class FixTabBarView extends StatefulWidget {
  const FixTabBarView({
    Key key,
    @required this.children,
    @required this.tabController,
    @required this.pageController,
    this.physics,
    this.dragStartBehavior = DragStartBehavior.start,
  })  : assert(children != null),
        assert(dragStartBehavior != null),
        super(key: key);

  final TabController tabController;
  final PageController pageController;
  final List<Widget> children;
  final ScrollPhysics physics;
  final DragStartBehavior dragStartBehavior;

  @override
  _FixTabBarViewState createState() => _FixTabBarViewState();
}

class _FixTabBarViewState extends State<FixTabBarView> {
  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      dragStartBehavior: widget.dragStartBehavior,
      physics: widget.physics,
      controller: widget.pageController,
      children: widget.children,
      onPageChanged: (index) {
        widget.tabController.animateTo(index);
      },
    );
  }
}
