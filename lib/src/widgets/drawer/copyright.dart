import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: double.infinity,
      child: Center(
        child: Text('© Logiciel AppLab | 2021', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
