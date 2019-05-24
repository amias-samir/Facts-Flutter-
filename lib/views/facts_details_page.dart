import 'package:flutter/material.dart';

import '../main.dart';

class FactsDetailsPage extends StatelessWidget {
  final home;

  FactsDetailsPage(this.home);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Facts Details"),
      ),
      body: new FactsDetails(home),
    );
  }
}

class FactsDetails extends StatelessWidget {
  final home;

  FactsDetails(this.home);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              new Row(
                children: <Widget>[
                  new Container(
                    height: 6.0,
                  ),
                  new Text(
                    home["category_title"],
                    style: new TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.normal),
                  ),
                  new Column(children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: new EdgeInsets.only(left: 180.0),
                        child: new Text(
                          home["public_date"]!=null?"Date : "+home["public_date"]:"Date : "+"date not found",
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ])
                ],
              ),
            ],
          ),
        ),
        new Divider(),
        new Container(padding: EdgeInsets.all(16.0), child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              home["description"],
              style: new TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.normal),
            )
          ],
        ))
      ],
    );
  }
}
