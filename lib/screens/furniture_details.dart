import 'package:flutter/material.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:furniture_app/widgets/snack_bar.dart';
import 'package:scoped_model/scoped_model.dart';


class FurnitureScreen extends StatefulWidget {
  

  @override
  _FurnitureScreenState createState() => _FurnitureScreenState();
}

class _FurnitureScreenState extends State<FurnitureScreen> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model){
      return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),iconSize: 25,color: mainIconColor,),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("${model.selectedFurniture.img}"),fit: BoxFit.fill)
            ),
   
          ),

          ListTile(
            title: Text("${model.selectedFurniture.name}",style: mainTextStyle,),
            subtitle: Text('${model.selectedFurniture.name}',style: titleTextStyle,),
            trailing:Text('${model.selectedFurniture.price}\$',style: titleTextStyle,) ,
          ),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
            child: Text('Description',style: secondaryTextStyle,)),

        ],
      ),
      bottomSheet: Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: buttonColor)
            ),
              
              child: TextButton(onPressed: (){
                model.editFav(model.selectedFurniture);
                
              }, child: model.selectedFurniture.isFav==false?Icon(Icons.favorite_outline,color: buttonColor,):Icon(Icons.favorite,color: buttonColor,))),
            Container(
              width: MediaQuery.of(context).size.width-100,
              color: buttonColor,
              child: TextButton(onPressed: (){
                model.addToCart();
                ScaffoldMessenger.of(context).showSnackBar(model.addedToCart?snackBar(Colors.blue, "Successfully added to cart"):snackBar(Colors.red, "Furniture already in the cart"));


              }, child: Text('Add To Cart',style: TextStyle(color: Colors.white,fontSize: 20),)))
          ],
        ),
      ),


    );
    });
  }
}