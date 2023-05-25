import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../modules/user.dart' as Module;

class AuthMethods{
   final FirebaseAuth auth =FirebaseAuth.instance;
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// this is signUp new user for signning user account
  Future<String> signIn( 
      final String name,
      final String email,
      final String password,
      final String username,
     )async{
      String result = 'Something occupied';
      try{
         await auth.createUserWithEmailAndPassword(email: email, password: password);
         Module.User user = Module.User(
          name: name, 
          email: email, 
          username: username, 
          password: password, 
          );
       
     if(name.isNotEmpty|| 
        email.isNotEmpty || 
        username.isNotEmpty || 
        password.isNotEmpty ){
         
         await firebaseFirestore.collection('userCollection').doc(auth.currentUser!.uid).set(user.toJson());
      
        result ='Successful';
       }
      }catch(e){
        print(e.toString());
      }
     return result;
     }

     // this is signUp methods for rejoin old user 

    Future<String> signUp(
      final String email,
      final String password,
     )async{ 
      String result = 'Something occupied';
       try{
        await auth.signInWithEmailAndPassword(
          email: email, 
          password: password
          );

        result ='Success';
       }catch(e){
        print(e.toString());
       }
       return result;
     }

     // this is method for sign out use

     Future<void> signOut() async{
      try{
        await auth.signOut();
      }catch(e){
        print(e.toString());
      }
     }
}