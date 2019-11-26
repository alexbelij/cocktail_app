import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = "change me";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          elevation: 0.0,
          title: Center(child: Text("new app")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Image.network("https://www.happywalagift.com/wp-content/uploads/2015/08/Indian-Flag-Wallpapers-HD-photos.jpg",
              fit: BoxFit.contain,
              height: 200.0,
              width: 200.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    textScaleFactor: 2.0,
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      text = "it's change";
                      print(text);
                    },
                    child: Text("press me"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
