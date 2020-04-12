import 'dart:math' as math;

import 'package:citizen_science/commentPage/commentPage.dart';
import 'package:citizen_science/message/myMessage.dart';
import 'package:citizen_science/message/myMessagePage/messagePage.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation = new ColorTween(
            begin: ThemeColorBlackberryWine.redWine[300],
            end: ThemeColorBlackberryWine.redWine[500])
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: new AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(0, Icons.assignment, 0.0),
              _buildOption(1, Icons.mail_outline, -math.pi / 3),
              _buildOption(2, Icons.access_alarm, -2 * math.pi / 3),
              _buildOption(3, Icons.offline_pin, math.pi),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  void _navigator(int iconIndex) {
    switch (iconIndex) {
      case 0:
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) {
            return MessagePage(bartitle: "数据反馈");
          }),
        );
        break;
      case 1:
        Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) {
            return MessagePage(bartitle: "任务通知");
          }),
        );
        break;
      case 3:
        widget.onClick();
        break;
    }
  }

  Widget _buildOption(int iconIndex, IconData icon, double angle) {
    if (_animationController.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
//    print(angle.floor().toString() + icon.toString());
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new Padding(
          padding: new EdgeInsets.only(top: 8.0),
          child: new IconButton(
            onPressed: () {
              _navigator(iconIndex);
            },
            icon: new Transform.rotate(
              angle: -angle,
              child: new Icon(
                icon,
                color: Colors.white,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: new EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _animationController.value;
    return new Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
          shape: BoxShape.circle, color: ThemeColorBlackberryWine.redWine[200]),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return new FloatingActionButton(
      onPressed: _onFabTap,
      child: new Transform(
        alignment: Alignment.center,
        transform: new Matrix4.identity()..scale(1.0, scaleFactor),
        child: new Icon(
          _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
          color: Colors.white,
          size: 26.0,
        ),
      ),
      backgroundColor: _colorAnimation.value,
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconClick() {
    widget.onClick();
    close();
  }
}
