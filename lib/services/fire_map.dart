import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireMap extends StatefulWidget {

  FireMap({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _FireMapState();

}

class _FireMapState extends State<FireMap> {
  Set<Marker> _markers = HashSet<Marker>();
  LatLng locate;

  void _onCreateMarker(LatLng value) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId("0"),
        position: value,
        infoWindow: InfoWindow(
          title: "Local do Evento",
        )
      ));
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Localização"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(-16.65908, -49.23346),
              zoom: 15
            ),
            markers: _markers,
            onTap: (value) {
              _onCreateMarker(value);
              setState(() => locate = value);
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.fromLTRB(0, 0, 0, 32.0),
            child: RaisedButton(
              child: Text("Pegar Localização"),
              onPressed: () {
                Navigator.pop(context, locate);
              },
            ),
          )
        ],
      ),
    );
  }

}