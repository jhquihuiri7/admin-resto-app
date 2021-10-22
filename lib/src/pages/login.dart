import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/widgets/login/login_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  Theme.of(context).accentColor.withOpacity(0.4),
                  Theme.of(context).accentColor.withOpacity(0.55),
                  Theme.of(context).accentColor.withOpacity(0.7),
                  Theme.of(context).accentColor.withOpacity(0.85),
                  Theme.of(context).accentColor.withOpacity(1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,),
            Image(
              image: AssetImage('assets/favicon.png'),
              height: 75,
              width: 75,
            ),
            SizedBox(height: 15),
            Text('Administrador | Restaurantes', style: GoogleFonts.cabin(
                textStyle: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.bold
                )),),
            SizedBox(height: 20),
            LoginContainerWidget(),
          ],
        ),
      ),
    );
  }
}