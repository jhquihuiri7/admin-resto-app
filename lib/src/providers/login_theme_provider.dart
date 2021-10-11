import 'package:flutter/cupertino.dart';

class LoginThemeProvider extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;
  set isHovered (bool value){
    _isHovered = value;
    notifyListeners();
  }

  String _loginType = 'signIn';
  String get loginType => _loginType;
  set loginType (String value) {
    _loginType = value;
    notifyListeners();
  }

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set hidePassword (bool value) {
    _hidePassword = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading (bool value) {
    _isLoading = value;
    notifyListeners();
  }
}