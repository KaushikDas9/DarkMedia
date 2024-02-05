import 'package:clonetiktok/2.DOMAIN/Firebase/ErrorHandle.dart';
import 'package:clonetiktok/2.DOMAIN/MODEL/userSingupModel.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/home.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

  class fireAuth extends GetxController{
          
            
          
    void signUp( { required String userName , required String userPassword ,required String confirmPassword , required String userEmail }) async { 
        
         final auth =  FirebaseAuth.instance;
        // signupModel userModel = signupModel();
          try {
            final credential;

              if( userName.isNotEmpty && userPassword.isNotEmpty && confirmPassword.isNotEmpty && userEmail.isNotEmpty ) {

                    if(  userPassword != confirmPassword ) {
                        Get.snackbar("Error", "Password is not match");  
                    }
                    else {
                        credential = await auth.createUserWithEmailAndPassword(email: userEmail, password: userPassword).then(( firebaseValue ) {

                            // FILLING DATA INTO MODEL

                             signupModel model = signupModel(email: firebaseValue.user!.email.toString(), name:userName.toString(), password: userPassword.toString() , uid: firebaseValue.user!.uid.toString() );

                              FirebaseFirestore.instance.collection("My User").doc(firebaseValue.user!.uid ).set( model.tojson() ) ; 

                        Get.offUntil( MaterialPageRoute(builder: (context) =>const home(),), (route) => false) ; Get.snackbar("Successfull ", "created account with ${userName.toString()} ");  
                        });
                    }
              }  
              else {
                Get.snackbar("Empty Field", "Please cheak all field is filled");
              }
              
              
          } on FirebaseAuthException catch (e) {
            fireBaseErrorHandle().FireBaseError(error: e);
             print(e.code.toString());
          }
          

    }

    void login({ required String userEmail , required String userPassword }) async {
      final auth =  FirebaseAuth.instance;
        try {
           await auth.signInWithEmailAndPassword(email: userEmail, password: userPassword).then((value) {Get.offUntil(MaterialPageRoute(builder: (context) =>const home() ,), (route) => false) ;Get.snackbar( "Succes", "Successfully log in to your account" ) ;}); 
        } on FirebaseAuthException catch (e) {
          print(e.toString());
          fireBaseErrorHandle().FireBaseError(error: e);
        }
          
     }
    }