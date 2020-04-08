import 'package:citizen_science/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalCard extends StatefulWidget {
  PersonalCard({
    Key key,
    @required this.name,
    @required this.degree,
    this.profilePath,
  }) : super(key: key);

  final String name;
  final String degree;
  final String profilePath;

  _PersonalCard createState() => _PersonalCard();
}

class _PersonalCard extends State<PersonalCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipOval(
                    child: Image(
                      image: AssetImage(widget.profilePath),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.name + " " + widget.degree,
                    style: CSTextStyle.subtitleTextStyle.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
