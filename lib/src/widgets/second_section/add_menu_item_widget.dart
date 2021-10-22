import 'package:flutter/material.dart';

import '../export_widget.dart';

class AddMenuItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child:Column(
            children: [
              SizedBox(height: 20,),
              CommonWidgets().ContainerTitle(context: context, title: 'Título'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Título'),
              SizedBox(height: 15,),
              CommonWidgets().ContainerTitle(context: context, title: 'Descripción'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Descripción'),
              SizedBox(height: 15,),
              CommonWidgets().ContainerTitle(context: context, title: 'Valor'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Valor'),
              SizedBox(height: 20,),
              CommonWidgets().ElevatedButtonSaveWidget(context: context, title: 'Agregar', section: 'sectionDos',formKey: _formKey),
              SizedBox(height: 20,),
            ],
          )
        )
    );
  }
}
