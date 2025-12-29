import 'package:flutter/material.dart';
import 'package:mist/extensions/colors.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_common.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Service Details',
          color: Colors.white, context: context, showBack: true, center: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(icCarWash_3,fit: BoxFit.cover, height: 200, width: double.infinity),
          20.height,
          Text(
            "Bike High Pressure Wash",
            style: boldTextStyle(size: 16),
          ).paddingSymmetric(horizontal: 18),
          8.height,
          Text(
            "A high-pressure wash for your bike clears tough dirt and Gunk,leaving It spotless.It's an effective way to clean hard-to-reach areas and maintain your bike's appearance.",
            style: primaryTextStyle(size: 14, color: grey),
          ).paddingSymmetric(horizontal: 18),
          10.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 160,
                decoration: BoxDecoration(
                    color: lightGreenColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Image.asset(
                      icDoorstepService,
                      height: 30,
                      width: 30,
                    ),
                    10.width,
                    Text(
                      'Doorstep Service',
                      style: boldTextStyle(size: 12),
                    )
                  ],
                ).paddingSymmetric(vertical: 8, horizontal: 8),
              ).paddingLeft(10),
              10.width,
              Container(
                width: 160,
                decoration: BoxDecoration(
                    color: lightPinkColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cachedImage(
                      icCarWash,
                      height: 30,
                      width: 30,
                    ),
                    10.width,
                    Text(
                      'Why Professional Car\nWash is Important?',
                      style: boldTextStyle(size: 12),
                    ).expand()
                  ],
                ).paddingSymmetric(vertical: 8, horizontal: 8),
              ).expand(),

            ],
          ).paddingSymmetric(horizontal: 18),
        ],
      ),
    );
  }
}
