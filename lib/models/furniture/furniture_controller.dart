


import 'dart:convert';

import 'package:furniture_app/models/category/category_model.dart';
import 'package:furniture_app/models/furniture/furniture_model.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

mixin FurnitureController on Model{




  List<FurnitureModel> _allFurnitures=[];

  List<FurnitureModel> get allFurnitures=>_allFurnitures;

  List<FurnitureModel> _cartItems=[];

  List<FurnitureModel> get cartItems=>_cartItems;



  FurnitureModel? _selectedFurniture;

  FurnitureModel get selectedFurniture=>_selectedFurniture!;

  bool ?_addedToCart;
  bool get addedToCart=>_addedToCart!;



  getAllFurnitures(List<CategoryModel>allCategorys){
    
    List<FurnitureModel>_privAllFurnitures=[];
   allCategorys.forEach((element) { 
      element.furnitures.forEach((element) {
        _privAllFurnitures.add(element);
       });
    });
    _allFurnitures=_privAllFurnitures;
    notifyListeners();
  }


  ////////////////////////////////////////////////////////////////////////

  selectFurniture(FurnitureModel furnitureModel){

    for(FurnitureModel furniture in _allFurnitures){
      if(furnitureModel.id==furniture.id){
        _selectedFurniture=furniture;
        break;
      }
    }

  }

  ////////////////////////////////////////////////////////////////////////
  editFav(FurnitureModel furniture){

    furniture.isFav=!furniture.isFav;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////
  
  addToCart()async{
    bool contain=false;
    for (FurnitureModel furniture in _cartItems){
      if(_selectedFurniture!.id==furniture.id){
        contain=true;
        _addedToCart=false;     
        notifyListeners();   
      }
    }
    if(contain==false){
      _cartItems.add(_selectedFurniture!);
      _addedToCart=true;    
      notifyListeners();

      Map<String,dynamic> _furnitureData={
        "id":_selectedFurniture!.id,
        "name":_selectedFurniture!.name,
        "img":_selectedFurniture!.img,
        "price":_selectedFurniture!.price
      };
      http.Response _response=await http.put(Uri.parse("https://furniture-app-7d192-default-rtdb.firebaseio.com/cart/${_selectedFurniture!.id}.json"),
      body: json.encode(_furnitureData));


    }
  }

  /////////////////////////////////////////////////////////////////////////////////////
  
  getAllCart()async{
    List<FurnitureModel>_privateAllCart=[];
    http.Response _response=await http.get(Uri.parse("https://furniture-app-7d192-default-rtdb.firebaseio.com/cart.json"));

    Map<String,dynamic> _data=json.decode(_response.body);

      _data.forEach((key, value) { 
      FurnitureModel _newFurniture=FurnitureModel(value["id"],value["name"],value["img"],value["price"]);
      _privateAllCart.add(_newFurniture);
    });



    
    _cartItems=_privateAllCart;
    notifyListeners();


    
  }


}