import 'dart:async';

import 'package:admin_resto_app/src/validators/login_validator.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with Validator{

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _emailRecoverController    = BehaviorSubject<String>();

  //Agregar valores al stream
  Function(String) get changeMail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeMailRecover => _emailRecoverController.sink.add;
  //Recuperar valores del stream

  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  Stream<String> get emailRecoverStream => _emailRecoverController.stream.transform(validarEmail);

  //Combinar Strems para validacion
  Stream<bool> get formValidationStream => Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  //Obtener ultimo valor ingresado
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get emailRecover => _emailRecoverController.value;
  dispose(){
    _emailController.close();
    _passwordController.close();
    _emailRecoverController.close();
  }

}