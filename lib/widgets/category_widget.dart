

import 'package:flutter/material.dart';
import 'package:furniture_app/models/category/category_model.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/screens/category_datails.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:scoped_model/scoped_model.dart';


class CategoryWidget extends StatefulWidget {
  CategoryModel categoryModel;
  CategoryWidget(this.categoryModel);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model){
      return InkWell(
      onTap: (){
        model.selectCategory(widget.categoryModel.id);
        
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return CategoryDetails();
        }));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
    
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: 
                  NetworkImage( '${widget.categoryModel.img}'),
                  fit: BoxFit.fill)
              ),
              
    
            ),
    
            Text('${widget.categoryModel.name}',style: mainTextStyle,),
            Text('${widget.categoryModel.items} items',style: thirdTextStyle,)
          ],
        ),
      ),
    );
    });
  }
}