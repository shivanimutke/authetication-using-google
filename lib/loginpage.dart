/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState  createState()=> _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  GoogleSignIn googleAuth= new GoogleSignIn();

  @override

  Widget build(BuildContext context) {
    return  new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'email'),
                onChanged: (value){
                  setState(() {

                    _email=value;
                  });
                },
              ),
              SizedBox(height:15.0),
              TextField(
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (value){
                  setState(() {

                    _password=value;
                  });
                 // obscureText=false;
                },
                obscureText: false,
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Text('login'),
                color: Colors.blue,textColor:Colors.white,
                elevation: 7.0,
                onPressed: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email, password: _password
                  ).then((user) {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                        print(e);
                  });
                  //Navigator.of(context).pushReplacementNamed('/signup');
                },
              ),
              SizedBox(height: 15.0,),
              Text('Dont have account?'),
              SizedBox(height: 10.0,),
              RaisedButton(
                child: Text('signup'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed('/signup');
                },
              ),
              Text('signup by google?'),
              RaisedButton(
                child: Text('sign up by google'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  googleAuth.signIn().then((result){
                    result.authentication.then((googlekey){
                      FirebaseAuth.instance.signInWithGoogle(
                      idToken:googlekey.idToken,
                      accessToken:googlekey.accessToken
                      ).then((signInUser){
                       print('Signed in as ${signInUser.displayName}');
                       Navigator.of(context).pushReplacementNamed('/homepage');
                      }).catchError((e){
                  print(e);
                    });

                    }).catchError((e){
                      print(e);

                  }).catchError((e){
                    print(e);
                  });
                  //Navigator.of(context).pushReplacementNamed('/signup');
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

}*/

/*
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

//Google provider
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  //google sign in
  GoogleSignIn googleAuth = new GoogleSignIn();

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
                      decoration: InputDecoration(hintText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      }),
                  SizedBox(height: 15.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _email, password: _password)
                          .then((FirebaseUser ) {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),
                  SizedBox(height: 15.0),
                  RaisedButton(
                    child: Text('Login with Google'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      _googleSignUp();
                    //}
                      googleAuth.signIn().then((result) {
                        result.authentication.then((googleKey) {
                          FirebaseAuth.instance
                              .signInWithGoogle(
                              idToken: googleKey.idToken,
                              accessToken: googleKey.accessToken)
                              .then((signedInUser) {
                            print('Signed in as ${signedInUser.displayName}');
                            Navigator.of(context).pushReplacementNamed('/homepage');
                          }).catchError((e) {
                            print(e);
                          });
                        }).catchError((e) {
                          print(e);
                        });
                      }).catchError((e) {
                        print(e);
                      });
  }
                  ),
                  SizedBox(height: 15.0),
                  Text('Don\'t have an account?'),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text('Sign Up'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                  ),
                ],
              )),
        ));
  }
}
Future<void> _googleSignUp() async {
  try {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email'
      ],
    );
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);

    return user;
  }catch (e) {
    print(e.message);
  }
}

*/

/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Google provider
import 'package:google_sign_in/google_sign_in.dart';

//Facebook provider
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;

  //google sign in
  GoogleSignIn googleAuth = new GoogleSignIn();

  //Facebook sign in
  FacebookLogin fbLogin = new FacebookLogin();

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
                      decoration: InputDecoration(hintText: 'Email'),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      }),
                  SizedBox(height: 15.0),
                  TextField(
                    decoration: InputDecoration(hintText: 'Password'),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _email, password: _password)
                          .then((FirebaseUser ) {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),
                  SizedBox(height: 15.0),
                  RaisedButton(
                    child: Text('Login with facebook'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      fbLogin.logInWithReadPermissions(
                          ['email', 'public_profile']).then((result) {
                        switch (result.status) {
                          case FacebookLoginStatus.loggedIn:
                            FirebaseAuth.instance
                                .signInWithFacebook(
                                accessToken: result.accessToken.token)
                                .then((signedInUser) {
                              print('Signed in as ${signedInUser.displayName}');
                              Navigator
                                  .of(context)
                                  .pushReplacementNamed('/homepage');
                            }).catchError((e) {
                              print(e);
                            });
                            break;
                          case FacebookLoginStatus.cancelledByUser:
                            print('Cancelled by you');
                            break;
                          case FacebookLoginStatus.error:
                            print('Error');
                            break;
                        }
                      }).catchError((e) {
                        print(e);
                      });
                    },
                  ),
                  SizedBox(height: 15.0),
                  RaisedButton(
                    child: Text('Login with Google'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {/*
                      googleAuth.signIn().then((result) {
                        result.authentication.then((googleKey) {
                          FirebaseAuth.instance
                              .signInWithGoogle(
                              idToken: googleKey.idToken,
                              accessToken: googleKey.accessToken)
                              .then((signedInUser) {
                            print('Signed in as ${signedInUser.displayName}');
                            Navigator.of(context).pushReplacementNamed('/homepage');
                          }).catchError((e) {
                            print(e);
                          });
                        }).catchError((e) {
                          print(e);
                        });
                      }).catchError((e) {
                        print(e);
                      });*/
                    },
                  ),
                  SizedBox(height: 15.0),
                  Text('Don\'t have an account?'),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text('Sign Up'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                  ),
                ],
              )),
        ));
  }
}

 */

