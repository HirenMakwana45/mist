import 'package:flutter/material.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../extensions/widgets.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Frequently Asked Questions',
          color: Colors.white, context: context, showBack: true, center: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1. Do I need to provide water or power?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "Yes, we need access to water and electricity to perform the bike pressure wash",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "2. How long does the Bike Pressure Wash take?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "Yes, we need access to water and electricity to perform the bike pressure wash",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "3. What is included in the Bike Pressure Wash?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "The package includes a high-pressure wash that thoroughly cleans you bike, removing dirt,grime and contaminants from all surfaces",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "4. Is the high-pressure wash safe for my bike?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "Yes,our high pressure wash is safe for all types of bikes,We ensure the pressure is carefully controlled to avoid any damage to your bike's paint, components, or electrical systems.",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "5. Will the wash remove all dirt and grime?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "The high pressure wash in highly effective at removing dirt, mud, and road grime from your bike,leaving it clean and refreshed.",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "6. Can service be done at my home or office?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              "Yes, we offer doorstep services, so the Bike Pressure Wash can be done at your home or office.",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            Divider(
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            14.height,
            Text(
              "7. Do i need to prepare my bike before the service?",
              style: boldTextStyle(size: 14),
            ),
            8.height,
            Text(
              ".",
              style: primaryTextStyle(color: Colors.grey, size: 14),
            ),
            10.height,
            // Divider(
            //   height: 0,
            //   color: Colors.grey.withOpacity(0.5),
            // ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
