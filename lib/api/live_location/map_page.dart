// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_google_maps/flutter_google_maps.dart';

// class MapPage extends StatelessWidget {
//   const MapPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FireMap(),
//     );
//   }
// }

// class FireMap extends StatefulWidget {
//   const FireMap({super.key});

//   @override
//   State<FireMap> createState() => _FireMapState();
// }

// class _FireMapState extends State<FireMap> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: const [
//         GoogleMap(
//           initialPosition: GeoCoord(24.98, 54.77),
//           //onTap: _onMapCreated,
//           maxZoom: 10,
//           mapType: MapType.roadmap,
//           mapStyle: AutofillHints.addressCity,
//         )
//       ],
//     );
//   }
// }

// // void _onMapCreated(GoogleMapController controller) {
// //     setState(() {
// //       mapController = controller;
// //     });
// //   }
// // }