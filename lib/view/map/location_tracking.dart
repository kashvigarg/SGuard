import 'package:location/location.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Usermap extends StatefulWidget {
  const Usermap({Key? key}) : super(key: key);
  @override
  _UsermapState createState() => _UsermapState();
}

class _UsermapState extends State<Usermap> {
  LatLng? currentPosition;
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  Future getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      if (position != null) {
        currentPosition = LatLng(position.latitude, position.longitude);
        markers.add(Marker(
            markerId: const MarkerId('12'),
            position: currentPosition!,
            infoWindow: const InfoWindow(title: 'am here')));
      } else {
        print('error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          body: currentPosition == null
              ? const Center(child: Text("Loading"))
              : Stack(
                  children: [
                    GoogleMap(
                        initialCameraPosition:
                            CameraPosition(target: currentPosition!, zoom: 15),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        mapType: MapType.normal,
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: true,
                        markers: markers,
                        onMapCreated: (GoogleMapController controller) {
                          setState(() {
                            _controller.complete(controller);
                          });
                        }),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipOval(
                              child: Material(
                                color: Colors.blue[100], // button color
                                child: InkWell(
                                  splashColor: Colors.blue, // inkwell color
                                  child: const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.add),
                                  ),
                                  onTap: () async {
                                    final GoogleMapController mapController =
                                        await _controller.future;
                                    mapController.animateCamera(
                                      CameraUpdate.zoomIn(),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ClipOval(
                              child: Material(
                                color: Colors.blue[100], // button color
                                child: InkWell(
                                  splashColor: Colors.blue, // inkwell color
                                  child: const SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.remove),
                                  ),
                                  onTap: () async {
                                    final GoogleMapController mapController =
                                        await _controller.future;
                                    mapController.animateCamera(
                                      CameraUpdate.zoomIn(),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 10.0),
                          child: ClipOval(
                            child: Material(
                              color: Colors.orange[100], // button color
                              child: InkWell(
                                splashColor: Colors.orange, // inkwell color
                                child: const SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Icon(Icons.my_location),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ));
  }
}
