import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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

  Widget _buildPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
//      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            '我们是谁',
            style: CSTextStyle.titleWithShadow,
          ),
          _buildShortDivider(MainAxisAlignment.start),
          Text(
            'WHO WE ARE',
            style: CSTextStyle.subtitleTextStyle
                .copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "公民科学协会（CSA）是一个成员驱动的组织，它围绕着一个共同的目标将来自广泛经验的人们联系在一起：通过公众，为公众以及与公众进行的研究和监测来增进知识。公民科学-这种实践最可识别的术语-几乎在每个研究领域都在扩大科学的范围，相关性和影响力；在现场和在线；通过本地和全球努力。随着对公民科学的日益关注，CSA深入了解了如何将公民科学理解为公众参与和研究，并阐明了实践的完整性和复杂性。 ",
            style: CSTextStyle.subtitleTextStyle,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '我们的核心服务',
            style: CSTextStyle.titleWithShadow,
          ),
          _buildShortDivider(MainAxisAlignment.start),
          Text(
            'OUR CORE SERVICES',
            style: CSTextStyle.subtitleTextStyle
                .copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "1. \n"
            "2. \n"
            "3. \n"
            "4. \n",
            style: CSTextStyle.subtitleTextStyle,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '我们的价值观',
            style: CSTextStyle.titleWithShadow,
          ),
          _buildShortDivider(MainAxisAlignment.start),
          Text(
            'OUR VALUES',
            style: CSTextStyle.subtitleTextStyle
                .copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "我们的多元化，尊重与协作，可及性，参与以及诚信和透明的价值观指导着我们的日常活动和对未来的展望。它们是我们推进目标，服务于我们的成员并与更广泛的个人和组织支持者合作以共同构建公民科学全球网络的基石。",
            style: CSTextStyle.subtitleTextStyle,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '联系我们',
            style: CSTextStyle.titleWithShadow,
          ),
          _buildShortDivider(MainAxisAlignment.start),
          Text(
            'CONTACT US',
            style: CSTextStyle.subtitleTextStyle
                .copyWith(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "邮箱"
            "新浪微博"
            "QQ"
            "微信",
            style: CSTextStyle.subtitleTextStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "关于我们",
          style: TextStyle(letterSpacing: 2),
        ),
        backgroundColor: ThemeColorBlackberryWine.orange[800],
        // Color(0xFFFFCC66),//
        elevation: 4,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomRight: Radius.elliptical(40, 30),
          bottomLeft: Radius.elliptical(20, 10),
        )),
      ),
      body: _buildPage(),
    );
  }
}
