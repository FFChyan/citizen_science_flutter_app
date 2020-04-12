import 'package:citizen_science/personalTasks/diagonal_clipper.dart';
import 'package:citizen_science/projectDetail/personalprofile_and_username.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:citizen_science/projectDetail/circular_bottom_navigation.dart';

class ProjectIntroduction extends StatefulWidget {
  CircularBottomNavigationController navigationController;

  ProjectIntroduction({Key key, this.navigationController}) : super(key: key);

  _ProjectIntroduction createState() => _ProjectIntroduction();
}

class _ProjectIntroduction extends State<ProjectIntroduction> {
  Widget _buildBackgroundIamge() {
    return new Positioned.fill(
      bottom: null,
      child: new ClipPath(
        clipper: new DialogonalClipper(),
        child: new Image.asset(
          'assets/images/pap.er/CIMk0FSOrAE.jpg', // personalImage
          fit: BoxFit.cover,
//          height: 200,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(60, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      top: 200,
      left: 20,
      child: Text(
        "考拉宝宝保护计划",
        style: CSTextStyle.hugeTitleTextStyle.copyWith(
            color: ThemeColorBlackberryWine.orange,
            fontStyle: FontStyle.italic,
            shadows: [
              Shadow(
                  color: Colors.black54,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 3.0)
            ]),
      ),
    );
//    return Text(
//      "考拉宝宝保护计划"
//    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: NestedScrollView(
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
//                titleSpacing: NavigationToolbar.kMiddleSpacing,
                backgroundColor: Colors.transparent,
                snap: false,
                expandedHeight: 220.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: <StretchMode>[StretchMode.fadeTitle],
                  titlePadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  centerTitle: false,
                  title: Text(
                    "考拉宝宝保护计划",
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
                      'assets/images/pap.er/CIMk0FSOrAE.jpg', // personalImage
                      fit: BoxFit.cover,
                      height: 200,
                      colorBlendMode: BlendMode.srcOver,
                      color: new Color.fromARGB(50, 20, 10, 40),
                    ),
                  ),
                )
//                        : null,
                )
          ];
        },
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Text(
                "项目故事",
                style: CSTextStyle.titleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "只要你主动，我们就会有故事。抱着沙发 睡眼昏花 凌乱头发却渴望像电影主角一样潇洒屋檐角下 "
                "排着乌鸦 密密麻麻被压抑的情绪不知如何表达无论我 在这里 在那里仿佛失魂的虫鸣却明白此刻应该做些努力无论我 "
                "在这里 在那里不能弥补的过去每当想起想过离开 以这种方式存在",
                style: CSTextStyle.subtitleTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "项目分类",
                style: CSTextStyle.titleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "哺乳动物纲 / 分布统计",
                style: CSTextStyle.subtitleTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "参与方式",
                style: CSTextStyle.titleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "项目地点: 澳大利亚\n"
                "起止时间: 2019年7月31日-2020年7月31日\n"
                "注意事项: 请勿为了拍照而影响考拉宝宝吃饭睡觉\n"
                "数据需求: \n"
                "1. GPS定位信息（自动采集）\n"
                "2. 您拍到的考拉宝宝照片（可选）\n"
                "3. 您看到的考拉数目（可选，默认为1）\n",
                style: CSTextStyle.subtitleTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "活动参与概况",
                style: CSTextStyle.titleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 4.0,
                  child: Container(
//                    color: Colors.black54,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20),
//                        image: DecorationImage(
//                          image: AssetImage(
//                              "assets/images/pap.er/CIMk0FSOrAE.jpg"),
//                          fit: BoxFit.cover,
//                        ),
//                      ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "54321",
                          style: CSTextStyle.hugeTitleTextStyle.copyWith(
                              letterSpacing: -2, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "参与人数",
                          style: CSTextStyle.normal.copyWith(
                              letterSpacing: 0, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "已报名志愿者",
                                style: CSTextStyle.subtitleTextStyle.copyWith(
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "查看更多",
                                    style: CSTextStyle.subtitleTextStyle
                                        .copyWith(
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                    color: Colors.black87,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: 90, maxWidth: size.width),
                          child: ListView.builder(
                              itemCount: 100,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return PersonalProfileAndUsername();
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "发起人",
                style: CSTextStyle.titleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    widget.navigationController.value = 1;
                    print("跳转到右边页面");
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    elevation: 4.0,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ClipOval(
                            child: Image(
                              image: AssetImage('assets/images/wfwys.png'),
                              width: 50,
                            ),
                          ),
                          Text(
                            "魏辅文 院士",
                            style: CSTextStyle.subtitleTextStyle
                                .copyWith(fontSize: 20),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
