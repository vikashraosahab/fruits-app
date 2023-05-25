import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raosahabshop/widgets/product_cart.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({Key ? key}):super(key:key);
   @override
    HomeScreenState createState()=> HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  List images =[1,2,3,4,5,6,];
   @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:SingleChildScrollView(
        child:Container(
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height:350,
                    width:double.infinity,
                    decoration:const BoxDecoration(
                      gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[ 
                         Color.fromARGB(255, 13, 42, 4),
                         Color.fromARGB(255, 131, 255, 6)
                        ],
                    ),
                   ),
                  ),
                  Positioned(
                  top:55,
                    child:Container(
                      padding:const EdgeInsets.symmetric(horizontal:5),
                      child:Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Home',style:TextStyle(
                            fontSize:34,
                            letterSpacing: 1.5,
                            fontWeight:FontWeight.bold
                          )),
                          const SizedBox(width:150),
                          IconButton(
                            onPressed:(){}, 
                            icon:const Icon(
                              Icons.favorite_border_rounded
                          )),
                          IconButton(
                            onPressed:(){}, 
                            icon:const Icon(
                              Icons.shop_sharp
                          ))
                        ],
                      ),
                    )
                   ),
                   Positioned(
                   top:150,
                    child:SizedBox(
                      height:150,
                      width:390,
                      child:CarouselSlider(
                        options:CarouselOptions(
                          height:500,
                          enlargeCenterPage: true,
                          enableInfiniteScroll:true,
                          autoPlay:true,
                          autoPlayInterval:const Duration(seconds:2),
                        ),
                        items:[1,2,3].map((e) => Container(
                          alignment:Alignment.center,
                          height:20,
                          width:double.infinity,
                          color:Colors.white,
                          child:Text(e.toString(),style:const TextStyle(
                            fontSize:30,
                            color:Colors.black,
                          )),
                        )).toList()
                      )
                    ),
                   ),
                  Positioned(
                  bottom:-25,
                    child:Container(
                      height:55,
                      width:360,
                      decoration:BoxDecoration(
                        color:Colors.white,
                        borderRadius:BorderRadius.circular(10),
                        boxShadow:const [
                          BoxShadow(
                            blurRadius:20,
                            spreadRadius:.6,
                            color:Colors.grey,
                          )
                        ]
                      ),
                      child:Container(
                        padding:const EdgeInsets.symmetric(horizontal:20),
                        child:Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search_rounded,
                            color:Colors.grey,
                            size:30,
                          ),
                          SizedBox(width:20),
                          Text('Search your product',style:TextStyle(
                            color:Colors.grey,
                            fontSize:21,
                            letterSpacing:.5,
                            fontWeight:FontWeight.w400
                          ))
                        ],
                      ),
                     ),
                    )
                  )
                ],
              ),
              const SizedBox(height:35),
              Container(
                margin:const EdgeInsets.only(top:10),
                alignment:Alignment.center,
               child:StreamBuilder(
                stream:FirebaseFirestore.instance.collection('data').snapshots(),
                builder:((context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                     return Container(
                      alignment:Alignment.center,
                      child:const CircularProgressIndicator(),
                     );
                  }
                  if(snapshot.connectionState == ConnectionState.active){
                    if(snapshot.hasData){
                       return ProductCart(snap:snapshot.data!.docs.length);
                    }
                  }
                  return Text('Sorry Your data has dinied',style:TextStyle(color:Colors.red));
                 }
                ),
               )
              ),
            ],
          ),
        ),
      ),
    );
  }
}