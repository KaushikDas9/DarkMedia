import 'dart:io';
import 'package:clonetiktok/2.DOMAIN/Firebase/videoAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clonetiktok/1.DATA/DATASOURCES/fireBaseStorage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoAddPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';


class videoPreviewPage extends StatefulWidget {

  File? videoFile; String videoPath ;
   videoPreviewPage({ required this.videoFile , required this.videoPath , super.key});

  @override
  State<videoPreviewPage> createState() => _videoPreviewPageState();
}

class _videoPreviewPageState extends State<videoPreviewPage> {

  final getController = Get.put(upoloadVideoFirebase());

  late VideoPlayerController _videoController ;
  bool uploadProcess = false ;
  TextEditingController titleController = TextEditingController();
  TextEditingController captionController = TextEditingController();
 bool onTapPlaypause = false ;

   void videoPlayer ( )  { 
    

     if ( widget.videoFile != null ) { 
      _videoController = VideoPlayerController.file( widget.videoFile! )..initialize().then((_) {
        setState(() { _videoController.play();  _videoController.setLooping(true); });
      });
     }
   }
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayer();
  }
 
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: SingleChildScrollView(
         child: Column(
           children: [
         
             GestureDetector(

              onTap: (){  

                 onTapPlaypause ? _videoController.play() : _videoController.pause();
                 onTapPlaypause = !onTapPlaypause ;
               } ,

               onLongPress: () {  
                 
                 _videoController.setPlaybackSpeed(2.0);
               } ,
               onLongPressEnd: (_) =>  _videoController.setPlaybackSpeed(1.0),

               child: Container(
                 width: Get.width,height: Get.height *.65, color: Colors.amber,
             
                 //  video player 
                 
                 child: _videoController.value.isInitialized ? AspectRatio(aspectRatio: _videoController.value.aspectRatio , child:  VideoPlayer( _videoController),)   :  const Center(child: Text("Please seleact a correct file"))  ,
               ),
             ),
         
       
             
             Padding( padding:  EdgeInsets.only( left: Get.width * .05 , right: Get.width * .05 , top : Get.width * .02  ),child: TextField( decoration: InputDecoration(icon: Icon(Icons.tiktok_outlined)), controller: titleController , onEditingComplete: () => print(titleController.text.toString()), maxLength: 50,),
             ),
             Padding(padding:  EdgeInsets.symmetric(horizontal: Get.width * .05 ), child: SizedBox( height: Get.height *.15, child: TextField( decoration: InputDecoration( icon: Icon(Icons.description)), controller:captionController  , onEditingComplete: () => print(captionController.text.toString()), maxLines: 4,maxLength: 150,  )),
             ),

             Container( padding: EdgeInsets.only(right: Get.width * .04 , left: Get.width * .04,top: Get.width * .035 , ) ,width: Get.width ,child: Row ( mainAxisAlignment: MainAxisAlignment.spaceBetween, children:[ IconButton(onPressed: (){ Get.off(const videoAddPage() ) ; } , icon:const Icon( Icons.close_rounded ) ) , ElevatedButton(onPressed: (){ 

                  // Video FireStone e Upload and Fire Storage upload akane theke ho66e
                  //Fire store e list kora hoye66e

                   List<String> list;

                   setState(() {
                        uploadProcess = true ;
                      });


                    getController.uploadVideo( widget.videoPath ).then((value) {  

                      list = List.of(value) ;  
                     
                       videoAuth().uploadToFireStone(id: "Dite hobe", likes: [] , commentsCount: [] , shareCount: 1, songName: titleController.text.toString() , captions: captionController.text.toString() , videoUrl: list[0]  , thumbNail: list[1] );
                          
                          setState(() {
                            uploadProcess = false;
                          });
                        Get.back();
                      
                      } ) ;

       

              }, child:uploadProcess ?const SizedBox( height: 20 ,width: 20, child: CircularProgressIndicator() )     :const Text("Upload")) ])  )
           ],
         ),
       ),
    );
  }
}