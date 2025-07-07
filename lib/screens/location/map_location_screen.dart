import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mist/extensions/text_styles.dart';
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
  Future<void> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _address = "${place.name}, ${place.locality}, ${place.administrativeArea}";
        });
      }
    } catch (e) {
      print("❌ Error fetching address: $e");
      setState(() {
        _address = "Address not available";
      });
    }
  }


  Future<void> _getCurrentLocation() async {
    print("📍 Inside Get Current Location Function");
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        return;
      }

      Position position;
      try {
        position = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            distanceFilter: 10,
            timeLimit: Duration(seconds: 10),
            accuracy: LocationAccuracy.high,
          ),
        );
      } on TimeoutException {
        print("⏱️ Timeout: using last known position...");
        Position? lastKnown = await Geolocator.getLastKnownPosition();
        if (lastKnown != null) {
          position = lastKnown;
        } else {
          print("❌ No location available.");
          return;
        }
      }

      _currentPosition = LatLng(position.latitude, position.longitude);
      await _getAddressFromLatLng(_currentPosition!);

      setState(() {
        markers.clear();
        markers.add(
          Marker(
            markerId: MarkerId("currentLocation"),
            position: _currentPosition!,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            infoWindow: InfoWindow(title: "You are here"),
          ),
        );
        _isLoading = false;
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition!, 15),
      );
    } catch (e) {
      print("❌ Error getting location: $e");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Selection")),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _currentPosition ?? LatLng(20.5937, 78.9629),
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: {
              if (_currentPosition != null)
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: _currentPosition!,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  infoWindow: InfoWindow(title: "Your Location"),
                ),
            },
            onCameraMove: (position) {
              _currentPosition = position.target;
            },
            onCameraIdle: () async {
              if (_currentPosition != null) {
                await _getAddressFromLatLng(_currentPosition!);
                setState(() {
                  markers = {
                    Marker(
                      markerId: MarkerId("movedLocation"),
                      position: _currentPosition!,
                      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      infoWindow: InfoWindow(title: "Selected Location"),
                    ),
                  };
                });
              }
            },
          ),
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  _isLoading ? "Fetching Current Location..." : _address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(

              onPressed: _isLoading
                  ? null
                  : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Location Confirmed: $_address")),
                );
              },
              child: Text("Confirm Location",style: boldTextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}
