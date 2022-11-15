import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quick_feedback/quick_feedback.dart';

List services = [
  'images/services/foot-treatment.jpg',
  'images/services/hand-treatment.jpg'
];
List sNames = ['Foot Treatment', 'Hand Treatment'];

class NailaholicsPage extends StatelessWidget {
  const NailaholicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(13.939814457587396, 121.14700363759059), zoom: 13.0);

  late GoogleMapController _googleMapController;
  final Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getPolyline();
  }

  void _showFeedback(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return QuickFeedback(
            title: "Leave a feedback", //Title of dialog
            showTextBox: true, //default false
            textBoxHint:
                "Share your feedback", //Feedback text field hind text default: Tell us more
            submitText: "SUBMIT", //submit button text default: SUBMIT
            onSubmitCallback: (feedback) {
              print('$feedback'); //map {ratingL 2, feedbackL: 'some feedback' }
              Navigator.of(context).pop();
            },
            askLaterText: "ASK LATER",
            onAskLaterCallback: () {
              print("Do something on ask later click");
            });
      },
    );
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.blue,
        points: polylineCoordinates,
        width: 2);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyArOgBaK8u4cBFq8VvysLJM2vwhFzMukZM',
      const PointLatLng(13.939814457587396, 121.14700363759059),
      const PointLatLng(13.940908802240456, 121.1241959906525),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 182, 107),
          title: const Text('Nail-a-holics')),
      body: Stack(children: [
        SizedBox(
          height: 300,
          child: GoogleMap(
            polylines: Set<Polyline>.of(polylines.values),
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              Future.delayed(
                const Duration(milliseconds: 200),
              );
            },
            markers: getmarkers(),
          ),
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.46,
            maxChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    color: Colors.white,
                    child: const Text(
                      'Nail-a-Holics - Lipa, Lipa City',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    color: Colors.white,
                    child: const Text(
                      'Opening Hours',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    color: Colors.white,
                    child: const Text(
                      'Monday - Sunday : 10:00 - 21:00',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                    color: Colors.white,
                    child: const Text(
                      'Services Offered',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          controller: scrollController,
                          itemCount: services.length,
                          itemBuilder: (BuildContext context, int index) {
                            final service = services[index];
                            final sName = sNames[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Card(child: Image.asset(service)),
                                Text(sName)
                              ],
                            );
                          })),
                  ElevatedButton(
                    onPressed: () => _showFeedback(context),
                    child: const Text("Feedback"),
                  ),
                ],
              );
            }),
      ]),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    if (mounted) {
      setState(() {
        markers.add(const Marker(
          //add first marker
          markerId: MarkerId('1'),
          position: LatLng(
              13.939814457587396, 121.14700363759059), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: 'You ',
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));

        markers.add(Marker(
          //add second marker
          markerId: const MarkerId('2'),
          position: const LatLng(
              13.940908802240456, 121.1241959906525), //position of marker
          infoWindow: const InfoWindow(
            //popup info
            title: 'Nail-a-holics',
            snippet: 'Nail Salon',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen), //Icon for Marker
        ));
      });
    }
    return markers;
  }
}
