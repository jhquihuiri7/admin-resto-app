import 'dart:async';

class Validator {

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink){
        if (password.length >= 6){
          sink.add(password);
        } else{
          sink.addError("Debe incluir mas de 6 caracteres");
        }
      }
  );

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (mail, sink){
        Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp _regExp = new RegExp(pattern.toString());
        if (_regExp.hasMatch(mail)){
          sink.add(mail);
        }else{
          sink.addError("Email no valido");
        }
      }
  );

}