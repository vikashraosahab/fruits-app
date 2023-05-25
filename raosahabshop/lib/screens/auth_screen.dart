import 'package:flutter/material.dart';
import 'package:raosahabshop/resources/auth_methods.dart';
import '../widgets/custom_input_field.dart';

class AuthScreen extends StatefulWidget{
  @override 
     AuthScreenState createState()=> AuthScreenState();
}

class AuthScreenState extends State<AuthScreen>{
  List authTaskBar = ['LOGIN','SIGNUP'];
  int tap = 0;
  int values =0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();


   Future<void> signUp() async{
     String result = await AuthMethods().signIn(
      nameController.text,
      emailController.text,
      usernameController.text,
      passwordController.text,
     );

     if(result == 'Successful'){
       print('successful');
     }else{
      print('Unsuccessful');
     }
   }
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor:Colors.white,
    resizeToAvoidBottomInset:false,
    body:Container(
      padding:const EdgeInsets.only(top:120,bottom:120,left:20,right:20),
      height:tap == 0 ? 600 : 1100,
      child:Stack(
        alignment:Alignment.center,
        clipBehavior:Clip.none,
        children: [
          Positioned(
            left:-5,
            top:-45,
            child:tap == values ? const SizedBox(
              child:Text(
              'Welcome Back ',style:TextStyle(
                fontSize:40,
                letterSpacing:1.1,
                color:Colors.black,
                fontWeight:FontWeight.bold,
                )) ,
            ): const SizedBox(
              child:Text(
              'Welcome to Store ',style:TextStyle(
                  color:Colors.black,
                  letterSpacing:1.1,
                  fontWeight:FontWeight.bold,
                  fontSize:38,
                ))),
          ),
          Container(
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(30),
              boxShadow:const [
                BoxShadow(
                  offset:Offset(1.1, 2.2),
                  blurRadius:3,
                  spreadRadius:2.2,
                  color:Colors.black26,
                )
              ]
           ),
            child:Column(
              children: [
             Container(
              decoration:const BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30)),
              ),
              padding:const EdgeInsets.all(16),
              child:Row(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              mainAxisSize:MainAxisSize.max,
              children:List.generate(2,(index){
                return Container(
                      child:GestureDetector(
                    onTap:(){
                      setState(() {
                        tap = index;
                        index == values;
                      });
                    },
                  child:Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                     Container(
                  
                  child:Text(authTaskBar[index],style:TextStyle(
                    fontSize:28,
                    letterSpacing:.5,
                    color:index == tap ? Colors.black : Colors.grey,
                  )),
                  ),
                  const SizedBox(height:5),
                  index == tap ? Container(
                    width:100,
                    height:2,
                    color:Colors.black,
                  ): Container(),
                  ])
                  ),
                );
              }),
             ),
            ),
           

           tap == values ? Container(
            child:Column(
              children: [
                const SizedBox(height:30),
                CustomInputField(
                  controller:loginemailController, 
                  hintText:'Email', 
                  isPass:false, 
                  textInputType:TextInputType.emailAddress,
                  icons:const Icon(Icons.email_rounded),
                ),
                const SizedBox(height:20),
                CustomInputField(
                  controller:loginpasswordController, 
                  hintText:'Password', 
                  isPass:true, 
                  textInputType:TextInputType.text,
                  icons:const Icon(Icons.lock_outline),
                ),
                const SizedBox(height:20),

              ],
            ),
           ): Container(
              margin:const EdgeInsets.only(top:10,left:10,right:10),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  
                  const SizedBox(height:20),
                  CustomInputField(
                    controller:nameController, 
                    hintText:'Name', 
                    isPass:false, 
                    textInputType:TextInputType.text,
                    icons:const Icon(Icons.man_outlined)
                  ),
                  const SizedBox(height:20),
                  CustomInputField(
                    controller:emailController,
                    hintText:'Email', 
                    isPass:false, 
                    textInputType:TextInputType.text,
                    icons:const Icon(Icons.mail_outline_outlined),
                  ),
                  const SizedBox(height:20),
                  CustomInputField(
                    controller:usernameController, 
                    hintText:'Username', 
                    isPass:false, 
                    textInputType:TextInputType.text,
                    icons:const Icon(Icons.person),
                  ),

                  const SizedBox(height:20),
                   CustomInputField(
                    controller:passwordController, 
                    hintText:'Password',
                    isPass:true, 
                    textInputType:TextInputType.text,
                    icons:const Icon(Icons.lock_outline_rounded),
                  ),
                  const SizedBox(height:20),
                ],
              )),
           ], 
           ),
          ),
          Positioned(
            bottom:-25,
            child:InkWell(
              onTap:() async {
                tap == values ? 
                Container() : 
                signUp();
              },
             child:Container(
              padding:const EdgeInsets.only(left:45,right:45,top:8,bottom:8),
              alignment:Alignment.center,
              decoration:BoxDecoration(
              color:Colors.black,
              borderRadius:BorderRadius.circular(30),
              boxShadow:const [
                BoxShadow(
                  offset:Offset(-1.1, -2.2),
                  blurRadius:3,
                  spreadRadius:2.2,
                  color:Colors.black26,
                )
              ]
             ),
              child:tap == values ? const Text('LOGIN',style:TextStyle(
                fontSize: 28,
                letterSpacing:1.2,

              ),) : const Text('SIGNUP',style:TextStyle(
                fontSize: 28,
                letterSpacing:1.2,
              )),
            )
          )),
        ],
      ),
    ),
   );
  }
}