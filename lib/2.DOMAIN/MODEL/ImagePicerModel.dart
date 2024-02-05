import 'dart:io';

import 'package:clonetiktok/3.APPLICATION/VIEW/singInPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoPreview.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoReelHolder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class imagePickerModel { 


  Future pickGallery() async {

      await ImagePicker().pickVideo(source: ImageSource.gallery ).then((value) {

     if( value != null)  Get.to( videoPreviewPage(videoFile: File( value.path) , videoPath: value.path )) ;

       
     } );
  }


   Future pickCamera() async {

    //  final  image = await ImagePicker().pickVideo(source: ImageSource.camera );
    //   if( image == null ) return;
    //   final imagePath =  File(image.path);
    //   this.image = imagePath ;


    await ImagePicker().pickVideo(source: ImageSource.camera).then((value) { 

      //  if( value != null ) Get.to( videoPreviewPage(videoFile: File( value.path.toString()) , videoPath: value.path  ) );
       if( value != null ) Get.to( videoPreviewPage(videoFile: File( value.path) , videoPath: value.path ) );
    }); 
  }

   Future takeImageFromGallery  () async { 

     await ImagePicker().pickImage(source: ImageSource.gallery ).then(  (value) {
          if( value != null ) Get.to ( signInPage(   path: File( value.path)) );
          
     },)  ;
   }

   Future<void> takeImageFromCamera  () async { 
        await ImagePicker().pickImage(source: ImageSource.camera ).then(  (value) {
          if( value != null ) Get.to ( signInPage( path:  File( value.path) ) );
          
     },)  ;
      
   }

}