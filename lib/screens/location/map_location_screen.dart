import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../extensions/widgets.dart';

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  String _address = "Fetching Current Location...";
  bool _isLoading = true;
  Set<Marker> markers = {};
  // final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    print("📍 Inside Get Current Location Function");

    try {
      // Step 1: Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      print("===============>" + serviceEnabled.toString());
      if (!serviceEnabled) {
        print("⚠️ Location services are disabled.");
        await Geolocator
            .openLocationSettings(); // Open device location settings
        return;
      }

      // Step 2: Check and request permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("⚠️ Location permission denied.");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print("❌ Location permission permanently denied.");
        await Geolocator.openLocationSettings();
        await Geolocator.openAppSettings();
// Open app settings
        return;
      }
      print("✅ Current Location Start");

      try {
        print("📍 Trying to get current position...");
        Position position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            distanceFilter: 10,
            timeLimit: Duration(seconds: 10),
            accuracy: LocationAccuracy.high,
          ),
        );
        Position pos = await Geolocator.getCurrentPosition();
        print("Latitude: ${pos.latitude}, Longitude: ${pos.longitude}");


        // This will only run if location fetch was successful
        _currentPosition = LatLng(position.latitude, position.longitude);
        print("✅ Fetched location: $_currentPosition");

        setState(() {
          markers.add(
            Marker(
              markerId: MarkerId("currentLocation"),
              position: _currentPosition!,
              infoWindow: InfoWindow(title: "You are here"),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            ),
          );
        });

        _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 15));

      } on TimeoutException {
        print("⏱️ Location fetch timed out. Try moving outside or check GPS.");

        // Optional: Show dialog or fallback logic here
      } catch (e) {
        print("❌ Error getting location: $e");

        // Optional: Avoid using `_currentPosition!` when it's null
      }


      setState(() {
        _isLoading = false;
      });

      // Step 4: Add marker
      markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentPosition!,
          infoWindow: InfoWindow(title: "You are here"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );

      // Step 5: Move camera
      _mapController
          ?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 15));
    } catch (e) {
      print("❌ Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Selection")),
      body: Stack(
        children: [
          GoogleMap(
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              // mapToolbarEnabled: true,
              //   myLocationEnabled: true,
              // myLocationButtonEnabled: true,
              // compassEnabled: true,
              // liteModeEnabled: true,

              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(20.5937, 78.9629),
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true

              // markers: _currentPosition != null
              //     ? {
              //   Marker(
              //     markerId: MarkerId("currentLocation"),
              //     position: _currentPosition!,
              //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              //     infoWindow: InfoWindow(title: "Your Location"),
              //   ),
              // }
              //     : {},
              ),

          // Positioned(
          //   top: 20,
          //   left: 20,
          //   right: 20,
          //   child: Card(
          //     elevation: 5,
          //     child: Padding(
          //       padding: EdgeInsets.all(12),
          //       child: Text(
          //         _isLoading ? "Fetching Current Location..." : _address,
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: 50,
          //   left: 20,
          //   right: 20,
          //   child: ElevatedButton(
          //     onPressed: _isLoading ? null : () {
          //       // Confirm Location Action
          //       ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("Location Confirmed: $_address")));
          //     },
          //     child: Text("Confirm Location"),
          //   ),
          // ),.
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getCurrentLocation,
      //   child: Icon(Icons.my_location),
      // ),
    );
  }
}
