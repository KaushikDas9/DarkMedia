import 'package:clonetiktok/3.APPLICATION/VIEW/firstPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/home.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/loginPage.dart';
import 'package:clonetiktok/3.APPLICATION/VIEW/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(  ) async {

  

 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( GetMaterialApp(home:const welcomePage(),
  theme: ThemeData.dark(useMaterial3: true),
  ));
}
