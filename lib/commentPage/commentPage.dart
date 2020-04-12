import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:citizen_science/commentPage/widget/stars.dart';

class CommentPage extends StatefulWidget {
  String star = "1";
  String projName = "布谷布谷鸟";
  String time = "2020-4-9 22:50";

//  CommentPage(String star,String who,String time){
//    this.star=star;
//    this.who=who;
//    this.time = time;
//  }

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Widget _buildBackgroundIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        child: new Image.asset(
          'assets/images/bugu.png', // personalImage
          fit: BoxFit.cover,
          height: 500,
          colorBlendMode: BlendMode.srcOver,
        ),
      ),
    );
  }

  Widget _buildShortDivider(MainAxisAlignment position) {
    return Row(
      mainAxisAlignment: position,
      children: <Widget>[
        SizedBox(
          width: 45,
          child: Divider(
            thickness: 4,
            color: ThemeColorBlackberryWine.orange[50],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _star;
    if (widget.star == "1") {
      _star = Star1();
    } else if (widget.star == "2") {
      _star = Star2();
    } else if (widget.star == "3") {
      _star = Star3();
    } else if (widget.star == "4") {
      _star = Star4();
    } else if (widget.star == "5") {
      _star = Star5();
    } else {
      _star = Star0();
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext _context, bool innerBoxlsScrolled) {
//            final Size size = MediaQuery.of(_context).size;
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              primary: true,
              // 是否预留高度
              forceElevated: true,
              automaticallyImplyLeading: true,
              backgroundColor: Colors.transparent,
              snap: false,
              expandedHeight: 350.0,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                stretchModes: <StretchMode>[StretchMode.fadeTitle],
                titlePadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                centerTitle: false,
                background: Stack(
                  children: <Widget>[
                    _buildBackgroundIamge(),
                    Positioned(
                      top: 350,
                      left: 10,
                      child: Container(
                        height: 100.0,
                        width: MediaQuery.of(context).size.width - 24.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2.0,
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2.0)
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Text(
                                  widget.projName,
                                  style: TextStyle(
                                      fontFamily: 'ConcertOne-Regular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green),
                                ),
                                Text(
                                  "   " + widget.time,
                                  style: TextStyle(
                                      fontFamily: 'ConcertOne-Regular',
                                      color: Colors.grey),
                                ),
                              ]),
                              _star,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 10,
              child: Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width - 24.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2.0,
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2.0)
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          widget.projName,
                          style: TextStyle(
                              fontFamily: 'ConcertOne-Regular',
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          "   " + widget.time,
                          style: TextStyle(
                              fontFamily: 'ConcertOne-Regular',
                              color: Colors.grey),
                        ),
                      ]),
                      _star,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, left: 20, right: 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    '科学家 / 助理的回复',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ConcertOne-Regular',
                        color: Colors.green[900]),
                  ),
                  _buildShortDivider(MainAxisAlignment.start),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论',
                    style: CSTextStyle.subtitleTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '我提交的数据',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ConcertOne-Regular',
                        color: Colors.green[900]),
                  ),
                  _buildShortDivider(MainAxisAlignment.start),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的详情不知道应该放用户提交的数据还是项目的',
                    style: CSTextStyle.subtitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
