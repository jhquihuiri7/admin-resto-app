import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/validators/login_bloc.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingInWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    final loginBloc = Provider.of<LoginBloc>(context);
    return Form(
        child: Column(
          children: [
            CommonWidgets().TextFormFieldLoginWidget(context: context, label: 'Usuario', title: 'Usuario',bloc: loginBloc),
            SizedBox(height: 15,),
            CommonWidgets().TextFormFieldLoginWidget(context: context, label: 'Contraseña', title: 'Contraseña',bloc: loginBloc),
            SizedBox(height: 25,),
            MouseRegion(
              onEnter: (_){
                loginThemeProvider.isHovered = true;
              },
              onExit: (_){
                loginThemeProvider.isHovered = false;
              },
              child: GestureDetector(
                  child: Container(
                    child: Text('¿Olvidaste tu contraseña?'),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: (loginThemeProvider.isHovered)
                                  ? Colors.black
                                  : Colors.transparent,
                            )
                        )
                    ),
                  ),
                  onTap: () {
                    loginThemeProvider.loginType = 'recover';
                  }
              ),
            ),
            SizedBox(height: 10,),
            CommonWidgets().ElevatedButtonLoginWidget(context: context, title: 'Ingresar', bloc: loginBloc)
          ],
        )
    );
  }
}
