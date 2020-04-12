import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:citizen_science/uploadData/myDataPage/uploadContent.dart';
import 'package:citizen_science/uploadData/myDataClass/MyPop.dart';
//import 'dart:js' as js;

class AddNewData extends StatelessWidget {
  AddNewData({Key key, this.context2});

  BuildContext context2;

  @override
  Widget build(BuildContext context) {
    final popup = BeautifulPopup.customize(
      context: context2,
      build: (options) => MyTemplate(options),
    );

    // TODO: implement build
    return GestureDetector(
      onTap: () {
        popup.show(title: '', content: UploadContent(), actions: [
          popup.button(
            label: '提交',
            onPressed: Navigator.of(context2).pop,
          ),
        ]);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: EdgeInsets.all(21),
        child: Row(
          children: <Widget>[
            Material(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add),
              ),
//            ),
            ),
            SizedBox(
              width: 21,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "上传新数据",
                  style: CSTextStyle.midtitleTextStyle,
                ),
//              Text(
//                "$_text",
//                style: Theme.of(context).textTheme.subhead,
//                overflow: TextOverflow.ellipsis,
//                softWrap: false,
//              ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
