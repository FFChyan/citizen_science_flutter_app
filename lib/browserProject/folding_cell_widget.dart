import 'package:citizen_science/projectDetail/project_navigator.dart';
import 'package:citizen_science/projectDetail/project_intro.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' show Vector3;
import 'package:citizen_science/projectDetail/circular_bottom_navigation.dart';

/// Simple Folding Cell Widget by FaoB
class SimpleFoldingCell extends StatefulWidget {
  SimpleFoldingCell(
      {Key key,
//      @required this.frontWidget,
//      @required this.innerTopWidget,
//      @required this.innerBottomWidget,
      this.cellSize = const Size(100.0, 100.0),
      this.unfoldCell = false,
      this.skipAnimation = false,
      this.padding =
          const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 10),
      this.animationDuration = const Duration(milliseconds: 500),
      this.borderRadius = 0.0,
      this.onOpen,
      this.onClose,
      @required this.navigationController})
      :
//      : assert(frontWidget != null),
//        assert(innerTopWidget != null),
//        assert(innerBottomWidget != null),
        assert(cellSize != null),
        assert(unfoldCell != null),
        assert(skipAnimation != null),
        assert(padding != null),
        assert(animationDuration != null),
        assert(borderRadius != null && borderRadius >= 0.0),
        super(key: key);

  // Front widget in folded cell
//  final Widget frontWidget;

  /// Top Widget in unfolded cell
//  final Widget innerTopWidget;

  /// Bottom Widget in unfolded cell
//  final Widget innerBottomWidget;

  /// Size of cell
  final Size cellSize;

  /// If true cell will be unfolded when created, if false cell will be folded when created
  final bool unfoldCell;

  /// If true cell will fold and unfold without animation, if false cell folding and unfolding will be animated
  final bool skipAnimation;

  /// Padding around cell
  final EdgeInsetsGeometry padding;

  /// Animation duration
  final Duration animationDuration;

  /// Rounded border radius
  final double borderRadius;

  /// Called when cell fold animations completes
  final VoidCallback onOpen;

  /// Called when cell unfold animations completes
  final VoidCallback onClose;

  CircularBottomNavigationController navigationController;

  @override
  SimpleFoldingCellState createState() => SimpleFoldingCellState();
}

