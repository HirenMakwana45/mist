import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/city_selection_screen.dart';

import '../../Utils/app_colors.dart';
import '../../extensions/app_button.dart';
import '../../utils/app_images.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  Set<Marker> markers = {};
  LatLng? _currentPosition;
  GoogleMapController? _mapController;
  bool _isLoading = true;

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
      body: Column(
        children: [
          60.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select your city to get\nProfesstional Auto Care\nat your Door-Step!",
                style: boldTextStyle(size: 18),
              )
            ],
          ),
          50.height,
          Image.asset(img_map_mobile, fit: BoxFit.cover),
          50.height,

          AppButton(
            text: 'Open Location Settings',
            padding: EdgeInsetsDirectional.all(0),
            width: context.width() * 0.92,
            height: context.height() * 0.066,
            color: secondaryColor,
            onTap: () async{
              await Geolocator.openAppSettings();

            },
          ),
          16.height,
          Container(
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(24)),
            child: AppButton(
              // shapeBorder: Border.all(color: Colors.black,),
              text: 'Browse Cities',
              textColor: Colors.black,
              padding: EdgeInsetsDirectional.all(0),
              width: context.width() * 0.90,
              height: context.height() * 0.060,
              color: Colors.white,
              onTap: () {

                CitySelectionScreen().launch(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
