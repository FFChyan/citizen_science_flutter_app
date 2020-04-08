import 'package:citizen_science/browserProject/folding_cell_widget.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circular_bottom_navigation.dart';
import 'clipoval_with_shadow.dart';
import 'person_card.dart';

class SponsorIntroduction extends StatefulWidget {
  CircularBottomNavigationController navigationController;
  BuildContext context;

  SponsorIntroduction({Key key, this.navigationController, this.context})
      : super(key: key);

  _SponsorIntroduction createState() => _SponsorIntroduction();
}

class _SponsorIntroduction extends State<SponsorIntroduction> {
  List<SimpleFoldingCell> _projs = [];
  List<PersonalCard> _assists = [];

  @override
  void initState() {
    double size = MediaQuery.of(widget.context).size.width;
    _projs.add(SimpleFoldingCell(
      cellSize: Size(size, 200),
      padding: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 300),
      borderRadius: 10,
//    onOpen: () => print('$index cell opened'),
//    onClose: () => print('$index cell closed'),
      navigationController: new CircularBottomNavigationController(0),
    ));
    _projs.add(SimpleFoldingCell(
      cellSize: Size(size, 200),
      padding: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 300),
      borderRadius: 10,
      navigationController: new CircularBottomNavigationController(0),

//    onOpen: () => print('$index cell opened'),
//    onClose: () => print('$index cell closed'),
    ));
    _assists.add(PersonalCard(
      name: "王小明",
      degree: "博士",
      profilePath: 'assets/images/pap.er/xHhaFZb_ln0.jpg',
    ));
    _assists.add(PersonalCard(
      name: "张三",
      degree: "副研究员",
      profilePath: 'assets/images/pap.er/SrbXjbo-XbQ.jpg',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    ClipOvalShadow(
                      shadow: Shadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/wfwys.png'),
                          width: 100,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "魏辅文 院士",
                      style:
                          CSTextStyle.subtitleTextStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "所属机构或单位：中国科学院动物研究所",
                      style: CSTextStyle.subtitleTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "2",
                          style: CSTextStyle.titleTextStyle,
                        ),
                        Text(
                          "发起项目",
                          style: CSTextStyle.subtitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.black12,
                    width: 2,
                    height: 30,
                    child: Divider(
//            color: ThemeColorBlackberryWine.lightGray[700],
//                      color: Colors.black,
//                      thickness: 1,
//                      height: 30,
                        ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "86576",
                          style: CSTextStyle.titleTextStyle.copyWith(
                            letterSpacing: -1,
                          ),
                        ),
                        Text(
                          "累计参与人数",
                          style: CSTextStyle.subtitleTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
//                  mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                      Text(
                        "研究方向",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "濒危动物保护基因组学、宏基因组学",
                        style: CSTextStyle.subtitleTextStyle,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "个人简介",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "魏辅文，男，1964年4月生于重庆市云阳县，籍贯重庆云阳，保护生物学家，中国科学院动物研究所研究员、博士生导师，中国科学院院士、发展中国家科学院院士。魏辅文院士长期从事濒危动物保护生物学研究，围绕物种濒危和适应性演化机制科学难题，以大熊猫为研究模型，取得系列重大突破性进展，是国际上濒危动物保护基因组学和宏基因组学研究的主要开拓者。重建了大熊猫的种群历史，阐明其濒危过程和原因，发现其仍具演化潜力；从形态、行为、生理、遗传和肠道微生物等方面系统揭示了大熊猫在食性转换和特化历程中适应性演化的机制，发现其对竹子已产生一系列适应，得到国际同行的高度认可；阐明了大熊猫孤立小种群崩溃的生态与遗传机制，推动了国家大熊猫放归和栖息地廊道建设工程的实施；发现大熊猫及其栖息地的生态系统服务价值远高于保护投入。为我国生态文明建设和濒危动物保护做出基础性和应用性的贡献！",
                        style: CSTextStyle.subtitleTextStyle,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "发起的项目",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
                      ),
//                  SimpleFoldingCell(
//                    cellSize: Size(MediaQuery.of(context).size.width, 200),
//                    padding: EdgeInsets.all(15),
//                    animationDuration: Duration(milliseconds: 300),
//                    borderRadius: 10,
////    onOpen: () => print('$index cell opened'),
////    onClose: () => print('$index cell closed'),
//                  ),
                    ] +
                    _projs,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "认证助理",
                        style: CSTextStyle.titleTextStyle.copyWith(
                            color: ThemeColorBlackberryWine.darkPurpleBlue[50]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ] +
                    _assists,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
