

import 'package:clonetiktok/2.DOMAIN/MODEL/videoUploadModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class videoAuth extends GetxController{

  Future<void> uploadToFireStone( { required String id , required List likes , required List commentsCount ,  required int shareCount , required String songName , required String captions ,  required String videoUrl , required String thumbNail } ) async { 
    
      Uuid uuid = const Uuid();

    try
    {
      String uid =  FirebaseAuth.instance.currentUser!.uid;
      
       id = uuid.v1(); 
       String? name ;

        await FirebaseFirestore.instance.collection("My User").doc(uid).get().then((value) { 
          Map<String , dynamic > data = value.data() as Map<String , dynamic > ;

            name =  data["Name"];
       });


      final model = videoModel(name: name ?? "No Name" , uid: uid, id: id.toString() , likes: likes, commentsCount: commentsCount , shareCount: shareCount, songName: songName, captions: captions, videoUrl: videoUrl, thumbNail: thumbNail);
     
      await FirebaseFirestore.instance.collection("Videos").doc(id.toString()).set( model.toJson() ).then((value) => Get.snackbar("uploaded","Upload successfully" )) ;
    
    }catch(e) { 
      Get.snackbar("error", " Video Upload problem");
    }
  } 

}