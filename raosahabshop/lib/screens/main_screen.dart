import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raosahabshop/responsiveLayout/mobile_layout.dart';
import 'package:raosahabshop/responsiveLayout/web_layout.dart';
import 'package:raosahabshop/screens/auth_screen.dart';
import '../responsiveLayout/responsive_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MainScreen extends StatelessWidget{
  const MainScreen({Key ? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context,AsyncSnapshot<User?> snapshot){
          if(snapshot.connectionState == ConnectionState.active){
             if(snapshot.hasData){
               return Scaffold(
                body:ResponsiveLayout(
                  mobile:const MobileLayout(), 
                  web:WebLayout()
                ));
             }else if(snapshot.hasError){
              return Scaffold(
                body:Container(
                  alignment:Alignment.center,
                  child:Text('sorry ${snapshot.hasError}'),
                ),
              );
             }
          }

          if(snapshot.connectionState == ConnectionState.waiting){
             return Scaffold(
              body:Container(
                alignment:Alignment.center,
                child:const CircularProgressIndicator(),
              ),
             );
          }

          return AuthScreen();
        },
    );
  }
}