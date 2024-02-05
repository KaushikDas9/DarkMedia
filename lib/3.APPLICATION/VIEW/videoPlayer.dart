import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class videoPlayer extends StatefulWidget {
  Uri? uri;
  videoPlayer({this.uri, super.key});

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {

  late VideoPlayerController videoController;
  bool videoPlayPause = false;
  bool videoMute = false;
  RxBool likeTap =false.obs ; 

  void videoPlayerControll() async {

    if (widget.uri != null) {
      
      videoController =  VideoPlayerController.networkUrl((widget.uri!))
        ..initialize().then((value) {
          setState(() {
            videoController.play();
            videoController.setLooping(true);
          });
        });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerControll();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          likeTap.value = !likeTap.value;
          videoPlayPause ? videoController.play() : videoController.pause();
          videoPlayPause = !videoPlayPause;
        },
        onDoubleTap: () {
          videoMute
              ? videoController.setVolume(1)
              : videoController.setVolume(0);
          videoMute = !videoMute;
        },
        child: Container(

          height: Get.height,
          width: Get.width,

          child: videoController.value.isInitialized && videoController.value.isPlaying
              ? AspectRatio(
                  aspectRatio: Get.width / Get.height ,
                  child: VideoPlayer(videoController)
                  )

              :  AspectRatio(
                  aspectRatio: Get.width / Get.height ,
                  child:const Center(child: CircularProgressIndicator())
                  ),
        ),
      ),
    );
  }
}
