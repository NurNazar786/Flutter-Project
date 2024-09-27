
import 'package:flutter/material.dart';
import 'package:live_wallpaper/views/full_screen.dart';
import '../controller/api_controller.dart';
import '../models/wallpaper_model.dart';
import '../widgets/custom_appbar.dart';

class CategoryScreen extends StatefulWidget{

  String categoryName;
  String categoryImage;

   CategoryScreen({super.key,required this.categoryName,required this.categoryImage});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  late List<WallpaperModel> categoriesWallpaper;
  bool isGetting = true;

  getCategoryWallpaper()async{
    categoriesWallpaper = await ApiController.getCategoryWallpaper(widget.categoryName);
    setState(() {
    isGetting = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryWallpaper();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const CustomAppBar(),
      ),

      body:isGetting ? const Center(child:CircularProgressIndicator(),):  SingleChildScrollView(
        child: Column(
          children: [


            Stack(
              children: [
                Image.network(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    widget.categoryImage),

                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black38,
                ),

                 Positioned(
                  left: 150,
                  top: 30,
                  child: Column(
                    children: [
                      const Text("Category",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w600),),
                      Text(widget.categoryName,style: const TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              height: 600,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 350,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categoriesWallpaper.length,
                  itemBuilder: ((context,index)=>InkWell(
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>FullScreen(imgUri: categoriesWallpaper[index].imgSrc)));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow,
                      ),
                      height: 800,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                            height: 800,
                            width: 150,
                            fit: BoxFit.cover,
                            categoriesWallpaper[index].imgSrc),
                      ),
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}