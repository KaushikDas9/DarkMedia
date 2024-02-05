import 'package:clonetiktok/3.APPLICATION/VIEW/home.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/loginPage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firstPage extends GetxController {

  final _auth = FirebaseAuth.instance;

  void cheak() { 
      if( _auth.currentUser != null ) Get.off(home());
      else Get.off(loginPage());
  }
}