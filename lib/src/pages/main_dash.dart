import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/widgets/export_widget.dart';


class MainDash extends StatefulWidget {

  @override
  _MainDashState createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final constraintProvider = Provider.of<ConstraintProvider>(context, listen: false);
    return LayoutBuilder(
        builder: (context, constraints){
          if (constraints.maxWidth > 870){
            constraintProvider.screenType = 2;
          }else if (constraints.maxWidth > 550){
            constraintProvider.screenType = 1;
          }else  {
            constraintProvider.screenType = 0;
          }
          return Scaffold(
            backgroundColor: Color(0xffe9ecf1),
            body: Center(
              child: Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: double.infinity,
                    width: size.width * 0.2,
                    child: Column(
                      children: [
                        FirstMainContainer(),
                        SizedBox(height: size.height * 0.02,),
                        SecondMainContainer(),
                        CopyRight(),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.02,),
                  Container(
                      height: double.infinity,
                      width: size.width * 0.38,
                      child: SelectSection().selectSection(context)
                  ),
                  SizedBox(width: size.width * 0.02,),
                  Container(
                    height: double.infinity,
                    width: size.width * 0.36,
                    child: SelectSubsection().selectSubsection(context),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
