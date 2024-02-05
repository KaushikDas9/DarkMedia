
import 'package:clonetiktok/2.DOMAIN/StateManage/buttonNavigationState.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/Comment/commentPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/Profile/ProfilePage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/reelHolder.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/singInPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoAddPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoPreview.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/videoReelHolder.dart';
import 'package:clonetiktok/3.APPLICATION/WIDGET/MyBottonNavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  
      buttonNavigationStatemanage statemanage = Get.put(buttonNavigationStatemanage());

      List<Widget> pages = [ const videoReelHolder() , const reelHolder() , const  videoAddPage() ,const videoAddPage() , const profilePage() ];

  @override
  Widget build(BuildContext context) {

    // Get.changeTheme(ThemeData.dark());
    return Obx(() =>  Scaffold(

        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          
        ),child: const MyButtomNavigation() ,
      ),

     
 
      // bottomNavigationBar: ,
      body: pages[statemanage.currentPage.value ],
      

    ));
  }
}