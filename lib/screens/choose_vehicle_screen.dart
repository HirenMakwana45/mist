import 'package:flutter/material.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/dashboard/dashboard_screen.dart';
import 'package:mist/screens/dashboard/home_screen.dart';

import '../utils/app_images.dart';

class ChooseVehicleScreen extends StatefulWidget {
  const ChooseVehicleScreen({super.key});

  @override
  State<ChooseVehicleScreen> createState() => _ChooseVehicleScreenState();
}

class _ChooseVehicleScreenState extends State<ChooseVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          70.height,
          Row(
            children: [
              Text(
                "Choose Your\nVehicle Type",
                style: boldTextStyle(size: 28),
              )
            ],
          ),
          6.height,
          Row(
            children: [
              Text(
                "You can add more vehicles from\nthe home screen",
                style: boldTextStyle(size: 14, color: Colors.grey),
              )
            ],
          ),
          30.height,
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "i have a",
                      style: boldTextStyle(size: 16, color: primaryColor),
                    ),
                    Text(
                      "4 WHEELER",
                      style: boldTextStyle(size: 18, color: secondaryColor),
                    ),
                  ],
                ),
                // 10.width,
                Image.asset(ic_choose_car,
                    height: 80, width: 181, fit: BoxFit.cover),
              ],
            ).paddingOnly(left: 20, top: 20),
          ).onTap((){

            DashboardScreen().launch(context);
          }),
          16.height,
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "OR",
                  style: secondaryTextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
          16.height,
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "i have a",
                      style: boldTextStyle(size: 16, color: primaryColor),
                    ),
                    Text(
                      "2 WHEELER / BIKE",
                      style: boldTextStyle(size: 18, color: secondaryColor),
                    ),
                  ],
                ),
                Image.asset(ic_choose_bike, height: 80, fit: BoxFit.fill),
              ],
            ).paddingOnly(left: 20, top: 20),
          ).onTap((){

          }),
        ],
      ).paddingAll(16),
    );
  }
}
