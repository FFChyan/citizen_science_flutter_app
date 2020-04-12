import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//TODO 输入时键盘挡文字

class UploadInput extends StatelessWidget {
  final String dataName, state;

  UploadInput({
    Key key,
    this.dataName,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Icon _stateIcon;
    if (state == "correct") {
      _stateIcon = Icon(Icons.check, color: Colors.grey);
    } else if (state == "wrong") {
      _stateIcon = Icon(Icons.close, color: Colors.grey);
    } else {
      _stateIcon = Icon(Icons.sync, color: Colors.grey);
    }
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: _stateIcon,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 7,
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Input："+"$dataName",
                      fillColor: Colors.black,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
