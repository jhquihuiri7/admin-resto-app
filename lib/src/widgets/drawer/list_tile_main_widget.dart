import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/utils/select_section.dart';
import 'package:admin_resto_app/src/utils/select_subsection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileMainWidget extends StatelessWidget {
  String title;
  IconData icon;
  int index;

  ListTileMainWidget({required this.title, required this.icon, required this.index});
  @override
  Widget build(BuildContext context) {
    final utilsProvider = Provider.of<UtilsProvider>(context, listen: false);
    final constraintProvider = Provider.of<ConstraintProvider>(context, listen: false);
    TextStyle style = TextStyle(fontSize: 13, color: (this.index == utilsProvider.mainIndex)
        ? Theme.of(context).primaryColor
        : Colors.blueGrey);
    return ListTile(
      title: Text((constraintProvider.screenType == 2)?title:'', style: style,),
      trailing: Container(
        height: 20,
        width: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: (this.index == utilsProvider.mainIndex)
              ? Theme.of(context).primaryColor
              : Colors.transparent,
        ),
      ),
      leading: Icon(icon, size: 17,
        color: (this.index == utilsProvider.mainIndex)
            ? Theme.of(context).primaryColor
            : Colors.grey,),
      onTap: (){
        SelectSubsection().resetValues(context);
        utilsProvider.mainIndex = index;
        if (utilsProvider.mainIndex == 4) {
          SelectSection().launchWhatsApp();
        }else if (utilsProvider.mainIndex == 5){
          LocalStorage.prefs.remove('restaurantName');
          LocalStorage.prefs.remove('restaurantPath');
          Navigator.pushReplacementNamed(context, '/login');
        }

      },
    );
  }
}
