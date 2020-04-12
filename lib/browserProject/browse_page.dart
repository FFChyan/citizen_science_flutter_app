import 'package:citizen_science/browserProject/search_widget.dart';
import 'package:citizen_science/projectDetail/circular_bottom_navigation.dart';
import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:citizen_science/browserProject/folding_cell_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

void main() {
  ScrollController _controller = new ScrollController();
  runApp(MaterialApp(
      home: Scaffold(
    body: Material(
//      color: Colors.black54,
      child: BrowsePage(),
    ),
//          floatingActionButton: Material(
//            shadowColor: ThemeColorBlackberryWine.darkPurpleBlue,
//            shape: new CircleBorder(),
//            color: ThemeColorBlackberryWine.darkPurpleBlue,
//            elevation: 4,
//            child: IconButton(
//              color: ThemeColorBlackberryWine.orange,
//              icon: Icon(
//                Icons.vertical_align_top,
//                size: 30,
//              ),
//              onPressed: () {
//                _controller.animateTo(0,
//                    duration: Duration(milliseconds: 200), curve: Curves.ease);
//              },
//            ),
  )));
}

class BrowseAllProjectPage extends StatefulWidget {
  _BrowseAllProjectFullPage createState() => _BrowseAllProjectFullPage();
}

class _BrowseAllProjectFullPage extends State<BrowseAllProjectPage> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar();
  }
}

class BrowsePage extends StatefulWidget {
  BrowsePage({Key key}) : super(key: key);

  _BrowsePage createState() => _BrowsePage();
}

/// Example 3 folding cell inside [ListView]
class _BrowsePage extends State<BrowsePage>
    with SingleTickerProviderStateMixin {
  FocusNode _searchFocusNode = FocusNode();
  TextEditingController _searchController = TextEditingController();
  CircularBottomNavigationController _navigationController =
      new CircularBottomNavigationController(0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _searchFocusNode.unfocus();
        },
        child: Container(
            color: ThemeColorBlackberryWine.lightGrey[50],
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext _context, bool innerBoxlsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        elevation: 0,
//                      leading: IconButton(
//                        icon: Icon(
//                          Icons.arrow_back_ios,
//                          size: 20,
//                        ),
//                        onPressed: () {},
//                      ),
//                bottom: PreferredSize(
//                    child: Text("butotn"), preferredSize: Size.infinite),
                        primary: true,
                        // 是否预留高度
                        forceElevated: true,
                        automaticallyImplyLeading: true,
//                titleSpacing: NavigationToolbar.kMiddleSpacing,
                        backgroundColor: Colors.transparent,
                        snap: false,
                        expandedHeight: 200.0,
                        floating: true,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          stretchModes: <StretchMode>[StretchMode.fadeTitle],
                          titlePadding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 60),
                          centerTitle: false,
                          title: SearchWidget(
                              _searchFocusNode, _searchController, context),
                          background: Image(
                            image: AssetImage("assets/images/login_bg1.jpg"),
                            colorBlendMode: BlendMode.darken,
                            color: new Color.fromARGB(60, 20, 10, 40),
                            fit: BoxFit.fill,
                          ),
                        )
//                        : null,
                        )
                  ];
                },
                body: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return SimpleFoldingCell(
                        cellSize: Size(MediaQuery.of(context).size.width, 200),
                        padding: EdgeInsets.all(15),
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: 10,
                        onOpen: () => print('$index cell opened'),
                        onClose: () => print(
                          '$index cell closed',
                        ),
                        navigationController: _navigationController,
                      );
                    }))));
  }
}
