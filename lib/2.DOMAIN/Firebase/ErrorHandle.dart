import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class fireBaseErrorHandle { 

  void FireBaseError ( {required FirebaseAuthException error} ) { 

      if( error.code == "invalid-email" )  Get.snackbar( "Email Format Error", " Email is badly Formatted");
      else if( error.code == "wrong-password") Get.snackbar("Wrong PassWord ", "Please Enter correct password") ;
      else if( error.code == "user-disabled") Get.snackbar("User Disable", "The user corresponding to the given email has been disabled") ;
      else if( error.code == "user-not-found") Get.snackbar("User Disable", "Email not found") ;
      else if( error.code == "email-already-in-use") Get.snackbar("Email Already Created", "there already exists an account with the given email address") ;
      else if( error.code == "weak-password") Get.snackbar("User Disable", "the password is not strong enough, Try to add number , special charecter ") ;
      else if( error.code == "network-request-failed") Get.snackbar("No Internet", "Internet is unavalable , try to connectd with other network") ;
      else if( error.code == "too-many-requests") Get.snackbar("Too many attempt", "Too many attempts please try later") ;
      else if( error.code == "channel-error") Get.snackbar("Empty Field", "Email and password field are required") ;
      else Get.snackbar(error.code.toString() ,error.message.toString()  );

      
  }


}