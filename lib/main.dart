import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample_app/views/facts_image_list_title_info.dart';
import 'package:http/http.dart' as http;

import 'views/facts_details_page.dart';

void main() => runApp(RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  var _isLoading = true;
  var homes;

  _fetchData() async {
    final url = "http://139.59.67.104:8002/api/factapi";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      print(map[0]["home"]);

      final homesJson = map[0]["home"];
      setState(() {
        _isLoading = false;
        this.homes = homesJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Facts Nepal"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });

                  print("Refresh Button Pressed");
                  _fetchData();
                })
          ],
        ),
        body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.homes.length != null ? this.homes.length : 0,
                  itemBuilder: (context, i) {
                    final home = this.homes[i];

                    return new FlatButton(
                      padding: new EdgeInsets.all(0.0),
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => FactsDetailsPage(home)));
                          print("Facts Image Taped $i");
                        },
                        child: new FactsImageListTitleInfo(home));
//                    return FactsImageListTitleInfo(home);
                  },
                ),
        ),
      ),
    );
  }
}