class SimpleFoldingCellState extends State<SimpleFoldingCell>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  AnimationController _animationController;
  Animation<double> opacityAnimation;
  AnimationController _controller;

  bool showText = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.onOpen != null) widget.onOpen();
      } else if (status == AnimationStatus.dismissed) {
        if (widget.onClose != null) widget.onClose();
      }
    });

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    opacityAnimation = new Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0,
        0.7,
        curve: Curves.easeIn,
      ),
    ));

    if (widget.unfoldCell) {
      _animationController.value = 1;
      isExpanded = true;
    }
  }

  @override
  void dispose() {
    if (_animationController != null) _animationController.dispose();
    if (_controller != null) _controller.dispose();
    super.dispose();
  }

  Widget _buildFrontWidget() {
    return Builder(
      builder: (BuildContext context) {
        final Size size = MediaQuery.of(context).size;
        return Padding(
          padding: EdgeInsets.all(15),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                if (showText == true) {
                  _controller.reset();
                  setState(() {
                    showText = !showText;
                  });
                  SimpleFoldingCellState foldingCellState =
                      context.ancestorStateOfType(
                          TypeMatcher<SimpleFoldingCellState>());
                  foldingCellState?.toggleFold();
                } else {
                  _controller.forward();
                  SimpleFoldingCellState foldingCellState =
                      context.ancestorStateOfType(
                          TypeMatcher<SimpleFoldingCellState>());
                  foldingCellState?.toggleFold();
                  Future.delayed(Duration(milliseconds: 500))
                      .then((value) => {setState(() => showText = !showText)});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("assets/images/pap.er/CIMk0FSOrAE.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: new LinearGradient(
                        colors: [Colors.black26, Colors.black87],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                    backgroundBlendMode: BlendMode.multiply,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.12,
                        left: size.width * 0.05,
                        right: size.width * 0.02),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: size.width * 0.5),
                            child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "考拉宝宝拯救计划",
                                  style: CSTextStyle.titleTextStyle.copyWith(
                                      color: ThemeColorBlackberryWine
                                          .lightGray[50]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "魏辅文院士 中科院动物研究所",
//                                  "中科院动物研究所中科院动物研究所中科院动物研究所中科院动物研究所中科院动物研究所中科院动物研究所中科院动物研究所",
                                  style: CSTextStyle.subtitleTextStyle.copyWith(
                                      color: ThemeColorBlackberryWine
                                          .lightGray[50]),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          isExpanded
                              ? IconButton(
                                  icon: ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/right_angle.png'),
                                    ),
                                  ),
                                  onPressed: () {
                                    print("进入新的项目页");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ProjDetailNavigator(),
//                                            ProjectIntroduction(
//                                          navigationController:
//                                              new CircularBottomNavigationController(
//                                                  0),
//                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInnerBottomWidget() {
    return Builder(
      builder: (context) {
        final Size size = MediaQuery.of(context).size;
        SimpleFoldingCellState foldingCellState =
            context.ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
        return Padding(
          padding: EdgeInsets.only(left: 15, right: 20, top: 15, bottom: 20),
          child: GestureDetector(
            onTap: () {
              setState(() {
                showText = !showText;
              });
              foldingCellState?.toggleFold();
              _controller.reset();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: new LinearGradient(
                    colors: [Colors.black26, Colors.black12],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                backgroundBlendMode: BlendMode.multiply,
              ),
              child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.2,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: size.height * 0.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      showText
                          ? FadeTransition(
                              opacity: opacityAnimation,
                              child: Text(
                                "项目详情项目详情项目\n详情项目详情项目详情项目详情项目详情项目详情目详详情项目详情项目\n详情项目详详情项目详情项目\n详情项目详情项目详情项目详情项目详情项目详情项目详情\n情项目详情项目详情项目详情项目详情项目详情\n情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情详情项目详情项目详情情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详情项目详\n",
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                                style:
                                    CSTextStyle.normal.copyWith(fontSize: 14),
                              ),
                            )
                          : Container(),
//                      Text("…"),
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
//          final angle = _animationController.value * math.pi;
          return Padding(
            padding: widget.padding,
            child: Container(
              color: Colors.transparent,
              height: widget.cellSize.height +
                  (widget.cellSize.height * _animationController.value),
              width: widget.cellSize.width,
              child: Stack(
                children: <Widget>[
//                  ClipRRect(
//                    borderRadius: BorderRadius.only(
//                        topLeft: Radius.circular(widget.borderRadius),
//                        topRight: Radius.circular(widget.borderRadius)),
//                    child: Container(
//                      height: widget.cellSize.height,
//                      width: widget.cellSize.width,
//                      child: widget.innerTopWidget,
//                    ),
//                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform:
                        Matrix4.translationValues(math.pi, math.pi, math.pi),
                    child: Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.translationValues(math.pi, math.pi, math.pi),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.borderRadius),
                            bottomRight: Radius.circular(widget.borderRadius)),
                        child: Container(
                          height: widget.cellSize.height * 2,
                          width: widget.cellSize.width,
//                          child: FadeTransition(
//                            opacity: opacityAnimation,
                          child: _buildInnerBottomWidget(),
//                          )
                        ),
                      ),
                    ),
                  ),
                  Transform(
                    alignment: Alignment.bottomCenter,
                    transform:
                        Matrix4.translationValues(math.pi, math.pi, math.pi),
//                    (Matrix4.identity()
//                      ..setEntry(3, 2, 0.001)
//                      ..rotateX(angle)),
                    child: Opacity(
//                      opacity: _animationController.value,
                      opacity: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(widget.borderRadius),
                            topRight: Radius.circular(widget.borderRadius)),
                        child: Container(
                          height: widget.cellSize.height,
                          width: widget.cellSize.width,
                          child: _buildFrontWidget(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void toggleFold() {
    if (isExpanded) {
      if (widget.skipAnimation) {
        _animationController.value = 0;
      } else {
        _animationController.reverse();
      }
    } else {
      if (widget.skipAnimation) {
        _animationController.value = 1;
      } else {
        _animationController.forward();
      }
    }
    isExpanded = !isExpanded;
  }
}
