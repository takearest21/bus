import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class BusDetailsMapPage extends StatefulWidget {
  @override
  _BusDetailsMapPageState createState() => _BusDetailsMapPageState();
}

class _BusDetailsMapPageState extends State<BusDetailsMapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);
 //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static  LatLng _lastMapPosition = _initialPosition;
  
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    print("333");
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
          actions: [
            Container(
                child: InkWell(
              child: Icon(Icons.extension),
              onTap: () {
                Navigator.pop(context);
              },
            ))
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
