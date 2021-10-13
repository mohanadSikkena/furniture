

import 'package:furniture_app/models/furniture/furniture_model.dart';

class CategoryModel{
  String id;
  String name;
  String img;
  List<FurnitureModel> furnitures=[];
  String items;
  CategoryModel(this.id,this.name,this.img,this.items);
}