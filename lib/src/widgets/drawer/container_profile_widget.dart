import 'package:flutter/material.dart';

class ContainerProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 15,
      decoration: BoxDecoration(
        color: Color(0xff102689),
        borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(1,2),
              blurRadius: 2,
              spreadRadius: 0.5,
            ),
          ]
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
