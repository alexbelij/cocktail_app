import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  final drink;
  const DrinkDetails({Key key, @required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.indigo[900],
            Colors.indigo[700],
            Colors.indigo[600],
            Colors.indigo[400],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(drink["strDrink"]),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  radius: 150.0,
                  backgroundImage: NetworkImage(
                    drink["strDrinkThumb"] ??
                        "https://moorestown-mall.com/noimage.gif",
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text("Drink Id :  ${drink["idDrink"]}",
                  style: TextStyle(color: Colors.blue, fontSize: 15.0)),
              SizedBox(
                height: 30.0,
              ),
              Text(" Drink name : ${drink["strDrink"]}",
                  style: TextStyle(color: Colors.blue, fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
