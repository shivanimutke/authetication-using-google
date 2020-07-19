import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleauth/services/usermanagement.dart';


class SignupPage extends StatefulWidget{
  @override
  _SignupPageState  createState()=> _SignupPageState();


}

class _SignupPageState extends State<SignupPage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20.0,),

              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('signup'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                        email: _email , password: _password)
                        .then((signedInUser){
                        UserManagement().storeNewUser(signedInUser,context);
                        Navigator.of(context).pushReplacementNamed('/homepage');
                  })
                  .catchError((e){
                    print(e);
                  });
                },
              ),
              Text('have account?'),
              RaisedButton(
                child: Text('login'),
                color: Colors.blue,textColor:Colors.white,
                elevation: 7.0,
                onPressed: (){
                  //FirebaseAuth.instance.signInWithEmailAndPassword(
                    //  email: _email, password: _password
                  //).then((user) {
                    //Navigator.of(context).pushReplacementNamed('/homepage');
                  //}).catchError((e) {
                    //print(e);
                  //});
                  Navigator.of(context).pushReplacementNamed('/landingpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}