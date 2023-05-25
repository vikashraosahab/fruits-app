import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raosahabshop/screens/auth_screen.dart';
import 'package:raosahabshop/widgets/splash_widget.dart';
import '../screens/auth_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options:const FirebaseOptions(
       apiKey: "AIzaSyCtA8wy5Wrf4S2bxz5QdX8H21WhhNHf6KU",
       authDomain: "raosahabmart.firebaseapp.com",
       projectId: "raosahabmart",
       storageBucket: "raosahabmart.appspot.com",
       messagingSenderId: "18114452999",
       appId: "1:18114452999:web:5f0e5b94a72f1d4fca94a2"
     )
    );
  }else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  // this is main root of the application
  // this is statelessWidget means that it value is never be changed by any events
   const MyApp({Key ? key}):super(key:key);
     @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor:const Color.fromARGB(255, 255, 255, 255),
      ),
      home:const SplashWidget(),
     );
  }
}