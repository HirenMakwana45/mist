import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';

import '../extensions/colors.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';
import 'address_selection_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        titleWidget: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cart Page',
                  style: boldTextStyle(
                      size: 14, color: Colors.blueGrey.withOpacity(0.6)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Service at Home - ',
                      style: boldTextStyle(size: 12),
                    ),
                    8.width,
                    Text(
                      'Guwahati',
                      style: secondaryTextStyle(color: Colors.grey, size: 11),
                    ),
                    6.width,
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                    )
                  ],
                ),
              ],
            ),
          ],
        ).onTap(() {
          AddressSelectionScreen().launch(context);
        }),
        // titleSpacing: 10,
        showBack: true,
        context: context,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ic_a4,
                      height: 60,
                      width: 80,
                    ),
                    Text(
                      "Audi A4",
                      style: boldTextStyle(),
                    )
                  ],
                ).paddingAll(16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
