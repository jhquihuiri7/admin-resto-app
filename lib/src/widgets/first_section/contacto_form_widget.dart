import 'package:admin_resto_app/src/widgets/export_widget.dart';

class ContactoFormWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SizedBox(height: 20,),
       Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               SizedBox(height: 20,),
               CommonWidgets().ContainerTitle(context: context, title: 'Dirección'),
               CommonWidgets().TextFormFieldWidget(context: context, field: 'Dirección'),
               SizedBox(height: 15,),
               CommonWidgets().ContainerTitle(context: context, title: 'Correo'),
               CommonWidgets().TextFormFieldWidget(context: context, field: 'Correo'),
               SizedBox(height: 15,),
               CommonWidgets().ContainerTitle(context: context, title: 'Teléfono'),
               CommonWidgets().TextFormFieldWidget(context: context, field: 'Teléfono'),
               SizedBox(height: 20,),
               CommonWidgets().ElevatedButtonSaveWidget(context: context, title: 'Guardar', formKey: _formKey)
             ],
           ),

         ),
        )
       ]
    );
  }
}
