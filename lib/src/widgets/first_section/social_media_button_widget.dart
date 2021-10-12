import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SocialMediaButtonWidget extends StatefulWidget {
  final String red;
  SocialMediaButtonWidget({required this.red});
  @override
  _SocialMediaButtonWidgetState createState() => _SocialMediaButtonWidgetState();
}

class _SocialMediaButtonWidgetState extends State<SocialMediaButtonWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context);
    String selectLabel (){
      if (widget.red == 'Facebook'){
        return utilsProvider.footerModel.redes.facebook;
      }else {
        return utilsProvider.footerModel.redes.instagram;
      }
    }
    replaceRedes (){
      if (widget.red == 'Facebook'){
        utilsProvider.footerModel.redes.facebook = _controller.text;
      }else {
        utilsProvider.footerModel.redes.instagram = _controller.text;
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image(
          image: AssetImage('assets/${widget.red.toLowerCase()}.png'),
          width: 30,
          height: 30,
        ),
      ),
      onPressed: (){
        Alert(
            context: context,
            title: widget.red,
            content: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: selectLabel(),
                  ),
                ),
              ],
            ),
            buttons: [
              DialogButton(
                child: Text(
                  "Guardar",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                  onPressed: () {
                    replaceRedes();
                    Navigator.pop(context);
                    RequestService().replaceFooter(context);
                  }
              ),
            ]).show();
      },
    );
  }
}
