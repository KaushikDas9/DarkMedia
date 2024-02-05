import 'package:flutter/material.dart';

class myCustomTextField extends StatefulWidget {
  String hintName;
  String labelText;
  Icon myIcon ;
  TextEditingController myController;
  bool hideText;
  myCustomTextField(
      { required this.hintName, required this.labelText,required this.myIcon ,required this.myController , required this.hideText ,super.key});

  @override
  State<myCustomTextField> createState() => _myCustomTextFieldState();
}

class _myCustomTextFieldState extends State<myCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.04),
      child: TextField(
        cursorColor: Colors.white,
        
        obscureText: widget.hideText,
        controller: widget.myController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            iconColor: Colors.white,
            labelStyle:const TextStyle( color: Colors.white),
            hintStyle: TextStyle(color: Colors.white38),
            icon: widget.myIcon,
            labelText:widget.labelText,
            hintText: widget.hintName,
            border:const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white60),
            borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
