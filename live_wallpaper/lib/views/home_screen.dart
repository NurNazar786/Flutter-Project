
import 'package:flutter/material.dart';
import 'package:live_wallpaper/models/category_model.dart';
import 'package:live_wallpaper/views/full_screen.dart';
import '../controller/api_controller.dart';
import '../models/wallpaper_model.dart';
import '../widgets/category.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_searchbar.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<WallpaperModel> liveWallpaper;
  late List<CategoryModel> categoryWallpaper;
  bool isProcess = true;

  getLiveWallpaper() async{
    liveWallpaper = await  ApiController.getDynamicWallpaper();
    setState(() {
        isProcess = false;
    });

  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLiveWallpaper();
    categoryWallpaper = ApiController.getCategories()!;

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
         title: const CustomAppBar(),
       ),

      body: isProcess? const Center(child:CircularProgressIndicator(),): SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const CustomSearchBar()),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:categoryWallpaper.length,
                    itemBuilder: ((context,index)=>Category(
                      categoryName: categoryWallpaper[index].categorieName,
                      imgUrl: categoryWallpaper[index].imgUrl,
                    ))),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 20),
              height: 600,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 350,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
                  itemCount: liveWallpaper.length,
                  itemBuilder: ((context,index)=>InkWell(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUri: liveWallpaper[index].imgSrc)));
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
                            liveWallpaper[index].imgSrc),
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