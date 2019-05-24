import 'package:flutter/material.dart';

class FactsImageListTitleInfo extends StatelessWidget {
  final home;

  FactsImageListTitleInfo(this.home);

  @override
  Widget build(BuildContext context) {
//    final home = this.homes[i];
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(home["image"]),
              new Container(
                height: 8.0,
              ),
              new Text(
                home["slug"],
                style:
                new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              new Container(
                height: 6.0,
              ),
              new Text(
                home["category_title"],
                style: new TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}