

import 'package:flutter/material.dart';
import 'package:furniture_app/models/furniture/furniture_model.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/screens/furniture_details.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:scoped_model/scoped_model.dart';


class FurnitureWidget extends StatefulWidget {
  FurnitureModel furniture;
  
  FurnitureWidget(this.furniture);

  @override
  _FurnitureWidgetState createState() => _FurnitureWidgetState();
}

class _FurnitureWidgetState extends State<FurnitureWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model){
      return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (_){
            model.selectFurniture(widget.furniture);
            return FurnitureScreen();}));
      },


      child: Container(
        margin: EdgeInsets.only(top: 10,right: 10,left: 10),
    
    
        child: Column(
          
          children: [
    
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){
                  model.editFav(widget.furniture);
                  
                }, 
              
              icon: 
              widget.furniture.isFav==false?Icon(Icons.favorite_outline,):Icon(Icons.favorite,color: buttonColor,)


              ,iconSize: 25,)),
    
            Container(
              height: 120,
              decoration: BoxDecoration(
                image:DecorationImage(image: NetworkImage('${widget.furniture.img}'),fit: BoxFit.fill)
              ),
            ),
            Text('${widget.furniture.name}',style: mainTextStyle,),
            Text('${widget.furniture.price}\$',style: mainTextStyle,)
    
    
    
          ],
        ),
        
      ),
    );
    });
  }
}