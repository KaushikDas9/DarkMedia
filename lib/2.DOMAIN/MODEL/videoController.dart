import 'package:clonetiktok/2.DOMAIN/MODEL/ProfilePage/LikesCount.dart';
import 'package:clonetiktok/2.DOMAIN/MODEL/videoUploadModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class videoController extends GetxController { 

      // late RxList<List<videoModel>> videoList  ;
      

      final Rx<List<videoModel>> videoList = Rx<List<videoModel>>([]); 
      // List<videoModel> get videoList => _videoList.value;
      
    LikesCount profileController = Get.put(LikesCount());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      
      
      
           videoList.bindStream( FirebaseFirestore.instance.collection("Videos").snapshots().map((event) { 

              List<videoModel> list = [];
              
              for( var i in event.docs ) { 

                  list.add(videoModel.fromJson(i) );
                 
              } 

              return list ;

        } ) ) ;
    
  }


 void  addlikes( String id) async { 


   var uid = FirebaseAuth.instance.currentUser!.uid ;

  await FirebaseFirestore.instance.collection("Videos").doc(id).get().then(( DocumentSnapshot snap ) async { 
  try {

       Map< String , dynamic > data  = snap.data() as Map< String , dynamic > ;

          if( snap.exists ) { 

            debugPrint("addCalls: id is $id " );

            if( data["likes"].contains( uid ) ) {

                await FirebaseFirestore.instance.collection("Videos").doc(id).update({ 
                  "likes" : FieldValue.arrayRemove( [uid] ) 
                });
               profileController.profilePageLikesCount.value -= 1;
               
            }
          
           else  { 
                await FirebaseFirestore.instance.collection("Videos").doc(id)
                 .update({ 
                  "likes" : FieldValue.arrayUnion( [uid] ) 
                });
               profileController.profilePageLikesCount.value += 1;
               
          }
 
       }
  }

       catch(e) { 

            throw Get.snackbar("Error", " videoController e problem");
       }
  
   });


 }
  
 void  addComment ( String comment ,String id ) async { 

    //  DocumentSnapshot snap =  await FirebaseFirestore.instance.collection("Videos").doc(id).get();

    //  Map<String ,dynamic> data = snap.data() as Map<String ,dynamic> ;

      try  {

         await FirebaseFirestore.instance.collection("Videos").doc(id).update(
          {
            "commentsCount" : FieldValue.arrayUnion([comment])
          }
         );

      } catch (e) {
        throw Get.snackbar( "Command Error" , "Check The Command" );
      }

    // data["commentsCount"]
}


}