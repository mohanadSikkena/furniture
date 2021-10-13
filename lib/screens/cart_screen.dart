

import 'package:flutter/material.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:furniture_app/widgets/furniture_widget.dart';
import 'package:scoped_model/scoped_model.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text("Shopping Cart",style: titleTextStyle,),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),iconSize: 25,color: mainIconColor,),
      ),
      body: ListView.builder(
        itemCount: model.cartItems.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){
          return FurnitureWidget(model.cartItems[index]);
        }),
      );
      });
  }
}