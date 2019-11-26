import 'dart:convert';

import 'package:demo_app/screens/drink_detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CocktailApp extends StatefulWidget {
  CocktailApp({Key key}) : super(key: key);

  @override
  _CocktailAppState createState() => _CocktailAppState();
}

class _CocktailAppState extends State<CocktailApp> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail";
  var res, drinks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    // print(drinks.toString());

    setState(() {});
  }

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
            Colors.indigo[800],
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
            child: Text("Cocktail App"),
          ),
        ),
        body: Center(
              child: res != null
                  ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2

                    ),

                      itemCount: drinks.length,
                      itemBuilder: (context, index) {
                        var drink = drinks[index];
                        return ListTile(
                          leading: Hero(
                            tag: drink["idDrink"],
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                drink["strDrinkThumb"] ?? "https://moorestown-mall.com/noimage.gif",
                              ),
                            ),
                          ),
                          title: Text("${drink["strDrink"]}",
                              style: TextStyle(color: Colors.blue, fontSize: 20.0)),
                          subtitle: Text("${drink["idDrink"]}",
                              style: TextStyle(color: Colors.black, fontSize: 15.0)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrinkDetails(
                                          drink: drink,
                                        )));
                          },
                        );
                      },
                    )
                  : CircularProgressIndicator()),
        
      ),
    );
  }
}
