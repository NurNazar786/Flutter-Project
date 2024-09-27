
import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  String imgUri;
  FullScreen({super.key,required this.imgUri});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {

  late StreamSubscription progressStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if(event.status == DownloadStatus.successful){
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Downloaded Success")));
        });
        FlDownloader.openFile(filePath: event.filePath);
      }else if(event.status == DownloadStatus.running){
        setState(() {
         print("Downloading..");
        });
      }else if(event.status == DownloadStatus.failed){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Downloaded Failed")));
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async{
            // _downloadImage(imageUrl);
            var permission = await FlDownloader.requestPermission();
            if(permission == StoragePermissionStatus.granted){
              await FlDownloader.download(widget.imgUri);
            }else {
              print('Permission denied');
            }
         },
          child: const Text("Set Wallpaper"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,

        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imgUri),
              fit: BoxFit.cover
            )),
      ),
    );
  }

}