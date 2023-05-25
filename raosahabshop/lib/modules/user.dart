import 'package:flutter/material.dart';

class User{
   final String name;
   final String email;
   final String username;
   final String password;

   User({
    required this.name, 
    required this.email, 
    required this.username, 
    required this.password, 
    });

   Map<String,dynamic> toJson()=>{
    'name':name,
    'email':email,
    'username':username,
    'password':password,
   };
   
}