import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/models/footer_model.dart';
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
                    labelText: 'Username',
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
                  bool addNew = false;
                  bool deleteOld = false;
                  Redes deteleRed = Redes(red: 'red', url: 'url');
                  utilsProvider.footerModel.redes.forEach((element) {
                    if (element.red == widget.red){
                      if (_controller.text != ''){
                        element.url = _controller.text;
                      }else {
                        deteleRed.red = element.red;
                        deteleRed.url = element.url;
                        deleteOld = true;
                      }
                    }else {
                      addNew = true;
                    }
                  });
                  if (addNew){
                    final red = Redes(red: widget.red, url: _controller.text);
                    utilsProvider.footerModel.redes.add(red);
                  }
                  if (deleteOld){
                    utilsProvider.footerModel.redes.remove(deteleRed);
                  }
                    Navigator.pop(context);
                    RequestService().replaceFooter(context);
                  }
              ),
            ]).show();
      },
    );
  }
}
