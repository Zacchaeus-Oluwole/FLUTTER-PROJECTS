import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double long;

  const MapScreen({super.key, required this.lat, required this.long});
  
  @override
  _MapScreenState createState() => _MapScreenState(lat: lat, long: long);
}

class _MapScreenState extends State<MapScreen> {
  final double lat;
  final double long;
  late GoogleMapController mapController;

  _MapScreenState({required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    print("${lat} + ${long}");
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 130, 152),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 130, 152),
        title: Text('Map'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long), // Replace with your coordinates
          zoom: 12.0,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }
}
