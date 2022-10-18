// import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';

// class MapPage extends StatefulWidget {
//   const MapPage({super.key});

//   @override
//   State<MapPage> createState() => _MapPageState();
// }

// class _MapPageState extends State<MapPage> {
//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//       mapController: MapController(),
//       options: MapOptions(
//         center: LatLng(0.0, 0.0),
//         zoom: 10,
//         maxZoom: 13,
//         bounds: LatLngBounds(
//           LatLng(51.74920, -0.56741),
//           LatLng(51.25709, 0.34018),
//         ),
//         rotation: 180.0,
//       ),
//       children: [TileLayer()],
//     );
//   }
// }
