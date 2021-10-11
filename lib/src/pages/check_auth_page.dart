import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (LocalStorage.prefs.getString('idToken') == null){
      Navigator.pushReplacementNamed(context, 'login');
      return Scaffold(
        body: Center(
          child: CheckAuthLoading(),
        ),
      );
    }else {
      return Center(child: Text('Hola'));
    }

  }
}
class CheckAuthLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LoadingIndicator(
      indicatorType: Indicator.lineSpinFadeLoader,
    );
  }
}

