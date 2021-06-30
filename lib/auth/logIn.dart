
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gp_project/Reuseables/ReuseableAppBar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart'as http;

import '../Home.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  //ignore: deprecated_member_user

  late String email, password;
  var _formKey = GlobalKey<FormState>();
  var emailVaidator = MultiValidator([
    EmailValidator(errorText: 'email not valid'),
    RequiredValidator(errorText: 'email is required'),
  ]);
  var passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.?[#?!@$%^&-])',
        errorText: 'passwords must have at least one special character')
  ]);
  var _auth = FirebaseAuth.instance;
  bool visible = false;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: (SemanticsFlag.isKeyboardKey) != null
            ? Size.fromHeight(MediaQuery.of(context).padding.top * 7)
            : Size.fromHeight(MediaQuery.of(context).padding.top * 2),
        child: ReuseableAppBar(
          title: "Login",
        ),
      ),
      body: Builder(
        builder: (context) => ModalProgressHUD(
          inAsyncCall: spinner,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Enter Your E-Mail',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          email = val;
                        },
                        validator: emailVaidator,
                        decoration: InputDecoration(
                          hintText: 'enter your email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        'Enter Your Password',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.015,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          password = val;
                        },
                        validator: passwordValidator,
                        /*(validate){
                          if(validate.isEmpty){
                            return 'password is required';
                          }else if(validate.length < 8){
                            return 'password length at least 8 characters';
                          }
                          return null;
                        },*/
                        decoration: InputDecoration(
                          hintText: 'enter your password',
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: (visible)
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: (visible) ? false : true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print('successful');
                      var connectivityResult =
                      await (Connectivity().checkConnectivity());
                      if (connectivityResult != ConnectivityResult.mobile &&
                          connectivityResult != ConnectivityResult.wifi) {
                        ScaffoldMessenger(child:SnackBar(content: Text('No internet'),
                          backgroundColor: Colors.redAccent,),);
                      } else {
                        try {
                          setState(() {
                            spinner = true;
                          });
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          _formKey.currentState!.reset();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                          setState(() {
                            spinner = false;
                          });
                        } catch (e) {
                          setState(() {
                            spinner = false;
                          });
                          if (e is FirebaseAuthException) {
                            print(e.code);
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger(child:SnackBar(content: Text('User not found'),
                              backgroundColor: Colors.redAccent,),);
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger(child:SnackBar(content: Text('Wrong password'),
                                backgroundColor: Colors.redAccent,),);
                            }
                          }
                        }
                      }
                    }
                  },
                  child: Text(
                    'LogIn',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}