


import 'package:get/get.dart';

class buttonNavigationStatemanage extends GetxController { 

  RxInt currentPage = 2.obs;

   pageChange( int page ) { 
     
      currentPage.value = page  ;
      print(currentPage);
   }

}
