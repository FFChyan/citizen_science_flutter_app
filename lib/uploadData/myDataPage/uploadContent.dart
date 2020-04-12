import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/uploadData/myDataClass/uploadInput.dart';
import 'package:citizen_science/uploadData/myDataClass/uploadItem.dart';


class UploadContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var uploadContent = [
      {
        'dataName': "data1",
        'dataType': "图片 .jpg/.jpeg/.png",
        'state': "correct",
      },
      {
        'dataName': "data2",
        'dataType': "文件 .txt",
        'state': "wrong",
      },
      {
        'dataName': "data3",
        'dataType': "*input",
        'state': "",
      },
      {
        'dataName': "data4",
        'dataType': "图片 jpg/jpeg/png",
        'state': "",
      },
      {
        'dataName': "data5",
        'dataType': "*input",
        'state': "",
      },
      {
        'dataName': "data6",
        'dataType': "*input",
        'state': "",
      },
      {
        'dataName': "data7",
        'dataType': "*input",
        'state': "",
      },
    ];

    List<Widget> _list = new List();
    for (int i = 0; i < uploadContent.length; i++) {
      if (uploadContent[i]['dataType'] == "*input") {
        _list.add(UploadInput(
          dataName: uploadContent[i]['dataName'],
          state: uploadContent[i]['state'],
        ));
      } else {
        _list.add(UploadItem(
          uploadContent[i]['dataName'],
          uploadContent[i]['dataType'],
          uploadContent[i]['state'],
        ));
      }
    }

    // TODO: implement build
    return new ListView(
      children: _list,
    );
  }
}
