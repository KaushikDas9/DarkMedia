import 'package:flutter/material.dart';

class MyCustomButtom extends StatefulWidget {
  String butoomText; final myOnPressd ;
   MyCustomButtom({required this.butoomText , required this.myOnPressd , super.key});

  @override
  State<MyCustomButtom> createState() => _MyCustomButtomState();
}

class _MyCustomButtomState extends State<MyCustomButtom> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed:  widget.myOnPressd , child: Text(widget.butoomText));
  }
}