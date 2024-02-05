
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class  LikesCount extends GetxController { 


   var profilePageLikesCount = 0.obs ;
   RxBool isLoading = true.obs ;
  


 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FirebaseFirestore.instance.collection("Videos").get().then((querySnap)  {  
      for ( var i in querySnap.docs ) { 

    print("All likes pore e calls");

          final data = i.data() ;

        final val = data["likes"]  ;

                profilePageLikesCount.value += val.length as int ;
              print("likes is: ${profilePageLikesCount.value}");

  }

   isLoading.value = false ; 
    } );
  }

  
}