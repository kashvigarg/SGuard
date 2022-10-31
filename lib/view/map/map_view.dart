import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:empowering_humanity/src/locations.dart' as locations;
import 'package:location/location.dart';

class MyAppMap extends StatefulWidget {
  const MyAppMap({super.key});

  @override
  State<MyAppMap> createState() => _MyAppMapState();
}

class _MyAppMapState extends State<MyAppMap> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng? currentLocation;
  Set<Marker> markers = {};
  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      if (position != null) {
        currentLocation = LatLng(position.latitude, position.longitude);
        markers.add(Marker(
          markerId: const MarkerId('current'),
          position: currentLocation!,
        ));
      } else {
        print('error');
      }
    });
  }

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Track where you are'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () => GoRouter.of(context).go('/user'),
              icon: Icon(Icons.arrow_back),
            )
          ],
        ),
        body: currentLocation == null
            ? Center(child: CircularProgressIndicator())
            : GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: currentLocation!, zoom: 15),
                markers: markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) => setState(() {
                  _controller.complete(controller);
                }),
              ),
      ),
    );
  }
}
