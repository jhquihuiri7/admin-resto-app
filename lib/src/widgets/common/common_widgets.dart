import 'package:admin_resto_app/src/widgets/export_widget.dart';

class CommonWidgets {

  Widget ElevatedButtonWidget({required BuildContext context, required String title, required String widget}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return ElevatedButton(
      onPressed: () {
        utilsProvider.loadLogo = widget;
      },
      child: Text(title),
    );
  }
}