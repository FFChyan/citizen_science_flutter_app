import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TokenCard extends StatelessWidget {
  final String time,
      no,
      state,
      checkPerson,
      checkTime;


  TokenCard(
      {Key key,
        this.time,
        this.no,
        this.state,
        this.checkPerson,
        this.checkTime,
      })
      : super(key: key);


//TODO 横向位置可能不对
  @override
  Widget build(BuildContext context) {
    Icon _stateIcon;
    if(state=="checked"){
      _stateIcon = Icon(Icons.check_circle,color: Color(0xff4caf50));
    }else if(state=="wrong"){
      _stateIcon = Icon(Icons.close,color: Colors.red[400]);
    }else{
      _stateIcon = Icon(Icons.help_outline,color: Colors.grey);
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 9.0, horizontal: 21.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      padding: EdgeInsets.all(21),
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
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    time,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                  Text(
                    "NO."+no,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 35,
            ),
//            Flexible(
//              flex: 2,
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    "$checkTime",
//                    overflow: TextOverflow.ellipsis,
//                    softWrap: false,
//                  ),
//                  Text(
//                    "$checkPerson",
//                    style: Theme.of(context).textTheme.subhead,
//                    overflow: TextOverflow.ellipsis,
//                    softWrap: false,
//                  ),
//                ],
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}