// import 'package:demo_app/screens/cocktail_app.dart';
import 'package:demo_app/screens/cocktail.dart';
// import 'package:demo_app/screens/home.dart';
// import 'package:demo_app/screens/list_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CocktailApp() ,
      
    );
  }
}