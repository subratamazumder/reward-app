import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

getPermissionsStatus() async {
  var permissions =
      await Permission.getPermissionsStatus([PermissionName.Location]);

  var permissionNames =
      await Permission.requestPermissions([PermissionName.Location]);

  Permission.openSettings;
}

class MapLocation extends StatefulWidget {
  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('SC Paul Jewellers'),
        position: LatLng(22.890193, 88.416018),
        infoWindow: InfoWindow(
          title: 'SC Paul Jewellers',
          snippet: '2, Canninghum Road, Naihati, Kolkata, West Bengal 743165',
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Color(0xFF18D191))),
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(22.890193, 88.416018), zoom: 16.0),
              markers: Set.from(allMarkers)),
        )
      ]),
    );
  }
}
