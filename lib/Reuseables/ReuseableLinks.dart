import 'package:flutter/material.dart';
class ReuseableLinks extends StatelessWidget {
  const ReuseableLinks({required this.text1,required this.icon,required this.onPressed});
  final String text1;
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed:onPressed(), child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 18,),
        Text(text1,style: TextStyle(fontSize: 20,color: Colors.black87),)
      ],
    ));
  }
}