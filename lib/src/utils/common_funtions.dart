import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter/cupertino.dart';

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

}

