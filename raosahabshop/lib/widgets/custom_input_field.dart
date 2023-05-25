import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget{
  final TextEditingController controller;
  final dynamic hintText;
  final bool isPass;
  final TextInputType textInputType;
  final icons;
   const CustomInputField({
    Key ? key,
    required this.controller,
    required this.hintText,
    required this.isPass,
    required this.textInputType,
    required this.icons,
    }):super(key:key);
   @override 
    Widget build(BuildContext context) {
      final border = OutlineInputBorder(borderSide:Divider.createBorderSide(context));
     return Container(
      margin:const EdgeInsets.symmetric(horizontal:12),
       decoration:const BoxDecoration(
        color:Colors.white,
        boxShadow:[
           BoxShadow(
            offset:Offset(.8, .6),
            spreadRadius:.6,
            blurRadius:9,
            color:Colors.black12,
           )
        ],
       ),
      child:TextField(
       controller:controller,
       style:const TextStyle(
        color:Colors.black,
        fontSize:18,
       ),
       decoration:InputDecoration(
        hintText:hintText,
        prefixIcon:icons,
        prefixIconColor:Colors.black,
        hintStyle:const TextStyle(
          color:Colors.black,
        ),
        border:const OutlineInputBorder(borderSide:BorderSide(color:Colors.red)),
        enabledBorder:border,
        errorBorder:border,
        focusedBorder:border,
        filled:true,
       ),
       obscureText:isPass,
       keyboardType:textInputType,
      )
     );
  }
}

