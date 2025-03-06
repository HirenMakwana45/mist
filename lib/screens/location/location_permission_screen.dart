import 'package:flutter/material.dart';
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
          // Image.asset(ic_location_permission, fit: BoxFit.cover),
          50.height,

          AppButton(
            text: 'Open Location Settings',
            padding: EdgeInsetsDirectional.all(0),
            width: context.width() * 0.92,
            height: context.height() * 0.066,
            color: secondaryColor,
            onTap: () {},
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
