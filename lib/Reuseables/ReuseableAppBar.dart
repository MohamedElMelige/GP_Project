import 'package:flutter/material.dart';

class ReuseableAppBar extends StatelessWidget {
  const ReuseableAppBar({required this.title}) ;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      title: Text(title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36)
      ),
      centerTitle: true,
      toolbarHeight: MediaQuery.of(context).padding.top * 6,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal, Colors.blueAccent])),
      ),
    );
  }
}