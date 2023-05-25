import 'package:flutter/material.dart';

class ProductCart extends StatelessWidget{
 final dynamic snap;
 const ProductCart({Key ? key , required this.snap}):super(key:key);
   @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(snap.fruits),
    );
  }
}