import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/main_model.dart';


void main(){
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(model: MainModel() , 
    child:ScopedModelDescendant(builder: (context,child,MainModel model){
       return MaterialApp(
      home: HomePage(model),
      debugShowCheckedModeBanner: false,
    );
    }) );
    
  }
}