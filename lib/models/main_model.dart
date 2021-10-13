


import 'package:furniture_app/models/category/category_controller.dart';
import 'package:furniture_app/models/furniture/furniture_controller.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel  extends Model with CategoryController,FurnitureController{
}