
import 'package:First_App/widget/final_subscribed_list.dart';

import './Scree1.dart';
import 'package:First_App/models/Subscribed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:authentification/Start.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './access_list.dart';
import './user_subscribed.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
        
      child: !isloggedin
          ? CircularProgressIndicator()
          : Column(
              children: <Widget>[
                SizedBox(height: 40.0),
                Container(
                  height: 400,
                  child: Image(
                    image: AssetImage("assets/Image/Welcome.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  child: Text(
                    "Hello ${user.displayName} you are Logged in as ${user.email}",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign:TextAlign.center,
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>DashBoardFinal()));
                  },
                  child: Text('Lets Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                  color: Colors.lightGreenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Not ${user.displayName}?"
                  
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  onPressed: signOut,
                  child: Text('Signout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  color: Colors.lightGreenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  "Not ${user.displayName}?"
                  
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SubscribedList(final_list)));
                  },
                  child: Text('Subscribed List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                      ),
                  ),
                  color: Colors.lightGreenAccent[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
    ));
  }
}