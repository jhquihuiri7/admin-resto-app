import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width:double.infinity),
          Image(
            image: AssetImage('assets/404.png'),
            height: size.height * 0.7,
            width: size.height * 0.7,
            fit: BoxFit.cover,
          ),
          TitleTheme().titleTheme('Página No Encontrada', 1),
          SizedBox(height: 20,),
          CommonWidgets().ElevatedButtonWidget(
              context: context,
              title: 'Regresar',
              widget: 'return')
        ],
      ),
    );
  }
}
