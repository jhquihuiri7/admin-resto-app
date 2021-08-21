import 'package:admin_resto_app/src/widgets/export_widget.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class SectionUnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final modelProvider = Provider.of<ModelProvider>(context);
    final utilsProvider = Provider.of<UtilsProvider>(context);
    return ListView(
      children: <Widget>[
        SizedBox(height: 15,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              TitleTheme().titleTheme('Mi Logo',2),
              SizedBox(height: 10,),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Row(
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
                            image: (modelProvider.logoNew == '')
                                ?NetworkImage(modelProvider.logo)
                                :NetworkImage(modelProvider.logoNew)
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      height: 15,
                      child: PageView(
                        children: [
                          Text((modelProvider.logoNew == '')
                              ? '${modelProvider.logo.substring(0,8)}...${modelProvider.logo.substring(80)}'
                              : '${modelProvider.logoNew.substring(0,8)}...${modelProvider.logoNew.substring(80)}',
                            )
                        ],
                      )
                    ),
                    ElevatedButton(
                        onPressed: () {
                          utilsProvider.loadLogo = 'logo';
                          },
                        child: Text('Editar'))
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          )
        ),
        SizedBox(height: 15,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              TitleTheme().titleTheme('Footer Info',2),
              SizedBox(height: 10,),
              FooterInfoWidget(),
              SizedBox(height: 30,),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageSlideshow(
                  width: double.infinity,
                  height: 200,
                  initialPage: 0,
                  indicatorColor: Colors.blue,
                  indicatorBackgroundColor: Colors.grey,
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: [
                    Image(
                      image: AssetImage('assets/add_img.png'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('assets/launcher_icon.png'),
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: AssetImage('assets/instagram.png'),
                      fit: BoxFit.cover,
                    )
                  ]
              )
            ],
          ),
        ),
      ],

    );
  }
}
