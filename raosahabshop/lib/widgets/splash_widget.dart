import 'package:flutter/material.dart';
import 'package:raosahabshop/screens/main_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashWidget extends StatefulWidget{
  const SplashWidget({Key ? key }):super(key:key);
   
   @override 
    SplashWidgetState createState()=> SplashWidgetState();
}

class SplashWidgetState extends State<SplashWidget>{
    @override 
      void initState(){
        super.initState();
        navigateToMainScreen();
      }

      void navigateToMainScreen(){
        Future.delayed(const Duration(seconds:3),(){
           Navigator.pushReplacement(
          context,MaterialPageRoute(
            builder:(context)=>const MainScreen()));
        });
      }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
      alignment:Alignment.center,
      child:const Text('Gaurav Store',style:TextStyle(
        fontSize:40,
        fontWeight:FontWeight.bold,
        letterSpacing:.5,
      )),
    ));
  }
}