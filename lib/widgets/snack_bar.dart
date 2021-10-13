

import 'package:flutter/material.dart';


SnackBar snackBar(Color color,String messege){

  return SnackBar(
    content: Text("$messege"),
    backgroundColor: color,
    duration: Duration(seconds: 3),
  
  );
}