import 'package:admin_resto_app/src/widgets/export_widget.dart';

class FooterProvider extends ChangeNotifier {

  String _direccion = '';
  String _mail = '';
  String _telefono = '';

  String get direccion => _direccion;
  String get mail => _mail;
  String get telefono => _telefono;

  set direccion (String value){
    _direccion = value;
    notifyListeners();
  }
  set mail (String value){
    _mail = value;
    notifyListeners();
  }
  set telefono (String value){
    _telefono = value;
    notifyListeners();
  }

}