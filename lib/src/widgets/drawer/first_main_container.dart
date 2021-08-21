
import 'package:flutter/material.dart';

import 'container_profile_widget.dart';
import 'logo_profile_widget.dart';

class FirstMainContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.35,
      child: Column(
        children: [
          LogoProfileWidget(),
          ContainerProfileWidget(),
        ],
      ),
    );
  }
}
