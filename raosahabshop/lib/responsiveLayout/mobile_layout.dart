import 'package:flutter/material.dart';
import '../utils/global_variables.dart';

class MobileLayout extends StatefulWidget{
  const MobileLayout({Key ? key}):super(key:key);
   @override 
    MobileLayoutState createState()=> MobileLayoutState();
}

class MobileLayoutState extends State<MobileLayout>{
  int index = 0;
  @override 
   Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:homeScreenItems[index]),
      bottomNavigationBar:BottomAppBar(
        color:Colors.white,
        elevation:10,
        child:Container(
          child:Row(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceAround,
            children: [
            IconButton(
              onPressed:(){
                 setState(() {
                    index = 0;
                 });
              }, 
              icon:const Icon(Icons.home_outlined),
              iconSize:28,
              color:index == 0 ? Colors.green : Colors.black,
            ),
            IconButton(
              onPressed:(){
                setState(() {
                  index = 1;
                });
              }, 
              icon:const Icon(Icons.shop_two_outlined),
              iconSize:28,
              color:index == 1 ? Colors.green : Colors.black,
            ),
            IconButton(
              onPressed:(){
                setState(() {
                   index = 2;
                });
              }, 
              icon:const Icon(Icons.notifications_active_outlined),
              iconSize:28,
              color:index == 2 ? Colors.green : Colors.black,
           ),
            IconButton(
              onPressed:(){
                setState(() {
                   index =3;
                });
              }, 
              icon:const Icon(Icons.face_outlined),
              iconSize:28,
              color:index == 3 ? Colors.green : Colors.black,
          ),
          ]
          ),
        ),
      ),
    );
  }
  
}