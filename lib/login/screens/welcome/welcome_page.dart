import 'package:citizen_science/browserProject/browse_page.dart';
import 'package:citizen_science/drawer/drawer_of_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/login/components/forward_button.dart';
import 'package:citizen_science/login/components/trapozoid_cut_colored_image.dart';
import 'package:citizen_science/login/screens/welcome/welcome_animation.dart';
import 'package:citizen_science/login/utility/app_constant.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/login/screens/login/login_page.dart';

abstract class GoToLoginListener {
  void onGoAheadTap();

  var state = false;
}

//abstract class GoToSignUpListener {
//  void onGoAheadTap();
//  var state=false;
//}

class WelcomePage extends StatefulWidget {
  WelcomePage(
      {@required AnimationController controller,
      @required this.goToLoginListener,
      this.gotoWelcomeListener})
      : welcomeEnterAnimation = new WelcomeEnterAnimation(controller);

  final WelcomeEnterAnimation welcomeEnterAnimation;
  final GoToLoginListener goToLoginListener;
  final GoToWelcomeListener gotoWelcomeListener;

  _WelcomePage createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  String lastLoginUserName = '穆夏Mucha';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      children: <Widget>[
        _trapoziodView(size, textTheme),
        _buttonContainer(size),
      ],
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(0.0,
          -widget.welcomeEnterAnimation.translation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        color: Color(0xFFFFFF66),
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildTextHeader(size, textTheme),
          ],
        ),
      )),
    );
  }

  Widget _buttonContainer(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.7),
//    padding: EdgeInsets.all(0),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Transform(
                  transform: Matrix4.translationValues(
                      -widget.welcomeEnterAnimation.translation.value * 200,
                      0.0,
                      0.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: size.width * 0.1,
                      ),
                      Text(
                        "上次登录: ",
                        style: CSTextStyle.subtitleTextStyle,
                      ),
                      Text(
                        lastLoginUserName,
                        style: CSTextStyle.titleTextStyle,
                      )
                    ],
                  )
//                  child: HeaderText(
//                    text: "上次登录", // 登录过的名字
//                    imagePath: IMAGE_SLIPPER_PATH,
//                  ),
                  ),
            ),
//            SizedBox(
//              width: 16,
//            ),
            Transform(
              transform: Matrix4.translationValues(
                  widget.welcomeEnterAnimation.translation.value * 200,
                  0.0,
                  0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ForwardButton(
                    onPressed: () {
//                      widget.goToLoginListener.onGoAheadTap();
                      Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(builder: (context) {
                          return LeftDrawer();
                        }),
                      );
                    },
                    label: BUTTON_GOAHEAD,
                  ),
                  FlatButton(
                    child: Text(
                      "使用其他账号登录",
                      style: CSTextStyle.subtitleTextStyle.copyWith(
                          color: ThemeColorBlackberryWine.redWine[500],
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      widget.goToLoginListener.onGoAheadTap();
                      widget.goToLoginListener.state = true;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: new AssetImage(IMAGE_WELCOME_PATH),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return FadeTransition(
      opacity: widget.welcomeEnterAnimation.titleLabelOpacity,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: Container(
          width: double.infinity,
          child: Text(
            TEXT_WELCOME_LABEL,
            style: textTheme.title.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                wordSpacing: 1.2),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
