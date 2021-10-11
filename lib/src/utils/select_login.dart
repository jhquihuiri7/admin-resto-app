import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/widgets/login/recoverPassword_widget.dart';
import 'package:admin_resto_app/src/widgets/login/signIn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SelectLogin {
  Widget? selectLogin (BuildContext context){
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    Map<String, Widget> loginMap = <String, Widget>{
      'signIn' : SingInWidget(),
      'recover' : RecoverPasswordWidget(),
    };
    return (loginMap.containsKey(loginThemeProvider.loginType))
        ? loginMap[loginThemeProvider.loginType]
        : Container();
  }
}