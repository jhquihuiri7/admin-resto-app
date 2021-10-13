import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:admin_resto_app/src/pages/404_page.dart';
import 'package:admin_resto_app/src/pages/login.dart';
import 'package:admin_resto_app/src/pages/main_dash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute (RouteSettings settings){
    switch (settings.name){
      case '/login':
        if (LocalStorage.prefs.getString('restaurantPath')!= null){
          return MaterialPageRoute(
              builder: (_) => MainDash(),
              settings: RouteSettings(name: '/home')
          );
        }else {
          return MaterialPageRoute(
              builder: (_) => LoginScreen(),
              settings: RouteSettings(name: '/login')
          );
        }

      case '/home':
        if (LocalStorage.prefs.getString('restaurantPath')== null){
          return MaterialPageRoute(
              builder: (_) => LoginScreen(),
              settings: RouteSettings(name: '/login')
          );
        }else {
          return MaterialPageRoute(
              builder: (_) => MainDash(),
              settings: RouteSettings(name: '/home')
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => PageNotFound(),
          settings: RouteSettings(name: '/pagina_no_encontrada')
        );
    }

    return MaterialPageRoute(builder: (_)=> LoginScreen());
  }
}