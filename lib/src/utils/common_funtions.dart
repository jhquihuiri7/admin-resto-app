import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CommonFuntions {
  String transformText(BuildContext context,String title){
    final constraintProvider = Provider.of<ConstraintProvider>(context, listen: false);
    return (constraintProvider.screenType == 2)
        ?'${title.substring(80).split('.')[0]}.${title.substring(80).split('.')[1].split('?')[0]}'
        :title.substring(80).split('.')[0];
  }
  String transformTextBackend(String title){
    return '${title.substring(80).split('.')[0]}.${title.substring(80).split('.')[1].split('?')[0]}';
  }
  void showAlertNewMenu(BuildContext context){
    TextEditingController controller = TextEditingController();
    Alert(
      context: context,
      content: Column(
        children: <Widget>[
          Icon(Icons.add, size: 50, color: Theme.of(context).accentColor,),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(Icons.arrow_forward_outlined),
              labelText: 'Sección',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Agregar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),

          onPressed: () {
            TypeMenu newSection = TypeMenu(type: controller.text, menu: []);
            final sectionDosProvider = Provider.of<SectionDosProvider>(context, listen: false);
            sectionDosProvider.sectionDosModel.typeMenu.add(newSection);
            sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModel;
            RequestService().addSection(context);
            Navigator.pop(context);
          },
        ),
      ],
    ).show();
  }
}

