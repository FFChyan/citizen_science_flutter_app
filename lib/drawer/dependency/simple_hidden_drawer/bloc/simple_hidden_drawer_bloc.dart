import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../hidden_drawer/hidden_drawer_menu.dart';
import '../streams/streams_simple_hidden_menu.dart';

class SimpleHiddenDrawerBloc {
  /// builder containing the drawer settings
  final int _initPositionSelected;
  final Widget Function(int position, SimpleHiddenDrawerBloc bloc)
      _screenSelectedBuilder;

  StreamsSimpleHiddenMenu controllers = new StreamsSimpleHiddenMenu();

  bool _startDrag = false;
  bool _isFirstPositionSelected = true;
  int positionStected = 0;

  SimpleHiddenDrawerBloc(
      this._initPositionSelected, this._screenSelectedBuilder) {
    controllers.getpositionSelected.listen((position) {
      if (position != positionStected || _isFirstPositionSelected) {
        positionStected = position;
        _setScreen(position);

        if (!_startDrag && !_isFirstPositionSelected) {
          toggle();
        }
      } else {
        toggle();
      }

      _isFirstPositionSelected = false;
    });

    controllers.setPositionSelected(_initPositionSelected);
  }

  dispose() {
    controllers.dispose();
  }

  void toggle() {
    controllers.setActionToggle(null);
  }

  void setSelectedMenuPosition(int position) {
    controllers.setPositionSelected(position);
  }

  int getPositionSelected() {
    return positionStected;
  }

  Stream<int> getPositionSelectedListener() {
    return controllers.getpositionSelected;
  }

  Stream<MenuState> getMenuStateListener() {
    return controllers.getMenuState;
  }

  _setScreen(int position) {
    Widget screen = _screenSelectedBuilder(position, this);
    if (screen != null) {
      controllers.setScreenSelected(screen);
    }
  }
}
