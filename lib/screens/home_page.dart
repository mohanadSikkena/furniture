import 'package:flutter/material.dart';
import 'package:furniture_app/models/main_model.dart';
import 'package:furniture_app/screens/cart_screen.dart';
import 'package:furniture_app/theme/shared_color.dart';
import 'package:furniture_app/theme/shared_font_style.dart';
import 'package:furniture_app/widgets/category_widget.dart';
import 'package:furniture_app/widgets/custom_text_field.dart';
import 'package:furniture_app/widgets/furniture_widget.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  MainModel model;
  HomePage(this.model);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController=TextEditingController();

  @override
  void initState() {
    functions();
     

    // TODO: implement initState
    super.initState();
  }

  void functions()async{
    await widget.model.getCategories();
    await widget.model.getAllFurnitures(widget.model.allCategories);
    await widget.model.getAllCart();

  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(builder: (context,child,MainModel model ){
      return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('Home',style: titleTextStyle,),
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: mainIconColor),
        leading: IconButton(onPressed:(){}, icon: Icon(Icons.menu,size: 28,)),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return CartScreen();
            }));
          }, icon: Icon(Icons.shopping_cart_outlined,size: 28,))
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          CustomTextField(searchController),
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: 
                NetworkImage("https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/08b6d354987911.5971a0fd31e99.jpg")
                ,fit: BoxFit.fill)
            ),
          ),

          ListTile(
            leading: Text('Categories',style: mainTextStyle,),
            trailing: Text('See all',style: secondaryTextStyle,),
          ),


          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.allCategories.length,
              itemBuilder: (context,i){return CategoryWidget(
                model.allCategories[i]
                
                

              );}),
          ),

          Container(
            height: model.allFurnitures.length%2==0?260*(model.allFurnitures.length.toDouble()/2):260*(model.allFurnitures.length.toDouble()/1.5),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8), 
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount:model.allFurnitures.length,
              itemBuilder: (context,i){return FurnitureWidget(
                model.allFurnitures[i]
              );}),
          )
        ],
        
      ),
    );
    });
  }
}