import 'package:flutter/material.dart';
import 'package:citizen_science/login/screens/login/login_page.dart';
import 'package:citizen_science/login/screens/onboarding/onboarding_animation.dart';
import 'package:citizen_science/login/screens/welcome/welcome_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin
    implements GoToLoginListener, GoToWelcomeListener {
  AnimationController animationControllerWelcome;
  AnimationController animationControllerLogin;

//  AnimationController animationControllerSignUp;

  OnBoardingEnterAnimation onBoardingEnterAnimation;

  int _contentScreenState;

  @override
  void initState() {
    super.initState();

    animationControllerLogin = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            print("AnimationStatus.forward");
            break;
          case AnimationStatus.reverse:
            print("AnimationStatus.reverse");
            break;
          case AnimationStatus.completed:
            print("AnimationStatus.completed");
            break;
          case AnimationStatus.dismissed:
            print("AnimationStatus.dismissed");
            setState(() {
              _contentScreenState = 3;
            });
            animationControllerLogin.forward();
            break;
        }
      })
      ..addListener(() {
        setState(() {});
      });

    animationControllerWelcome = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            break;
          case AnimationStatus.reverse:
            break;
          case AnimationStatus.completed:
            break;
          case AnimationStatus.dismissed:
            setState(() {
              _contentScreenState = 2;
            });
            animationControllerLogin.forward();
            break;
        }
      })
      ..addListener(() {
        setState(() {});
      });

    setState(() {
      _contentScreenState = 1;
    });

    onBoardingEnterAnimation =
        OnBoardingEnterAnimation(animationControllerLogin);

    animationControllerWelcome.forward();
  }

  @override
  void dispose() {
    animationControllerWelcome.dispose();
    animationControllerLogin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onBoardingEnterAnimation.colorAnimation.value,
        body: getCurrentWidget());
  }

  @override
  void onGoAheadTap() {
    animationControllerWelcome.reverse();
  }

  Widget getCurrentWidget() {
    switch (_contentScreenState) {
      case 1:
        return WelcomePage(
          controller: animationControllerWelcome,
          goToLoginListener: this,
          gotoWelcomeListener: this,
//          goToSignUpListener: this,
        );
      case 2:
//        print("2");
        return LoginPage(
          controller: animationControllerLogin,
          goToWelcomeListener: this,
          signUpMode: false,
        );
      case 3:
//        print("3");
        return LoginPage(
          controller: animationControllerLogin,
          goToWelcomeListener: this,
          signUpMode: true,
        );
      default:
        return Offstage();
    }
  }

  @override
  void onGoToWelcomeTap() {
    animationControllerLogin.reverse();
  }

  @override
  bool state;
}
