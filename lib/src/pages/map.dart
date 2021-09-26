import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as mapWeb;

class MapWidget extends StatefulWidget {



  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  Completer<mapWeb.GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.904556, -89.606214),
    zoom: 18,
  );
  List<Marker> _markers = <Marker>[];

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
          markerId: MarkerId('SomeId'),
          position: LatLng(-0.904556, -89.606214),
          consumeTapEvents: true,
          infoWindow: InfoWindow(
              title: 'La Sazon'
          ),
          flat: true,
          draggable: true,
          onDragEnd: (langlat){
            print('ok');
            print(langlat);
          }
      )
    );
    var myMap = mapWeb.GoogleMapsPlugin();
    
    return Container(
      width: double.infinity,
      height: 400,
      child: myMap.buildView(
          1, (id) { },
          initialCameraPosition: _kGooglePlex,
      ),

    );
  }
}
