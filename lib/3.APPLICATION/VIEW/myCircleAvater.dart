


 import 'dart:io';

import 'package:flutter/material.dart';

class myCustomAvater extends StatefulWidget {
  
  File? file;

   myCustomAvater(   { this.file ,  super.key });

  @override
  State<myCustomAvater> createState() => _myCustomAvaterState();
}

class _myCustomAvaterState extends State<myCustomAvater> {
  @override
  Widget build(BuildContext context) {
    return 
    
    
    

      

       Stack(


         children:[ CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white ,
          
          child:  widget.file != null ? ClipOval( child: Image.file( widget.file!)) : ClipRRect(child: Image.asset( "assect/image/profilrPic.jpeg" , fit: BoxFit.cover,) )  ,
         ),

         Positioned(child: Icon(Icons.create) , right: 0, bottom: 0,)

       ]);

  }
}