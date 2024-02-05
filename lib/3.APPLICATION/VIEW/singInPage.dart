import 'dart:io';

import 'package:clonetiktok/2.DOMAIN/MODEL/ImagePicerModel.dart';
import 'package:clonetiktok/3.APPLICATION/COMMON/STRING/UseString.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/loginPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/myCircleAvater.dart';
import 'package:clonetiktok/3.APPLICATION/WIDGET/CustomTextField.dart';
import 'package:clonetiktok/3.APPLICATION/WIDGET/MyCustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:clonetiktok/2.DOMAIN/Firebase/fireAuth.dart';

class signInPage extends StatefulWidget {

    File? path ;
   signInPage(   {this.path ,super.key});
   

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {

  

  bool hasAvater = false ;

  TextEditingController SingInUserNameController = TextEditingController();
  TextEditingController SingInUserPassWordController = TextEditingController();
  TextEditingController SingInEmailController = TextEditingController();
  TextEditingController SingInConfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black.withOpacity(.94)),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                GlitchEffect(child: SizedBox(height: height*.1, child: Text( allUsesString().appName , style: TextStyle(fontSize: 40, color: Colors.white ),))),
                SizedBox(child: Text(allUsesString().welcome , style: TextStyle(color: Colors.white , fontSize: 15),),),
                SizedBox( height:  height*.02,),

                GestureDetector( onTap: () { imagePickerModel().takeImageFromGallery().then((value) { setState(() { });} ) ;   } ,child:  myCustomAvater())  ,

                SizedBox( height:  height*.02,),
                myCustomTextField(hintName: allUsesString().enterName, labelText:allUsesString().labelName , myIcon:const Icon(Icons.mail), myController: SingInUserNameController, hideText: false ),
                SizedBox(height: height*.02,),
                myCustomTextField(hintName: allUsesString().enterPassword, labelText: allUsesString().passWord, myIcon:const Icon(Icons.lock), myController: SingInUserPassWordController,hideText: true, ),
                SizedBox(height: height*.02,),
                myCustomTextField(hintName: allUsesString().hintConfirmPassword, labelText: allUsesString().labelPassword, myIcon:const Icon(Icons.lock), myController: SingInConfirmPasswordController,hideText: true, ),
                SizedBox(height: height*.02,),
                myCustomTextField(hintName: allUsesString().hintEmail, labelText: allUsesString().labelEmail, myIcon:const Icon(Icons.mail), myController: SingInEmailController,hideText: false, ),
                SizedBox(height: height*.03,),
                MyCustomButtom(butoomText: allUsesString().signinButton,myOnPressd : (){ fireAuth().signUp(userName: SingInUserNameController.text, userPassword: SingInUserPassWordController.text,confirmPassword: SingInConfirmPasswordController.text, userEmail: SingInEmailController.text); } ),
                CupertinoButton(child: Text(allUsesString().allReadyHasAccount), onPressed: (){ Get.to(const loginPage());} ),
                
              ],
            )),
      ),
    );
  }
}

class _UserNameController {
}