// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:psych_help/Mapper.dart';
import 'package:psych_help/psyprofile.dart';
import 'package:psych_help/psyprofileuser.dart';
import 'package:psych_help/services.dart';
//import 'dart:async';
import 'package:psych_help/signup.dart';
import 'package:psych_help/home.dart';
import 'package:psych_help/globals.dart' as userFile;
import 'psyprofile.dart';
import 'psyprofileuser.dart';

void main() {
  runApp(MyApp());
}

String uid = '';
String result = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/psyprofile': (BuildContext context) => new PsyProfile(),
        '/psyprofileuser': (BuildContext context) => new PsyProfileUser()
      },
      home: LoginPage(),
    );
  }
}

Map<String, Widget Function(BuildContext)> route0 = <String, WidgetBuilder>{
  '/': (context) => LoginPage(),
  '/SignUp': (context) => SignUp(),
};

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Type rsp;
  String result;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _formKey,
      resizeToAvoidBottomPadding: false,
      body: Column(
        //key: _formKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text('Hello',
                    style:
                        TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                child: Text('There',
                    style:
                        TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(200.0, 175.0, 0.0, 0.0),
                child: Text('.',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              )
            ],
          )),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: username,
                  validator: (_) =>
                      result == 'Failed' ? 'Invalid Id/Password' : null,
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(children: <Widget>[
                TextFormField(
                  controller: pwd,
                  validator: (_) =>
                      result == 'Failed' ? 'Invalid Id/Password' : 'null',
                  cursorColor: Colors.green,
                  cursorWidth: 2.0,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      )),
                )
              ])),
          SizedBox(height: 30.0),
          Center(
              child: Container(
            height: 40.0,
            width: 300.0,
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Colors.greenAccent,
              elevation: 7.0,
              color: Colors.green,
              child: InkWell(
                  hoverColor: Colors.red,
                  splashColor: Colors.blueAccent,
                  onTap: () async {
                    userFile.usrID = await AppServices.signInPromise(
                        username.text, pwd.text);

                    result = userFile.usrID.result;
                    if (result == "Auth Failure") {
                      showDialog(
                        //User friendly error message when the screen has been displayed
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Invalid Id/Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListBody(
                              mainAxis: Axis.vertical,
                              children: <Widget>[
                                Icon(Icons.clear,
                                    color: Colors.red[300], size: 50),
                                // Text(
                                //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    } else if (result == "Conn Failure") {
                      showDialog(
                        //User friendly error message when the screen has been displayed
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Connection Failure",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28),
                          ),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ListBody(
                              mainAxis: Axis.vertical,
                              children: <Widget>[
                                Icon(Icons.clear,
                                    color: Colors.red[300], size: 50),
                                // Text(
                                //     'Warning: Social Distance Violated!\nYou are at a distance of less than 2 metres from another person.'),
                              ],
                            ),
                          ),
                        ),
                        barrierDismissible: true,
                      );
                    } else {
                      print(userFile.usrID.userType);
                      print(userFile.usrID.userType == "User");
                      if (userFile.usrID.userType == "User") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PsyProfileUser()), //change direction later
                        );
                      } else if (userFile.usrID.userType == "Moderator") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModHomePage()),
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
            ),
          )),
          SizedBox(height: 20.0),
          Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 50.0),
                Text("Don't have an account?  ",
                    style: TextStyle(color: Colors.grey)),
                // r
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text('Create a new account.',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)))
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          PsyData res = await AppServices.searchPromise("ali", "12345");
          print(res.firstName);
          print(res.toString());
        },
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
