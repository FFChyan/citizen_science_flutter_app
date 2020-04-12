import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';

//import "package:timeline/colors.dart";

/// Draws the search bar on top of the menu.
class SearchWidget extends StatelessWidget {
  /// These two fields are passed down from the [MainMenuWidget] in order to control
  /// the state of this widget depending on the users' inputs.
  final FocusNode _searchFocusNode;
  final TextEditingController _searchController;
  final BuildContext _context;

  SearchWidget(this._searchFocusNode, this._searchController, this._context,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Custom implementation of the Cupertino Search bar:
    /// a rounded rectangle with the search prefix icon on the left and the
    /// cancel icon on the right only when the widget is focused.
    /// The [TextField] displays a hint when no text has been input,
    /// and it updates the [_searchController] so that the [MainMenuWidget] can
    /// update the list of results underneath this widget.

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: ThemeColorBlackberryWine.lightGrey[100].withOpacity(0.6),
        borderRadius: BorderRadius.circular(24.0),
      ),
      height: 32.0,
      child: TextFormField(
        cursorColor: ThemeColorBlackberryWine.darkPurpleBlue[50],
        cursorWidth: 1.5,
        focusNode: _searchFocusNode,
        style: CSTextStyle.normal.copyWith(
            color: ThemeColorBlackberryWine.darkPurpleBlue[900],
            letterSpacing: 1,
            fontSize: 12),
        decoration: new InputDecoration(
          filled: true,
          border: InputBorder.none,
          hintText: "搜索",
          hintStyle: CSTextStyle.normal
              .copyWith(color: Colors.grey)
              .copyWith(fontSize: 11),
          prefixIcon: Icon(
            Icons.search,
            color: ThemeColorBlackberryWine.darkPurpleBlue[200],
          ),
          contentPadding: EdgeInsets.zero,
          fillColor: _searchFocusNode.hasFocus
              ? ThemeColorBlackberryWine.lightGrey[100].withOpacity(0.6)
              : Colors.transparent,
//          focusColor: ThemeColorBlackberryWine.lightGray[100],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        keyboardType: TextInputType.text,
        controller: _searchController,
      ),
//        child: TextField(
//          controller: _searchController,
//          focusNode: _searchFocusNode,
//          decoration: InputDecoration(
//              alignLabelWithHint: true,
//              hintText: "搜索关键字",
//              hintStyle: CSTextStyle.normal,
//              prefixIcon: Icon(
//                Icons.search,
//                color: ThemeColorBlackberryWine.darkBlue[50],
//              ),
//              suffixIcon: IconButton(
//                  icon: Icon(
//                    Icons.cancel,
//                    color: ThemeColorBlackberryWine.darkPurpleBlue[50],
//                  ),
//                  onPressed: () {
//                    _searchFocusNode.unfocus();
//                    _searchController.clear();
//                  }),
////                : null,
//              border: InputBorder.none),
//          style: TextStyle(
//            fontSize: 16.0,
//            fontFamily: "Roboto",
////            color: darkText.withOpacity(darkText.opacity),
//          ),
//        ),
    );
  }
}
