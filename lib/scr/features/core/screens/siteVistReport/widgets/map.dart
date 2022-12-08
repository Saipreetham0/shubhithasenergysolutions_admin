import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';
import 'dart:ui' as ui;

Widget getMap() {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final myLatlng = LatLng(1.3521, 103.8198);

    final mapOptions = MapOptions()
      ..zoom = 10
      ..center = LatLng(1.3521, 103.8198);

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%"
      ..style.border = 'none';

    final map = GMap(elem, mapOptions);

    Marker(MarkerOptions()
      ..position = myLatlng
      ..map = map
      ..title = 'Hello World!'
      );

    return elem;
  });

  return HtmlElementView(viewType: htmlId);
}

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

// class map extends StatefulWidget {
//   const map({super.key});

//   @override
//   State<map> createState() => _mapState();
// }

// class _mapState extends State<map> {
//   late GoogleMapController mapController;
//   List<Marker> _markers = [];
//   bool showMap = true;
//   @override
//   void initState() {
//     super.initState();

//     if (_markers.isNotEmpty) {
//       setState(() {
//         _markers.add(
//           Marker(
//             markerId: MarkerId('My Location'),
//             position: LatLng(1.3521, 103.8198),
//             infoWindow: InfoWindow(
//               title: 'Hello World',
//             ),
//           ),
//         );
//         showMap = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: showMap
//           ? GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(1.3521, 103.8198),
//                 zoom: 10,
//               ),
//               markers: Set.from(_markers),
//               onMapCreated: (GoogleMapController controller) {
//                 mapController = controller;
//               },
//             )
//           : const Center(
//               child: Text('No Map'),
//             ),
//     );
//   }
// }
