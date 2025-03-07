import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../extensions/widgets.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Customer Reviews',
         context: context, ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Customer Reviews',style: boldTextStyle(),)

        ],
      ).paddingAll(16),
    );
  }
}
