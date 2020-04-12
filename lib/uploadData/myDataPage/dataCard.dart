import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:citizen_science/uploadData/myDataClass/TokenCard.dart';
import 'package:citizen_science/uploadData/myDataPage/uploadCard.dart';

class DataCard extends StatelessWidget {
  DataCard({Key key, this.context2});

  BuildContext context2;

  @override
  Widget build(BuildContext context) {
    var dataCard = [
      {
        'no': "100879",
        'time': "2019-06-20 15:32:41",
        'state': "checked",
        'checkPerson': "丁一芙",
        'checkTime': "2019-06-21",
      },
      {
        'no': "100880",
        'time': "2019-06-21 09:20:41",
        'state': "wrong",
        'checkPerson': "丁一芙",
        'checkTime': "2019-06-21",
      },
      {
        'no': "100881",
        'time': "2019-06-22 09:20:41",
        'state': "",
        'checkPerson': "",
        'checkTime': "",
      },
      {
        'no': "100882",
        'time': "2019-06-22 09:20:41",
        'state': "",
        'checkPerson': "",
        'checkTime': "",
      },
    ];

    List<Widget> _list = new List();
    _list.add(SingleChildScrollView(child: AddNewData(context2: context2)));
    for (int i = 0; i < dataCard.length; i++) {
      _list.add(TokenCard(
        no: dataCard[i]['no'],
        time: dataCard[i]['time'],
        state: dataCard[i]['state'],
        checkPerson: dataCard[i]['checkPerson'],
        checkTime: dataCard[i]['checkTime'],
      ));
    }

    // TODO: implement build
    return new SingleChildScrollView(
      child: Column(children: _list),
    );
  }
}
