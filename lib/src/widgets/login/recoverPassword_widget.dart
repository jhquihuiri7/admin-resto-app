import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/validators/login_bloc.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecoverPasswordWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    final loginBloc = Provider.of<LoginBloc>(context);
    return Form(
        child: Column(
          children: [
            Text('Restablece tu contraseña aquí'),
            SizedBox(height: 15,),
            CommonWidgets().TextFormFieldLoginWidget(context: context, label: 'UsuarioRecover', title: 'Usuario', bloc: loginBloc),
            SizedBox(height: 25,),
            Text('Te enviaremos un link a tu correo para restablecer tu contraseña'),
            SizedBox(height: 10,),
            CommonWidgets().ElevatedButtonLoginWidget(context: context, title: 'Recuperar', bloc: loginBloc),
            SizedBox(height: 10,),
            MouseRegion(
              onEnter: (_){
                loginThemeProvider.isHovered = false;
              },
              onExit: (_){
                loginThemeProvider.isHovered = true;
              },
              child: GestureDetector(
                  child: Text('Regresar',
                    style: TextStyle(
                        fontWeight: (loginThemeProvider.isHovered)
                          ?FontWeight.normal
                          :FontWeight.bold
                    ),
                  ),
                  onTap: () {
                    loginThemeProvider.loginType = 'signIn';
                  }
              ),
            ),
          ],
        )
    );
  }
}
