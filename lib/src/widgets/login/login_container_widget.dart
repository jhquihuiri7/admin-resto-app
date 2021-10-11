import 'package:admin_resto_app/src/utils/select_login.dart';
import 'package:flutter/material.dart';

class LoginContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets. all(25),
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(1,1),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ]
      ),
      child: SelectLogin().selectLogin(context),
    );
  }
}
