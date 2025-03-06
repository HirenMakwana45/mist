import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../../extensions/widgets.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Your Bookings',
          titleSpacing: 30, showBack: false, context: context, actions: []),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.s,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You have no bookings!",
            style: boldTextStyle(size: 16),
          )
        ],
      ).center(),
    );
  }
}
