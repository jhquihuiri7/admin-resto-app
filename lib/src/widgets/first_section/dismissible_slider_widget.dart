import 'package:admin_resto_app/src/backend/request.dart';
import 'package:admin_resto_app/src/backend/request_upload.dart';
import 'package:admin_resto_app/src/models/section_uno_model.dart';
import 'package:admin_resto_app/src/utils/common_funtions.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';


class DismissibleSliderWidget extends StatelessWidget {

  final String type;
  DismissibleSliderWidget({required this.type});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final modelProvider = Provider.of<ModelProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);
    List<SlidePromo> data = [];

    List<SlidePromo> setSlider(){
      if (type == 'sliderHeader'){

        if (modelProvider.slideHeaderNew.isEmpty){
          print('estoy aqui');
          data = modelProvider.slideHeader;
        }else{
          data = modelProvider.slideHeaderNew;
        }
      }else if (type == 'sliderPromo'){
        data = utilsProvider.sectionUnoModel.slidePromo;
      }
      return data;
    }
    double containerHeight (){
      print((size.height - 40 >= data.length * 80) ? data.length * 80 : size.height - 40);
      return (size.height - 40 >= setSlider().length * 80) ? setSlider().length * 80 : size.height - 40;
    }
    return Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: containerHeight(),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index){
                        var delWidget = data[index];
                        return Column(
                          children: [
                            SizedBox(height: 20,),
                            Dismissible(
                              background: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              key: Key(data[index].img),
                              child: ListTile(
                                title: Text(CommonFuntions().transformText(data[index].img)),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data[index].img),
                                  ),
                                ),
                              ),
                              onDismissed: (direction) async{
                                data.remove(delWidget);
                                Provider.of<ModelProvider>(context, listen: false).slideToDelete = delWidget;
                                Provider.of<ModelProvider>(context, listen: false).slideHeaderNew = data;
                                await RequestUpload().deleteFile(context, 'img', 'deleteSliderHeader');
                                await RequestService().removeSlider(context, type);
                              },
                            ),
                          ],
                        );
                      }
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    CommonWidgets().ElevatedButtonWidget(context: context, title: 'Add', widget: 'addSliderHeader'),
                    SizedBox(width: 20,)
                  ],
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),

        ]
    );
  }
}