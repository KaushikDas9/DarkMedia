
import 'dart:async';

import 'package:clonetiktok/2.DOMAIN/MODEL/videoController.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/firstPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../2.DOMAIN/MODEL/ProfilePage/LikesCount.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
   

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    

    Timer(Duration(seconds: 1) , () { 

      // LikesCount().AllLikes();
      // videoController();
      firstPage().cheak();
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:Center(child: Text("Welcome ")),);
  }
}