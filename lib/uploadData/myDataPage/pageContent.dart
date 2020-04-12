import 'package:citizen_science/theme/blackberrywine_themecolor.dart';
import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/uploadData/myDataClass/MyPop.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:citizen_science/uploadData/myDataPage/uploadContent.dart';

class PageContent extends StatelessWidget {
  PageContent({Key key, this.context2});

  BuildContext context2;

  String _projectName = "寻找布谷鸟";
  int _totalData = 10253;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 269,
//      color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DropdownButton(
                    underline: Container(),
                    items: [
                      DropdownMenuItem(
                        //TODO 换页路由
                        child: Text(
                          "寻找布谷鸟",
                          style: CSTextStyle.titleTextStyle.copyWith(
                              color: ThemeColorBlackberryWine.darkPurpleBlue,
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                    onChanged: (data) {},
                  ),
//                DropdownButton(
//                  underline: Container(),
//                  items: [
//                    DropdownMenuItem(
//                      child: Text(
//                        "寻找布谷鸟",
//                        style: TextStyle(color: Colors.white, fontSize: 15.0),
//                        overflow: TextOverflow.ellipsis,
//                      ),
//                    ),
//                  ],
//                  onChanged: (data) {},
//                ),
                ],
              ),
            ),
//          Divider(),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Total Data", style: Theme.of(context).textTheme.subhead),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _totalData.toString(),
                      style: Theme.of(context).textTheme.headline,
                    ),
                    CustomButton(context2: context2),
                  ],
                ),
//              Divider(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_projectName, style: CSTextStyle.titleTextStyle),
//                  FlatButton(
//                    child: Text(
//                      "留 言",
//                      style: TextStyle(color: Colors.white),
//                    ),
//                    onPressed: () {},
//                  )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({Key key, this.context2});

  BuildContext context2;

  @override
  Widget build(BuildContext context) {
    final popup = BeautifulPopup.customize(
      context: context2,
      build: (options) => MyTemplate(options),
    );
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          popup.show(title: '', content: UploadContent(), actions: [
            popup.button(
                label: 'Submit',
                onPressed: () {
                  Navigator.of(context2).pop();
                }),
          ]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                "Upload Data",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
