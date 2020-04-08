import 'package:citizen_science/drawer/drawer_of_menu.dart';
import 'package:citizen_science/login/utility/animated_button.dart';
import 'package:citizen_science/login/utility/expandable_container.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/login/components/header_text.dart';
import 'package:citizen_science/login/components/trapozoid_cut_colored_image.dart';
import 'package:citizen_science/login/screens/login/login_animation.dart';
import 'package:citizen_science/login/utility/app_constant.dart';
import 'package:citizen_science/login/utility/color_utility.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class GoToWelcomeListener {
  void onGoToWelcomeTap();
}

class LoginPage extends StatefulWidget {
  LoginPage(
      {@required AnimationController controller,
      @required this.goToWelcomeListener,
      this.signUpMode})
      : enterAnimation = new LoginEnterAnimation(controller);

  final GoToWelcomeListener goToWelcomeListener;
  final LoginEnterAnimation enterAnimation;
  final bool signUpMode;

  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with TickerProviderStateMixin {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var _obscureText = true;

//  String switchAuthString = "注册新账号";
  bool authModeIsSignUp = false;

  AnimationController _switchAuthController;
  AnimationController _switchAuthController2;
  AnimationController _postSwitchAuthController;
  AnimationController _loadingController;
  Animation<double> _buttonScaleAnimation;
  AnimationController _submitController;
  var _isLoading = false;
  var _isSubmitting = false;

  bool get buttonEnabled => !_isLoading && !_isSubmitting;

  void handleLoadingAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.forward) {
      setState(() => _isLoading = true);
    }
    if (status == AnimationStatus.completed) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadingController = (AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1150),
      reverseDuration: Duration(milliseconds: 300),
    )..value = 1.0);

    _loadingController?.addStatusListener(handleLoadingAnimationStatus);

    _switchAuthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _switchAuthController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _postSwitchAuthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _loadingController,
        curve: Interval(.4, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _submitController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    if (_submitController != null) _submitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

//    print("signupMode=" + widget.signUpMode.toString());

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _trapoziodView(size, textTheme),
          _buttonContainer(size, textTheme),
        ],
      ),
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, -widget.enterAnimation.Ytranslation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(size),
//            _buildTextHeader(size, textTheme),
            _buildForm(size, textTheme)
          ],
        ),
      )),
    );
  }

  Widget _buildForm(Size size, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.3, left: 40, right: 40),
      child: SingleChildScrollView(
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 8.0,
//                key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.01),
                child: _buildTextFormUsername(textTheme),
              ),
//              Padding(
//                padding: EdgeInsets.symmetric(
//                    horizontal: size.width * 0.1, vertical: 5),
//              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.01,
                ),
                child: _buildTextFormPassword(textTheme),
              ),
              ExpandableContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                    vertical: size.height * 0.01,
                  ),
                  child: _buildTextFormConfirmPassword(textTheme),
                ),
                controller: _switchAuthController,
                onExpandCompleted: () => _postSwitchAuthController.forward(),
              ),
