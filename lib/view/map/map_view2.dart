import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:empowering_humanity/src/locations.dart' as locations;
import 'package:location/location.dart';

class MapView2 extends StatefulWidget {
  const MapView2({super.key});

  @override
  State<MapView2> createState() => _MapView2State();
}

class _MapView2State extends State<MapView2> {
  Location location = Location();
  Set<Marker> _markers = {};
  late GoogleMapController controller;
  LatLng _currentLoc = LatLng(0, 0);
  void onMapCreated(GoogleMapController controller) async {
    Position position = await Geolocator.getCurrentPosition();
    // var pos = location.getLocation();
    controller = controller;
    setState(() {
      _currentLoc = LatLng(position.latitude, position.longitude);
      final pos2 = Marker(
        markerId: MarkerId("map"),
        icon: BitmapDescriptor.defaultMarker,
        position: _currentLoc,
      );
      _markers = {pos2};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Track where you are"),
        ),
        body: GoogleMap(
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            markers: _markers,
            initialCameraPosition: CameraPosition(target: _currentLoc)));
  }
}

// class MyAppMap extends StatefulWidget {
//   const MyAppMap({super.key});

//   @override
//   State<MyAppMap> createState() => _MyAppMapState();
// }

// class _MyAppMapState extends State<MyAppMap> {
//   Future getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission != PermissionStatus.granted) {
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission != PermissionStatus.granted) getLocation();
//       return;
//     }
//     getLocation();
//   }

//   late GoogleMapController _controller;
//   late CameraPosition _cameraPosition;
//   late LatLng latlong;
//   Set<Marker> _markers = {};

//   List<dynamic> results = [];
//   getLocation() async {
//     Position position = await Geolocator.getCurrentPosition();
//     print(position.latitude);

//     setState(() {
//       latlong = new LatLng(position.latitude, position.longitude);
//       _cameraPosition = CameraPosition(target: latlong, zoom: 10.0);
//       if (_controller != null)
//         _controller
//             .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));

//       _markers.add(Marker(
//           markerId: MarkerId("a"),
//           draggable: true,
//           position: latlong,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           onDragEnd: (_currentlatLng) {
//             latlong = _currentlatLng;
//           }));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Google Office Locations'),
//           backgroundColor: Colors.green[700],
//         ),
//         body: GoogleMap(
//           initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
//           onMapCreated: (GoogleMapController controller) {
//             _controller = (controller);
//             _controller
//                 .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
//           },
//           markers: _markers,
//           onCameraIdle: () {
//             setState(() {});
//           },
//         ),
//       ),
//     );
//   }
// }
