
import 'package:flutter/material.dart';
import 'package:live_wallpaper/controller/api_controller.dart';
import '../models/wallpaper_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_searchbar.dart';
import 'full_screen.dart';

class SearchScreen extends StatefulWidget{
  String query;
  SearchScreen({super.key,required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<WallpaperModel> searchLiveWallpaper;
  bool isProcess = true;

  getSearchLiveWallpaper()async{
    searchLiveWallpaper = await ApiController.searchedWallpaper(widget.query);
    setState(() {
      isProcess = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchLiveWallpaper();
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
              margin: const EdgeInsets.only(right: 5,left: 5,top: 5,bottom: 20),
              height: 660,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 350,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: searchLiveWallpaper.length,
                  itemBuilder: ((context,index)=>InkWell(

                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imgUri: searchLiveWallpaper[index].imgSrc)));
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
                            searchLiveWallpaper[index].imgSrc),
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