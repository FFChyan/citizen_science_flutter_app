import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

//TODO 上传文件

class UploadItem extends StatefulWidget {
  // UploadItem({Key key}) : super(key: key);
  String dataName, dataType, state;

  UploadItem(String dataName, String dataType, String state) {
    this.dataName = dataName;
    this.dataType = dataType;
    this.state = state;
  }

  _UploadItemState createState() => _UploadItemState();
}

class _UploadItemState extends State<UploadItem> {
  File _image;

  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Icon _stateIcon;
    String _dataType = widget.dataType;
    String _dataName = widget.dataName;
    if (widget.state == "correct") {
      _stateIcon = Icon(Icons.check, color: Colors.grey);
    } else if (widget.state == "wrong") {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$_dataType",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    "$_dataName",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 0,
            ),
            Flexible(
              flex: 1,
              child: FlatButton(
                child: Icon(Icons.file_upload),
                onPressed: () {
                  _getImageFromGallery();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
