import 'dart:io';

import 'package:clonetiktok/2.DOMAIN/MODEL/ImagePicerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class videoAddPage extends StatefulWidget {
  const videoAddPage({super.key});

  @override
  State<videoAddPage> createState() => _videoAddPageState();
}

class _videoAddPageState extends State<videoAddPage> {
  @override
  Widget build(BuildContext context) {
    File? image;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog( title: "Pick Video From: " ,content: Column(children: [ 
                      ElevatedButton(onPressed: () { 
                         
                         // Image Picker Code for Gallery
                          imagePickerModel().pickGallery();

                       } , child:const Text("Gallery")),


                      ElevatedButton(onPressed: () { imagePickerModel().pickCamera(); } , child:const Text("Camera")),
                     ],),
                                       
                     );
                  },
                  child:const Text("add Video")),
            ),

            
             
                    
                  
          ],
        ),
      ),
    );
  }
}
