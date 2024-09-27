
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:live_wallpaper/views/category_screen.dart';

class Category extends StatefulWidget{

  String categoryName;
  String imgUrl;
  Category({super.key,required this.categoryName,required this.imgUrl});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        print("Category");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(categoryName: widget.categoryName,categoryImage: widget.imgUrl,)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),

        child: Stack(

          children:[

           ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                height: 50 ,
                width: 100,
                fit: BoxFit.cover,
                widget.imgUrl),
           ),

            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
             Positioned(
                left: 25,
                top: 15,
                child: Center(child: Text(widget.categoryName,style: TextStyle(color: Colors.white),)))
          ]
        ),
      ),
    );
  }
}