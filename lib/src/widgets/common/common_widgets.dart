import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/providers/footer_provider.dart';
import 'package:admin_resto_app/src/utils/common_funtions.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';

class CommonWidgets {

  Widget ElevatedButtonWidget({required BuildContext context, required String title, required String widget}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return ElevatedButton(
      onPressed: () {
        utilsProvider.needLoad = true;
        utilsProvider.loadLogo = widget;
        print(widget);
      },
      child: Text(title),
    );
  }
  Widget ElevatedButtonSaveWidget({required BuildContext context, required String title, required GlobalKey<FormState> formKey}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final footerProvider = Provider.of<FooterProvider>(context);
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          utilsProvider.footerModel.contacto.direccion = footerProvider.direccion;
          utilsProvider.footerModel.contacto.mail = footerProvider.mail;
          utilsProvider.footerModel.contacto.telefono = footerProvider.telefono;
          await RequestService().replaceFooter(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: Text(title),
    );
  }
  Widget ContainerWidget({required Widget widget}){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget,
    );
  }
  Widget CardWidgetBasic({required Widget widget}){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: widget,
    );
  }
  Widget CardWidgetLabeled({
    required BuildContext context,
    required Widget widget,
    required Widget label,
    required bool beginSizedBox,
    required bool endSizedBox,
  }){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
                child: Center(child: label,),
              ),
              Expanded(child: Container())
            ],
          ),
          (beginSizedBox) ? SizedBox(height: 20,) : Container(),
          widget,
          (endSizedBox) ? SizedBox(height: 20,) : Container(),
        ],
      ),
    );
  }
  Widget logoInfoForCard({required BuildContext context, required String logo}){
    final Size size = MediaQuery.of(context).size;
    final modelProvider = Provider.of<ModelProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);

    ImageProvider<Object> selectImage ({required String logo}){
      if (logo == 'logo'){
        return (modelProvider.logoNew == '')
            ?NetworkImage(modelProvider.logo)
            :NetworkImage(modelProvider.logoNew);
      }else if (logo == 'logoFooter'){
        return (utilsProvider.logoFooterNew == '')
            ?NetworkImage(utilsProvider.footerModel.logoFooter)
            :NetworkImage(utilsProvider.logoFooterNew);
      } else if(logo == 'logoMenu'){
        return (utilsProvider.logoMenuNew == '')
            ?NetworkImage(utilsProvider.sectionUnoModel.menuPhoto)
            :NetworkImage(utilsProvider.logoMenuNew);
      } else {
        return NetworkImage(modelProvider.logoNew);
      }
    }

    Widget selectUrl (){
      if (logo == 'logo'){
        return Text((modelProvider.logoNew == '')
            ? CommonFuntions().transformText(modelProvider.logo)
            : CommonFuntions().transformText(modelProvider.logoNew),
        );
      }else if (logo == 'logoFooter'){
        return (utilsProvider.logoFooterNew == '')
            ? Text(CommonFuntions().transformText(utilsProvider.footerModel.logoFooter))
            : Text(CommonFuntions().transformText(utilsProvider.logoFooterNew));
      } else if(logo == 'logoMenu'){
        return (utilsProvider.logoMenuNew == '')
            ? Text(CommonFuntions().transformText(utilsProvider.sectionUnoModel.menuPhoto))
            : Text(CommonFuntions().transformText(utilsProvider.logoMenuNew));
      } else {
        return Text('');
      }

    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround
      ,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                image: selectImage(logo: logo)
            ),
          ),
        ),
        Container(
            width: size.width * 0.2,
            height: 15,
            child: PageView(
              children: [
                selectUrl(),
              ],
            )
        ),
        CommonWidgets().ElevatedButtonWidget(context: context, title: 'Editar', widget: logo)
      ],
    );
  }
  Widget ContainerTitle({required BuildContext context, required String title}){
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100)
      ),
      color: Theme.of(context).primaryColorLight,
      child: Container(
          width: 100,
          height: 30,
          child: Center(child: Text(title))
      ),
    );
  }
  Widget TextFormFieldWidget({required BuildContext context , required String field}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final footerProvider = Provider.of<FooterProvider>(context);
    String selectField (){
      if (field == 'Dirección'){
        return  utilsProvider.footerModel.contacto.direccion;
      }else if (field == 'Correo'){
        return utilsProvider.footerModel.contacto.mail;
      }else{
        return utilsProvider.footerModel.contacto.telefono;
      }
    }
    IconData selectIcon(){
      if (field == 'Dirección'){
        return Icons.location_on;
      }else if (field == 'Correo'){
        return Icons.mail;
      }else{
        return Icons.phone;
      }
    }
    saveField (String value){
      if (value != ''){
        if (field == 'Dirección'){
          print(1);
          footerProvider.direccion = value;
        }
        if (field == 'Correo'){
          print(2);
          footerProvider.mail = value;
        }
        if (field == 'Teléfono'){
          print(3);
          footerProvider.telefono = value;
        }
      }else {
        if (field == 'Dirección'){
          print(4);
          footerProvider.direccion = utilsProvider.footerModel.contacto.direccion;
          print(utilsProvider.contacto.direccion);
        }
        if (field == 'Correo'){
          print(5);
          footerProvider.mail = utilsProvider.footerModel.contacto.mail;
          print(utilsProvider.contacto.mail);
        }
        if (field == 'Teléfono'){
          print(6);
          footerProvider.telefono = utilsProvider.footerModel.contacto.telefono;
          print(utilsProvider.contacto.telefono);
        }
      }
    }
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onSaved: (value){
          saveField(value!);

        },
        decoration: InputDecoration(
          prefixIcon: Icon(selectIcon()),
          contentPadding: EdgeInsets.only(top: 15, bottom: 0, left: 20, right: 20),
          hintText: selectField(),
          labelText: field,
          border: OutlineInputBorder(
            gapPadding: 0,
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}