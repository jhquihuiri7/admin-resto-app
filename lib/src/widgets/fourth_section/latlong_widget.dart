import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LatLngWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context);

    List<String> setLatLng(){
      if (sectionCuatroProvider.latNew == '' && sectionCuatroProvider.lngNew == ''){
        return <String>[
          sectionCuatroProvider.sectionCuatro.map.lat,
          sectionCuatroProvider.sectionCuatro.map.lng
        ];
      }else {
        print('no vacio');
        return <String>[
          sectionCuatroProvider.latNew,
          sectionCuatroProvider.lngNew
        ];
      }
    }
    return Column(
      children: [
        ListTile(
          trailing: Text('Lat'),
          title: Text(setLatLng()[0]),
        ),
        ListTile(
          trailing: Text('Lang'),
          title: Text(setLatLng()[1]),
        )
      ],
    );
  }
}
