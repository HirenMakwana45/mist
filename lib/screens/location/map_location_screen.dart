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
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print("⚠️ Location services are disabled.");
        return;
      }

      // Check and request location permission
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
        return;
      }

      // Get last known location first (if available)
      print("📍 Fetching last known location...");
      Position? lastKnownPosition = await Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        _currentPosition =
            LatLng(lastKnownPosition.latitude, lastKnownPosition.longitude);
        print("✅ Using last known location: $_currentPosition");
      } else {
        print("❌ No last known location available.");
      }

      // Manually handle timeout when fetching new location
      print("⏳ Fetching new location...");
      final position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

      print("POSITION IS ==>" + position.toString());

      // Position position = await Future.any([
      //   Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high,
      //   ),
      //   Future.delayed(Duration(seconds: 10), () => throw TimeoutException("GPS Timeout!"))
      // ]);

      // _currentPosition = LatLng(position.latitude, position.longitude);
      // print("✅ New location fetched: $_currentPosition");
      //
      // // Reverse Geocoding
      // List<Placemark> placemarks =
      //     await placemarkFromCoordinates(position.latitude, position.longitude);
      // if (placemarks.isNotEmpty) {
      //   _address = "${placemarks[0].street}, ${placemarks[0].locality}";
      //   print("🏠 Address: $_address");
      // }

      setState(() {
        _isLoading = false;
      });

      // Add marker to the map
      markers.add(
        Marker(
          markerId: MarkerId("currentLocation"),
          position: _currentPosition!,
          infoWindow: InfoWindow(title: "You are here"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        ),
      );

      // Move camera to current location
      _mapController
          ?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 15));
    } catch (error) {
      print("❌ Error fetching location: $error");

      // Retry with low accuracy if timeout occurs
      if (error is TimeoutException) {
        print("⏳ Retrying with lower accuracy...");
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low);
          _currentPosition = LatLng(position.latitude, position.longitude);
          print("✅ Location fetched with low accuracy: $_currentPosition");
        } catch (e) {
          print("❌ Failed again: $e");
        }
      }
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
