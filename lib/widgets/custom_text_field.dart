import 'package:flutter/material.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';


class CustomTextField extends StatefulWidget {
  TextEditingController controller;

  CustomTextField(this.controller);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15)
      ),
      margin: EdgeInsets.all(20.0),
      child: TextFormField(

  controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined,color: mainIconColor,)),
          label:Text('Search Product',style: mainTextStyle,) ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,

          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.red,
              width: 0.5
            )
            ),

        ),
      ),
      
    );
  }
}