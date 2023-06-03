import 'package:flutter/material.dart';

class ProductCart extends StatefulWidget{
   final dynamic snap;
   const ProductCart({Key ? key,required this.snap}):super(key:key);
   @override 
    ProductCartState createState()=> ProductCartState();
}

class ProductCartState extends State<ProductCart>{
   @override
  Widget build(BuildContext context) {
    return Container(
      height:200,
      width:200,
      padding:const EdgeInsets.all(5),
      margin:const EdgeInsets.only(top:4),
      decoration:const BoxDecoration(
        color:Colors.blue,
        boxShadow:[
          BoxShadow(
            color:Colors.yellow,
            spreadRadius:2,
            blurRadius:3,
            offset:Offset(2, 3)
          )
        ]
      ),
      child:Column(
        children: [
           Text(widget.snap['fruits'])
        ],
      ),
    );
  }
}