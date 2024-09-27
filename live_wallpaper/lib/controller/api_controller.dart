
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_wallpaper/models/wallpaper_model.dart';

import '../models/category_model.dart';
class ApiController {

  static List<WallpaperModel> liveWallpaper=[];
  static List<WallpaperModel> searchLiveWallpaper=[];
  static List<WallpaperModel> categoryWallpaper=[];

  static  Future<List<WallpaperModel>> getDynamicWallpaper() async{
    await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?page=2&per_page=70"),
        //GET https://api.pexels.com/v1/curated?page=2&per_page=40

    headers:{"Authorization":"hRgRbrRceNRqCxslTPp6p735NMFY82a2xCYVm75L9NFcuQUqJjQ9uSM0"}
    ).then((value) {

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];

      for (var element in photos) {
        liveWallpaper.add(WallpaperModel.liveWallpaper(element));
      }

    });

    return liveWallpaper;
  }

  static  Future<List<WallpaperModel>> searchedWallpaper(String query) async{
    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=40&page=1"),
        headers:{"Authorization":"hRgRbrRceNRqCxslTPp6p735NMFY82a2xCYVm75L9NFcuQUqJjQ9uSM0"}
    ).then((value) {

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
       searchLiveWallpaper.clear();
      for (var element in photos) {
        searchLiveWallpaper.add(WallpaperModel.liveWallpaper(element));
      }

    });

    return searchLiveWallpaper;
  }



  static List<CategoryModel>? getCategories() {

     List<CategoryModel> categories=[];
    CategoryModel categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "Street Art";
    categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "Wild Life";
    categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "Nature";
    categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "City";
    categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
     categoryModel.categorieName = "Motivation";
     categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "Bikes";
     categories.add(categoryModel);
     categoryModel = CategoryModel();

    //
     categoryModel.imgUrl =
    "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
     categoryModel.categorieName = "Cars";
    categories.add(categoryModel);
     categoryModel = CategoryModel();

     categoryModel.imgUrl =
     "https://images.pexels.com/photos/635279/pexels-photo-635279.jpeg?auto=compress&cs=tinysrgb&w=600";
     categoryModel.categorieName = "Ocean";
     categories.add(categoryModel);
     categoryModel = CategoryModel();

    return categories;
  }


  static  Future<List<WallpaperModel>> getCategoryWallpaper(String query) async{
    await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers:{"Authorization":"hRgRbrRceNRqCxslTPp6p735NMFY82a2xCYVm75L9NFcuQUqJjQ9uSM0"}
    ).then((value) {

      Map<String,dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      categoryWallpaper.clear();
      for (var element in photos) {
        categoryWallpaper.add(WallpaperModel.liveWallpaper(element));
      }

    });

    return categoryWallpaper;
  }

}