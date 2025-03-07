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
      body: Column(
        children: [
          Text(
            "1. Do I need to provide water or power?",
            style: boldTextStyle(),
          ).paddingSymmetric(horizontal: 10),
          8.height,
          Text(
            "Yes, we need access to water and electricity to perform the bike pressure wash",
            style: boldTextStyle(color: blueGreyColor),
          ).paddingSymmetric(horizontal: 10),
          10.height,
          Divider(
            height: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
