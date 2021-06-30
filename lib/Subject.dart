import 'dart:ui';

import 'package:flutter/material.dart';

import 'Home.dart';
import 'Reuseables/ReuseableAppBar.dart';
import 'ScanningQR.dart';
import 'Settings.dart';
import 'auth/logIn.dart';

class Subject extends StatefulWidget {
  const Subject({Key? key}) : super(key: key);

  @override
  _SubjectState createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawerEdgeDragWidth: MediaQuery.of(context).size.width*0.5,
          drawer: Drawer(
            elevation: 0,
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(backgroundImage:AssetImage('images/omar.jpg') ,radius: MediaQuery.of(context).size.width*0.2,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text('Omar Sedawy',style: TextStyle(fontSize: 20),),
                      DrawerHeader(child: null,),
                      ListTile(
                        title: Text('Home',style: TextStyle(fontSize: 24),),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        },
                      ),
                      ListTile(
                        title: Text('Subject',style: TextStyle(fontSize: 24),),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subject(),
                              ));
                        },
                      ),
                      ListTile(
                        title: Text('Scannig QR',style: TextStyle(fontSize: 24),),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>QRViewExample(),
                              ));
                        },
                      ),
                      ListTile(
                        title: Text('Settings',style: TextStyle(fontSize: 24),),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settings(),
                              ));
                        },
                      ),
                      ListTile(
                        title: Text('Sign out',style: TextStyle(fontSize: 24),),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: CustomScrollView(
            slivers:<Widget> [
              SliverAppBar(
                centerTitle: true,
                title: Text('Subject' ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 36),),
                toolbarHeight: MediaQuery.of(context).padding.top * 6,
                expandedHeight: MediaQuery.of(context).size.height*0.25,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.teal, Colors.blueAccent])),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
