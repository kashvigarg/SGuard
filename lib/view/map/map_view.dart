import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// tracking user location for local admin

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();
  final User? user = FirebaseAuth.instance.currentUser;
  LatLng? currentLocation;
  Set<Marker> markers = {};
  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      {
        currentLocation = LatLng(position.latitude, position.longitude);
        markers.add(Marker(
          markerId: const MarkerId('current'),
          position: currentLocation!,
        ));
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
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
        body: currentLocation == null
            ? const Center(child: CircularProgressIndicator())
            : GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: currentLocation!, zoom: 15),
                markers: markers,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) => setState(() {
                  _controller.complete(controller);
                  // TODO : push location to firebase
                }),
              ),
      ),
    );
  }
}
