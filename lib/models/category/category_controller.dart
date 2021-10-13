

import 'dart:convert';

import 'package:furniture_app/models/category/category_model.dart';
import 'package:furniture_app/models/furniture/furniture_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin CategoryController on Model{

  List<CategoryModel> _allCategories=[];

  List<CategoryModel> get allCategories=>_allCategories;

  CategoryModel? _selectedCategory;

  CategoryModel get selectedCategory=>_selectedCategory!;

  bool _isDone=false;
  bool get isDone=>_isDone;

  //////////////////////////////////////////////////////////////////////

  selectCategory(String id){

    for(CategoryModel category in _allCategories){
      if(id==category.id){
        _selectedCategory=category;
        break;
      }

    }


  }



////////////////////////////////////////////////////////////////////
  getCategories()async{
List<CategoryModel>_getAllCategories=[];
    
    
    http.Response _response=await http.get(Uri.parse('https://furniture-app-7d192-default-rtdb.firebaseio.com/categories.json'));

    Map<String,dynamic> _data=json.decode(_response.body);

    _data.forEach((key, value) { 

      CategoryModel _newCategory=CategoryModel(key,value["name"],value["img"],value["items"]);
      value["furnitures"].forEach((furniture){

        FurnitureModel _newFurniture=FurnitureModel(furniture["id"],furniture["name"],furniture["img"],furniture["price"]);
        

        _newCategory.furnitures.add(_newFurniture);
      });
      _getAllCategories.add(_newCategory);
      
      });

    _allCategories=_getAllCategories;
    _isDone=true;
    notifyListeners();


  }
}