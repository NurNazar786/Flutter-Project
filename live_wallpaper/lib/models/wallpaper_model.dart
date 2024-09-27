

class WallpaperModel {
  String imgSrc;
  String imgName;


  WallpaperModel({
    required this.imgName,
    required this.imgSrc
});

  static WallpaperModel liveWallpaper(Map<String,dynamic> photoMap){

    return WallpaperModel(imgSrc: (photoMap['src'])['portrait'],imgName: photoMap['photographer']);
  }

}