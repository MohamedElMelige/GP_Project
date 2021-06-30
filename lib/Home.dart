import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gp_project/Settings.dart';
import 'package:gp_project/auth/logIn.dart';

import 'ScanningQR.dart';
import 'Subject.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: Text('Home' ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 36),),
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

          // Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text('Welcome',style: TextStyle(fontSize: 40),)
          //     ],
          //   ),
          // ),

    );
  }
}
