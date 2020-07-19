//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  //State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
  //}
  _HomePageState createState()=>_HomePageState();


}

class _HomePageState  extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DashBoard'),
        centerTitle: true,
      ),
      body: Center(
         child: Container(
           child: new Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               new Text("you are now Logged in"),
               SizedBox(height: 15.0,),
               new OutlineButton(
                 borderSide: BorderSide(
                   color: Colors.red,style: BorderStyle.solid,width: 3.0
                 ),
                 child: Text('Logout'),
                 onPressed: (){
                    FirebaseAuth.instance.signOut().then((value){
                      Navigator
                          .of(context)
                          .pushReplacementNamed('/landingpage');
                    }).catchError((e){
                      print(e);
                    });
                 },
               ),

             ],
           ),
         ),
      ),
    );
  }

}