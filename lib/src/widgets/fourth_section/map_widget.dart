
import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as mapWeb;
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final sectionCuatroProvider = Provider.of<SectionCuatroProvider>(context);

    LatLng latLng = LatLng(0, 0);
    if (sectionCuatroProvider.latNew == '' && sectionCuatroProvider.lngNew == ''){
      latLng =  LatLng(
        double.parse(sectionCuatroProvider.sectionCuatro.map.lat),
        double.parse(sectionCuatroProvider.sectionCuatro.map.lng),
      );
    }else {
      latLng =  LatLng(
        double.parse(sectionCuatroProvider.latNew),
        double.parse(sectionCuatroProvider.lngNew),
      );
    }

    final CameraPosition _cameraPosition = CameraPosition(
      target: latLng,
      zoom: 18,
    );

    List<Marker> _markers = <Marker>[
        Marker(
        markerId: MarkerId('marker${sectionCuatroProvider.mapId}'),
        position: latLng,
        consumeTapEvents: true,
        infoWindow: InfoWindow(
        title: 'La Sazon'
        ),
        draggable: false,
        ),
    ];


    return Column(
      children: [
        SizedBox(height: 20,),
        Container(
          width: double.infinity,
          height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: mapWeb.GoogleMapsPlugin().buildView(
                sectionCuatroProvider.mapId, (id) { },
                initialCameraPosition: _cameraPosition,
                markers: _markers.toSet(),
               )
          ),
        )
      ],
    );
  }
}
