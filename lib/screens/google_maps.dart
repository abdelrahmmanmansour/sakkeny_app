import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sakeny/castom/dragdrop.dart';
import 'package:sakeny/costant.dart';

class MapSample extends StatefulWidget {
  MapSample({Key? key, required this.n1, required this.n2}) : super(key: key);

  final double n1;
  final double n2;

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late CameraPosition _kGooglePlex;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,

    );
    _markers = Set<Marker>.from([
      Marker(
        markerId: MarkerId('location_marker'),
        position: LatLng(widget.n1, widget.n2),
        infoWindow: InfoWindow(
          title: 'Your Location',
          snippet: 'This is where you are.',
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
                markers: _markers
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 10),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Image.asset("assets/images/Arrow - Right Square.png"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.11,
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.10,
            ),
            child: Container(
              width: 317.w,
              height: 53.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: TextField(
                textAlign: TextAlign.right,
                onChanged: (data) {},
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: orange,
                    size: 30,
                  ),
                  hintText: "الموقع",
                  hintStyle: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 16,
                    fontFamily: primFont,
                    fontWeight: FontWeight.w300,
                    height: 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Dragdrop(),
        ],
      ),
    );
  }
}

