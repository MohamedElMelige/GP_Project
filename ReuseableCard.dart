import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.firstName, required this.lastNaame, required this.departId, required this.subjectId, required this.email});
  final String firstName, lastNaame, departId,subjectId,email;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 12, right: 15, left: 15),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
