import 'package:flutter/material.dart';
import 'package:sarkaradminapp/const/colors.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({
    super.key,
    required this.detail,
    required this.title,
  });

  final String title;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          '$title : $detail',
          style: const TextStyle(
              color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
        ));
  }
}
