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
              SizedBox(height: 10,),
              CommonWidgets().ContainerTitle(context: context, title: 'Título'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Título'),
              SizedBox(height: 10,),
              CommonWidgets().ContainerTitle(context: context, title: 'Descripción'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Descripción'),
              SizedBox(height: 10,),
              CommonWidgets().ContainerTitle(context: context, title: 'Valor'),
              CommonWidgets().TextFormFieldWidget(context: context, field: 'Valor'),
              SizedBox(height: 15,),
              CommonWidgets().ElevatedButtonSaveWidget(context: context, title: 'Agregar', section: 'sectionDos',formKey: _formKey),
              SizedBox(height: 10,),
              Container(padding: EdgeInsets.symmetric(horizontal: 20),child: Text('Para una adecuada visualización, cargue imágenes de 500x500 px', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)),
            ],
          )
        )
    );
  }
}
