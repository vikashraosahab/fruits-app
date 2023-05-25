import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatefulWidget{
   final Widget mobile;
   final Widget web;
   const ResponsiveLayout({
      Key ? key ,
     required this.mobile, 
     required this.web
    }):super(key:key);
   @override 
     ResponsiveLayoutState createState()=> ResponsiveLayoutState();
}

class ResponsiveLayoutState extends State<ResponsiveLayout>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LayoutBuilder(builder:(context,constraints){
        if(constraints.maxWidth > 400){
           return widget.web;
        }else {
          return widget.mobile;
        }
      })
    );
  }
}