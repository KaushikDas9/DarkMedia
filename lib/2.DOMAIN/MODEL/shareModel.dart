import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareModel {

  Future<void> onShare(BuildContext context , String link ) async {


    
     final result = await Share.share( "Yoo look at this  $link",
        subject: "This Entertainment Purpose" ,
        
        );

        //Kau jodi Fake Share O korche tahole o Done di66e , tai diye kono lav nai

      // result.status == ShareResultStatus.success   ? Get.snackbar("" , "Share Done") :Get.snackbar("" , "Done"); 

        
  }
}
