import 'package:admin_resto_app/src/auth/authentication_service.dart';
import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/backend/request_upload.dart';
import 'package:admin_resto_app/src/backend/request_user.dart';
import 'package:admin_resto_app/src/models/section_dos_model.dart';
import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/providers/footer_provider.dart';
import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/utils/common_funtions.dart';
import 'package:admin_resto_app/src/validators/login_bloc.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CommonWidgets {

  Widget ElevatedButtonWidget({required BuildContext context, required String title, required String widget, int indexMenu = 0}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final sectionDosProvider = Provider.of<SectionDosProvider>(context, listen: false);
    return ElevatedButton(
      onPressed: () async {
        if (widget == 'return'){
          Navigator.pushReplacementNamed(context, '/login');
        }else if (widget  == 'addMenu'){
          CommonFuntions().showAlertNewMenu(context);
        }else if(widget == 'delMenu'){
          sectionDosProvider.sectionIndex = indexMenu;
          if (sectionDosProvider.sectionDosModelNew.typeMenu.isEmpty){
            sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModel;
          }
          sectionDosProvider.sectionDosModelNew.typeMenu.elementAt(sectionDosProvider.sectionIndex).menu.forEach((element) async {
            sectionDosProvider.menuItemToDelete = element.img;
            await RequestUpload().deleteFile(context,'deleteItemMenu');
          });
          await RequestService().deleteSection(context);
        }else{
          if (widget == 'addItem'){
            sectionDosProvider.sectionIndex = indexMenu;
          }
          utilsProvider.needLoad = true;
          utilsProvider.loadLogo = widget;
        }
      },
      child: Text(title),
    );
  }
  Widget ElevatedButtonSaveWidget({required BuildContext context, required String title, required String section,required GlobalKey<FormState> formKey}){
    final utilsProvider = Provider.of<UtilsProvider>(context);
    final footerProvider = Provider.of<FooterProvider>(context);
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          if (section == 'footer'){
            utilsProvider.footerModel.contacto.direccion = footerProvider.direccion;
            utilsProvider.footerModel.contacto.mail = footerProvider.mail;
            utilsProvider.footerModel.contacto.telefono = footerProvider.telefono;
            await RequestService().replaceFooter(context);
          }
          if (section == 'sectionDos'){
            final Menu newMenu = new Menu(
                description: (sectionDosProvider.menuItem.description != '') ? sectionDosProvider.menuItem.description :'',
                img: sectionDosProvider.menuItem.img,
                price: (sectionDosProvider.menuItem.price != '') ? sectionDosProvider.menuItem.price :'',
                title: sectionDosProvider.menuItem.title,);
            if (sectionDosProvider.sectionDosModelNew.typeMenu.isEmpty){
              sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModel;
            }
            if (sectionDosProvider.menuItem.img != '' && sectionDosProvider.menuItem.title != ''){
              sectionDosProvider.sectionDosModelNew.typeMenu.elementAt(sectionDosProvider.sectionIndex).menu.add(newMenu);
              sectionDosProvider.sectionDosModelNew = sectionDosProvider.sectionDosModelNew;
              await RequestService().addSection(context);
            }else {
              final snackBar = SnackBar(content: Text('Imagen y t??tulo de men?? son par??metros obligatorios'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        }
      },
      child: Text(title),
    );
  }
  Widget ElevatedButtonLoginWidget({required BuildContext context, required String title, required LoginBloc bloc}){
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    Stream blocStream;
    if (title == 'Ingresar'){
      blocStream = bloc.formValidationStream;
    }else {
      blocStream = bloc.emailRecoverStream;
    }
    return StreamBuilder(
        stream: blocStream,
        builder: (context, snapshot){
          return (loginThemeProvider.isLoading)
              ? Container(
                  height: 25,
                  width: 50,
                  child: FadeIn(
                    duration: Duration(milliseconds: 300),
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse, /// Required, The loading type of the widget
                      colors: [Theme.of(context).primaryColor,Theme.of(context).primaryColorDark, Theme.of(context).primaryColorLight],
                    ),
                  ),
              )
             : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                  ),
                  onPressed: snapshot.hasData ? () async {
                    loginThemeProvider.isLoading = true;
                    if (title == 'Ingresar') {
                      final resp = await AuthenticationService().signIn(bloc.email, bloc.password, context);
                      if (resp == ''){
                        await RequestUser().getRestaurant(context, bloc.email);
                        Navigator.pushReplacementNamed(context, '/home');
                      }else {
                        ShowToast(context, resp, Icon(Icons.error));
                      }

                    }else if (title == 'Recuperar'){
                      final resp = await AuthenticationService().ressetPassword(bloc.emailRecover, context);
                      if (resp == ''){
                        ShowToast(context, 'Se ha enviado un correo para cambio de contrase??a', Icon(Icons.check));
                        loginThemeProvider.loginType = 'signIn';
                      }else {
                        ShowToast(context, resp, Icon(Icons.error));
                      }
                    }
                    loginThemeProvider.isLoading = false;
                  } : null,
                  child: Text(title),
            );
        }
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
    final constraintProvider = Provider.of<ConstraintProvider>(context, listen: false);

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
            ? CommonFuntions().transformText(context, modelProvider.logo)
            : CommonFuntions().transformText(context, modelProvider.logoNew),
        );
      }else if (logo == 'logoFooter'){
        return (utilsProvider.logoFooterNew == '')
            ? Text(CommonFuntions().transformText(context, utilsProvider.footerModel.logoFooter), overflow: TextOverflow.ellipsis,)
            : Text(CommonFuntions().transformText(context, utilsProvider.logoFooterNew));
      } else if(logo == 'logoMenu'){
        return (utilsProvider.logoMenuNew == '')
            ? Text(CommonFuntions().transformText(context, utilsProvider.sectionUnoModel.menuPhoto), overflow: TextOverflow.ellipsis,)
            : Text(CommonFuntions().transformText(context, utilsProvider.logoMenuNew));
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
            width: (constraintProvider.screenType == 2)
                ? size.width * 0.2
                : (constraintProvider.screenType == 1) ? size.width * 0.1 : size.width * 0.07,
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
    final sectionDosProvider = Provider.of<SectionDosProvider>(context);
    String selectField (){
      if (field == 'Direcci??n'){
        return  utilsProvider.footerModel.contacto.direccion;
      }else if (field == 'Correo'){
        return utilsProvider.footerModel.contacto.mail;
      }else if(field == 'T??tulo'){
        return 'Torrijas de Naranja';
      }else if(field == 'Descripci??n'){
        return 'Rebanadas de naranja con miel';
      }else if(field == 'Valor'){
        return '7.4';
      }else{
        return utilsProvider.footerModel.contacto.telefono;
      }
    }
    IconData selectIcon(){
      if (field == 'Direcci??n'){
        return Icons.location_on;
      }else if (field == 'Correo'){
        return Icons.mail;
      }else if(field == 'T??tulo'){
        return Icons.title;
      }else if(field == 'Descripci??n'){
        return Icons.description;
      }else if(field == 'Valor'){
        return Icons.monetization_on_outlined;
      }else{
        return Icons.phone;
      }
    }
    saveField (String value){
      if (value != ''){
        if (field == 'Direcci??n'){
          footerProvider.direccion = value;
        }
        if (field == 'Correo'){
          footerProvider.mail = value;
        }
        if (field == 'Tel??fono'){
          footerProvider.telefono = value;
        }
        if (field == 'T??tulo'){
          sectionDosProvider.menuItem.title = value;
        }
        if (field == 'Descripci??n'){
          sectionDosProvider.menuItem.description = value;
        }
        if (field == 'Valor'){
          sectionDosProvider.menuItem.price = value;
        }
      }else {
        if (field == 'T??tulo'){
          sectionDosProvider.menuItem.title = value;
        }
        if (field == 'Descripci??n'){
          sectionDosProvider.menuItem.description = value;
        }
        if (field == 'Valor'){
          sectionDosProvider.menuItem.price = value;
        }
        if (field == 'Tel??fono'){
          footerProvider.telefono = utilsProvider.footerModel.contacto.telefono;
        }
        if (field == 'Tel??fono'){
          footerProvider.telefono = utilsProvider.footerModel.contacto.telefono;
        }
        if (field == 'Tel??fono'){
          footerProvider.telefono = utilsProvider.footerModel.contacto.telefono;
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
  StreamBuilder<String> TextFormFieldLoginWidget ({required BuildContext context, required String label, required String title, required LoginBloc bloc}){
    final loginThemeProvider = Provider.of<LoginThemeProvider>(context);
    Icon icon = Icon(Icons.account_circle);
    if (label == 'Usuario'){
      icon =  Icon(Icons.account_circle, color: Theme.of(context).accentColor);
    }else if(label == 'UsuarioRecover'){
      icon =  Icon(Icons.account_circle, color: Theme.of(context).accentColor);
    }else{
      icon =  Icon(Icons.lock, color: Theme.of(context).accentColor);
    }

    bool showPassword(){
      if (label == 'Usuario'){
        return false;
      }else if (label == 'UsuarioRecover'){
        return false;
      }else{
        return loginThemeProvider.hidePassword;
      }
    }
    return StreamBuilder<String>(
      stream: (label == 'Usuario') ? bloc.emailStream : (label == 'UsuarioRecover') ? bloc.emailRecoverStream : bloc.passwordStream,
      builder: (context, AsyncSnapshot<String> snapshot){
        final iconShow = GestureDetector(
          child: Icon(Icons.remove_red_eye, color: Theme.of(context).accentColor),
          onTap: (){
            if (loginThemeProvider.hidePassword){
              loginThemeProvider.hidePassword = false;
            }else{
              loginThemeProvider.hidePassword = true;
            }
          },
        );
        return Container(
          child: TextFormField(
            obscureText: showPassword(),
            decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon: icon,
                suffixIcon: (label == 'Usuario' || label == 'UsuarioRecover') ? null : iconShow,
                labelText: title,
                errorText: (snapshot.error == null) ? null : snapshot.error.toString(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.circular(20),
                )
            ),
            onChanged: (label == 'Usuario') ? bloc.changeMail : (label == 'UsuarioRecover') ? bloc.changeMailRecover : bloc.changePassword,
          ),
        );
      },
    );
  }
  void ShowToast (BuildContext context, String text, Icon icon){
    FToast toast = FToast().init(context);
    toast.showToast(
      toastDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 16.0,
          left: 16.0,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width:20,),
          Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        ]
    ),);
  }
}