//              SizedBox(
//                height: 5,
//              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: _buildForgotPasswordBtn(),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: _buildSubmitBtn(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormUsername(TextTheme textTheme) {
    return FadeTransition(
      opacity: widget.enterAnimation.userNameOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(
            color: ThemeColorBlackberryWine.darkPurpleBlue[900],
            letterSpacing: 1,
            fontSize: 18),
        decoration: new InputDecoration(
          filled: true,
          border: InputBorder.none,
//          hintText: "用户名",
          hintStyle: textTheme.subhead.copyWith(color: Colors.grey),
          prefixIcon: Icon(
            Icons.person,
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
          ),
          contentPadding: EdgeInsets.zero,
          fillColor: ThemeColorBlackberryWine.lightGray[50],
          labelStyle: textTheme.subhead.copyWith(color: Colors.grey),
          labelText: "用户名",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeColorBlackberryWine.darkPurpleBlue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        keyboardType: TextInputType.text,
        controller: userNameController,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buildTextFormPassword(TextTheme textTheme) {
    return FadeTransition(
      opacity: widget.enterAnimation.passowrdOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
            letterSpacing: 1,
            fontSize: 18),
        decoration: new InputDecoration(
          filled: true,
          border: InputBorder.none,
//          hintText: "密码",
          hintStyle: textTheme.subhead.copyWith(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.lock,
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscureText = !_obscureText),
//            dragStartBehavior: DragStartBehavior.down,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              firstCurve: Curves.easeInOutSine,
              secondCurve: Curves.easeInOutSine,
              alignment: Alignment.center,
              layoutBuilder: (Widget topChild, _, Widget bottomChild, __) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[bottomChild, topChild],
                );
              },
              firstChild: Icon(
                Icons.visibility,
                size: 25.0,
                semanticLabel: 'show password',
                color: ThemeColorBlackberryWine.darkPurpleBlue[500],
              ),
              secondChild: Icon(
                Icons.visibility_off,
                size: 25.0,
                semanticLabel: 'hide password',
                color: ThemeColorBlackberryWine.darkPurpleBlue[500],
              ),
              crossFadeState: !_obscureText
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          fillColor: ThemeColorBlackberryWine.lightGray[50],
          labelStyle: textTheme.subhead.copyWith(color: Colors.grey),
          labelText: "密码",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeColorBlackberryWine.darkPurpleBlue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        keyboardType: TextInputType.text,
        controller: passwordController,
        obscureText: _obscureText,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buildTextFormConfirmPassword(TextTheme textTheme) {
    return FadeTransition(
      opacity: widget.enterAnimation.passowrdOpacity,
      child: TextFormField(
        style: textTheme.title.copyWith(
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
            letterSpacing: 1,
            fontSize: 18),
        decoration: new InputDecoration(
          filled: true,
          border: InputBorder.none,
//          hintText: "密码",
          hintStyle: textTheme.subhead.copyWith(color: Colors.grey),
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.lock,
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => _obscureText = !_obscureText),
//            dragStartBehavior: DragStartBehavior.down,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              firstCurve: Curves.easeInOutSine,
              secondCurve: Curves.easeInOutSine,
              alignment: Alignment.center,
              layoutBuilder: (Widget topChild, _, Widget bottomChild, __) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[bottomChild, topChild],
                );
              },
              firstChild: Icon(
                Icons.visibility,
                size: 25.0,
                semanticLabel: 'show password',
                color: ThemeColorBlackberryWine.darkPurpleBlue[500],
              ),
              secondChild: Icon(
                Icons.visibility_off,
                size: 25.0,
                semanticLabel: 'hide password',
                color: ThemeColorBlackberryWine.darkPurpleBlue[500],
              ),
              crossFadeState: !_obscureText
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          fillColor: ThemeColorBlackberryWine.lightGray[50],
          labelStyle: textTheme.subhead.copyWith(color: Colors.grey),
          labelText: "确认密码",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: ThemeColorBlackberryWine.darkPurpleBlue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        keyboardType: TextInputType.text,
        controller: confirmPasswordController,
        obscureText: _obscureText,
        validator: (val) => val.length == 0
            ? PHONE_AUTH_VALIDATION_EMPTY
            : val.length < 10 ? PHONE_AUTH_VALIDATION_INVALID : null,
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return FadeTransition(
      opacity: widget.enterAnimation.forgotPasswordOpacity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ExpandableContainer(
            initialState: ExpandableContainerState.expanded,
            controller: _switchAuthController2,
            child: FlatButton(
              child: Text(
                "忘记密码",
                style: CSTextStyle.subtitleTextStyle.copyWith(
                    color: ThemeColorBlackberryWine.darkPurpleBlue[500],
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {},
            ),
          ),
          FlatButton(
            child: Text(
              authModeIsSignUp ? "已有账号" : "注册新账号",
              style: CSTextStyle.subtitleTextStyle.copyWith(
                  color: ThemeColorBlackberryWine.darkPurpleBlue[500],
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              if (!authModeIsSignUp) {
                setState(() {
                  _switchAuthController.forward();
                  authModeIsSignUp = !authModeIsSignUp;
//                  _switchAuthController2.reverse();
                });
              } else {
                setState(() {
                  _switchAuthController.reverse();
//                  _switchAuthController2.forward();
                  authModeIsSignUp = !authModeIsSignUp;
                });
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildSubmitBtn() {
    return FadeTransition(
      opacity: widget.enterAnimation.submitBtnOpacity,
      child: ScaleTransition(
        scale: _buttonScaleAnimation,
        child: AnimatedButton(
            color: ThemeColorBlackberryWine.darkPurpleBlue,
            loadingColor: ThemeColorBlackberryWine.redWine,
            controller: _submitController,
            text: authModeIsSignUp ? "立即注册" : "登录",
            onPressed: () {
              _submitController.forward();
              setState(() => _isSubmitting = true);
              Future.delayed(const Duration(milliseconds: 2700), () {
//                          setState(() => _showShadow = false);
                _submitController.reverse();
              }).then(
                (value) => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return LeftDrawer();
                  }),
                ),
              );
            }),
      ),
    );
  }

  Widget _buttonContainer(Size size, TextTheme textTheme) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildSocialMediaAppButton(COLOR_GOOGLE, IMAGE_PATH_GOOGLE, 48,
                widget.enterAnimation.googleScaleTranslation.value),
            SizedBox(
              width: 8,
            ),
            _buildSocialMediaAppButton(COLOR_FACEBOOK, IMAGE_PATH_FACEBOOK, 48,
                widget.enterAnimation.facebookScaleTranslation.value),
            SizedBox(
              width: 8,
            ),
            _buildSocialMediaAppButton(COLOR_TWITTER, IMAGE_PATH_TWITTER, 48,
                widget.enterAnimation.twitterScaleTranslation.value),
            SizedBox(
              width: 8,
            ),
//            IconButton(
//              icon: Icon(FontAwesomeIcons.accessibleIcon),
//              onPressed: () {},
//            ),
//            SizedBox(
//              width: size.width * 0.1,
//            ),
//            Transform(
//              transform: Matrix4.translationValues(
//                  widget.enterAnimation.translation.value * 200, 0.0, 0.0),
//              child: ForwardButton(
//                onPressed: () {
//                  widget.goToWelcomeListener.onGoToWelcomeTap();
//                },
//                label: "注册新账号",
//              ),
//            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaAppButton(
      String color, String image, double size, double animatedValue) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(animatedValue, animatedValue, 0.0),
      child: InkWell(
        onTap: null,
        child: Container(
          height: size,
          width: size,
          padding: const EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Color(getColorHexFromStr(color)),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(Size size) {
    return Opacity(
      opacity: 1,
//      padding: EdgeInsets.all(0),
//      EdgeInsets.only(top: size.height * 0.3),
      child: Container(
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: new AssetImage('assets/images/login_bg1.jpg'),
            fit: BoxFit.fitHeight,
//              colorFilter: ColorFilter.mode(Colors.white, BlendMode.overlay)
          ),
        ),
      ),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          -widget.enterAnimation.Xtranslation.value * size.width, 0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: HeaderText(
          text: TEXT_SIGN_IN_LABEL,
          imagePath: IMAGE_SLIPPER_PATH,
        ),
      ),
    );
  }
}
