


import 'package:flutter/material.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:furniture_app/widgets/furniture_widget.dart';
import 'package:scoped_model/scoped_model.dart';


class CategoryDetails extends StatefulWidget {

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model){
      return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('${model.selectedCategory.name}',style: titleTextStyle,),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: mainIconColor),
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 28,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,size: 28,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,size: 28,))
        ],
      ),

      body: Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8), 
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: model.selectedCategory.furnitures.length,
              itemBuilder: (context,i){return FurnitureWidget(
                model.selectedCategory.furnitures[i]
              );}),
          ),


    );
    });
    
  }
}