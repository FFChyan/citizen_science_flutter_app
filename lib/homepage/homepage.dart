import 'package:citizen_science/personalTasks/diagonal_clipper.dart';
import 'package:citizen_science/projectDetail/personalprofile_and_username.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:citizen_science/projectDetail/circular_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  CircularBottomNavigationController navigationController;

  HomePage({Key key, this.navigationController}) : super(key: key);

  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<String> _newsImagesPath;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);

  List<String> _newsTitle;
  List<String> _newsSubTitle;

  @override
  void initState() {
    _newsImagesPath = [
      'assets/images/xinguan.png',
      'assets/images/pap.er/ImhNT6UAaGE.jpg',
      'assets/images/pap.er/W5XOhIfYs0.jpg',
    ];
    _newsTitle = ['新冠疫苗志愿者招募', '什么是候鸟迁徙？', '濒危物种红色名录——盘羊'];
    _newsSubTitle = [
      "查看详情查看详情查看详情查看详情查看详情查看详情查看详情",
      "查看详情查看详情查看详情查看详情查看详情查看详情查看详情",
      "查看详情查看详情查看详情查看详情查看详情查看详情"
    ];
    super.initState();
  }

  Widget _buildShortDivider(MainAxisAlignment position, double length) {
    return Row(
      mainAxisAlignment: position,
      children: <Widget>[
//        SizedBox(
//          width: leftSize,
//        ),
        SizedBox(
          width: length,
          child: Divider(
            thickness: 3,
            color: ThemeColorBlackberryWine.orange[50],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(String title, double length) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: CSTextStyle.largeTitleTextStyle.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: ThemeColorBlackberryWine.darkBlue[50],
              shadows: [
                Shadow(
                    color: Colors.black38,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 2.0),
              ],
            ),
          ),
          _buildShortDivider(MainAxisAlignment.start, length),
        ],
      ),
    );
  }

  Widget _buildsubTitle(String title, double length) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: CSTextStyle.titleWithShadow,
          ),
          _buildShortDivider(MainAxisAlignment.start, length),
        ],
      ),
    );
  }

  Widget _buildNewsCard(int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(_newsImagesPath[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: new LinearGradient(
                  colors: [Colors.black12, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              backgroundBlendMode: BlendMode.multiply,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _newsTitle[index],
                    style: CSTextStyle.titleTextStyle.copyWith(
                        color: ThemeColorBlackberryWine.lightGrey[50]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    _newsSubTitle[index],
                    style: CSTextStyle.subtitleTextStyle.copyWith(
                        color: ThemeColorBlackberryWine.lightGrey[50]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
//
          ),
        ),
      ),
    );
  }

  Widget _buildNewsPageView(Size size) {
    return Center(
      child: SizedBox(
//        width: size.width,
        height: 230,
        child: PageView(
//            itemCount: 3,
          controller: _pageController,
          children: <Widget>[
            _buildNewsCard(0),
            _buildNewsCard(1),
            _buildNewsCard(2),
          ],
//            itemBuilder: (context, index) {
//              _pageIndex = _pageController.page.floor();
//              return  Container(
//                  child: _buildNewsCard(index),
//              );
//            }
        ),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.fiber_manual_record,
            color: ThemeColorBlackberryWine.lightGrey,
          ),
          onPressed: () {
            _pageController.animateToPage(
              0,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeOutBack,
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.fiber_manual_record,
            color: ThemeColorBlackberryWine.lightGrey,
          ),
          onPressed: () {
            _pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeOutBack,
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.fiber_manual_record,
            color: ThemeColorBlackberryWine.lightGrey,
          ),
          onPressed: () {
            _pageController.animateToPage(
              2,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeOutBack,
            );
          },
        ),
      ],
    );
  }

  Widget _buildArticle() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Text(
            "公",
            style: CSTextStyle.largeTitleTextStyle,
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
            child: Text(
              "       众科学是指公众参与科学研究，无论是社区主导的研究还是全球调查。"
              "公众科学协会将来自教育工作者、科学家、数据管理人员和其他人的专业知识联合起来，"
              "为公众科学提供动力。加入我们，通过分享跨学科的见解来帮助加速创新。",
              style: CSTextStyle.subtitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEvents(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
            elevation: 4,
            child: Image(
              height: 120,
              width: size.width,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Webinars.png'),
            ),
          ),
//          Row(children: <Widget>[
//            Text(
//              "网络研讨会",
//              style:
//                  CSTextStyle.titleTextStyle.copyWith(color: Colors.blueGrey),
//            ),
//          ]),
          SizedBox(
            height: 20,
          ),
//          Divider(
//            height: 1.0,
//            indent: 20.0,
//            endIndent: 20.0,
////              color: Colors.grey,
//          ),
          SizedBox(
            height: 20,
          ),
          Material(
            elevation: 4,
            child: Image(
              height: 120,
              width: size.width,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/conference.png'),
            ),
          ),
//          Row(children: <Widget>[
//            Text(
//              "会议活动",
//              style:
//              CSTextStyle.titleTextStyle.copyWith(color: Colors.blueGrey),
//            ),
//          ]),
          SizedBox(
            height: 20,
          ),
//          Divider(
//            height: 1.0,
//            indent: 20.0,
//            endIndent: 20.0,
////              color: Colors.grey,
//          ),
          SizedBox(
            height: 20,
          ),
          Material(
            elevation: 4,
            child: Image(
              height: 120,
              width: size.width,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/monthly.png'),
            ),
          ),
//          Row(children: <Widget>[
//            Text(
//              "公民科学月",
//              style:
//              CSTextStyle.titleTextStyle.copyWith(color: Colors.blueGrey),
//            ),
//          ]),
          SizedBox(
            height: 20,
          ),
//          Divider(
//            height: 1.0,
//            indent: 20.0,
//            endIndent: 20.0,
////              color: Colors.grey,
//          ),
        ],
      ),
    );
  }

  Widget _buildFollowUs(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text("新浪微博：@公众科学Official"),
    );
  }

  Widget _buildPage(Size size) {
    return ListView(
      children: <Widget>[
        _buildArticle(),
        _buildTitle("新发布", 90),
        _buildNewsPageView(size),
        _buildDots(),
        _buildTitle("大事记", 90),
        _buildEvents(size),
        _buildTitle("历史活动记录", 180),
        _buildsubTitle("关注我们", 80),
        _buildFollowUs(size),
//        _buildArticle(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

//    return Scaffold(
//        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          title: const Text('Next page'),
//          backgroundColor: Colors.transparent,
//          elevation: 0,
//        ),
//        body: ListView(
//          children: <Widget>[
//            Container(
//              child: ClipPath(
//                clipper: new DialogonalClipper(),
//                child: new Image.asset(
//                  'assets/images/pap.er/URiPibO9QOw.jpg', // personalImage
//                  fit: BoxFit.cover,
////          height: 200,
//                  colorBlendMode: BlendMode.srcOver,
//                  color: new Color.fromARGB(60, 200, 200, 200),
//                ),
//              ),
//            ),
////        Stack(
////          children: <Widget>[
////            _buildBackgroundIamge(),
////          ],
////        ),
//          ],
//        ));
//  }

    return Container(
      color: Colors.white,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext _context, bool innerBoxlsScrolled) {
//            final Size size = MediaQuery.of(_context).size;
          return <Widget>[
            SliverAppBar(
                elevation: 0,
//                leading: IconButton(
//                  icon: Icon(
//                    Icons.arrow_back_ios,
//                    size: 20,
//                  ),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                ),
                primary: true,
                // 是否预留高度
                forceElevated: true,
                automaticallyImplyLeading: true,
//                titleSpacing: NavigationToolbar.kMiddleSpacing,
                backgroundColor: Colors.transparent,
                snap: false,
                expandedHeight: 500.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: <StretchMode>[StretchMode.fadeTitle],
                  titlePadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  centerTitle: false,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "欢迎来到公众科学",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            color: ThemeColorBlackberryWine.orange,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 3.0)
                            ]),
                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          SizedBox(width: 70,),
//                          Text(
//                            "公众的力量",
//                            style: CSTextStyle.titleTextStyle.copyWith(
//                                color: ThemeColorBlackberryWine.orange,
//                                fontStyle: FontStyle.italic,
//                                fontSize: 20,
//                                shadows: [
//                                  Shadow(
//                                      color: Colors.black54,
//                                      offset: Offset(4.0, 4.0),
//                                      blurRadius: 3.0)
//                                ]),
//                          ),
//                        ],
//                      ),
                    ],
                  ),

//                  title: Row(
//                    crossAxisAlignment: CrossAxisAlignment.end,
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      Container(
////                        width: size.width * 0.60,
//                        color: Color.fromARGB(150, 255, 255, 255),
//                        child: Text(
//                          "考拉宝宝保护计划",
//                          style: CSTextStyle.titleTextStyle.copyWith(
//                              color: ThemeColorBlackberryWine.darkPurpleBlue),
////                          textAlign: TextAlign.right,
//                        ),
//                      ),
//                    ],
//                  ),

//                  title: SearchWidget(
//                      _searchFocusNode, _searchController, context),
                  background: ClipPath(
                    clipper: new DialogonalClipper(),
                    child: new Image.asset(
                      'assets/images/pap.er/URiPibO9QOw.jpg', // personalImage
                      fit: BoxFit.cover,
//                      height: 500,
                      colorBlendMode: BlendMode.srcOver,
                      color: new Color.fromARGB(50, 200, 200, 200),
                    ),
                  ),
                )
//                        : null,
                )
          ];
        },
        body: _buildPage(size),
      ),
    );
  }
}
