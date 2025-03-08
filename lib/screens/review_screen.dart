import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/utils/app_colors.dart';

import '../extensions/colors.dart';
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
      appBar: appBarWidget(
        'Customer Reviews',
        context: context,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Reviews',
            style: boldTextStyle(),
          ),
          30.height,
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 22),
              4.width,
              Text(
                '4.5',
                style: boldTextStyle(size: 15),
              ),
              6.width,
              Text(
                '73',
                style: primaryTextStyle(size: 12, color: grey),
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              Icon(Icons.star, color: secondaryColor, size: 14),
              4.width,
              Text(
                '5',
                style: boldTextStyle(size: 12),
              ),
              6.width,
              LinearProgressBar(
                minHeight: 6,
                maxSteps: 10,
                progressType: LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 1,
                progressColor: secondaryColor,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ).expand(),
              6.width,
              Text(
                '5',
                style: boldTextStyle(size: 12,color: Colors.grey),
              ),
            ],
          ),
          6.height,
          Row(
            children: [
              Icon(Icons.star, color: secondaryColor, size: 14),
              4.width,
              Text(
                '4',
                style: boldTextStyle(size: 12),
              ),
              6.width,
              LinearProgressBar(
                minHeight: 6,
                maxSteps: 10,
                progressType: LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 6,
                progressColor: secondaryColor,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ).expand(),
              6.width,
              Text(
                '5',
                style: boldTextStyle(size: 12,color: Colors.grey),
              ),
            ],
          ),
6.height,
          Row(
            children: [
              Icon(Icons.star, color: secondaryColor, size: 14),
              4.width,
              Text(
                '3',
                style: boldTextStyle(size: 12),
              ),
              6.width,
              LinearProgressBar(
                minHeight: 6,
                maxSteps: 10,
                progressType: LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 3,
                progressColor: secondaryColor,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ).expand(),
              6.width,
              Text(
                '5',
                style: boldTextStyle(size: 12,color: Colors.grey),
              ),
            ],
          ),
6.height,
          Row(
            children: [
              Icon(Icons.star, color: secondaryColor, size: 14),
              4.width,
              Text(
                '2',
                style: boldTextStyle(size: 12),
              ),
              6.width,
              LinearProgressBar(
                minHeight: 6,
                maxSteps: 10,
                progressType: LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 1,
                progressColor: secondaryColor,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ).expand(),
              6.width,
              Text(
                '5',
                style: boldTextStyle(size: 12,color: Colors.grey),
              ),
            ],
          ),
          6.height,
          Row(
            children: [
              Icon(Icons.star, color: secondaryColor, size: 14),
              4.width,
              Text(
                '1',
                style: boldTextStyle(size: 12),
              ),
              6.width,
              LinearProgressBar(
                minHeight: 6,
                maxSteps: 10,
                progressType: LinearProgressBar.progressTypeLinear, // Use Dots progress
                currentStep: 5,
                progressColor: secondaryColor,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ).expand(),
              6.width,
              Text(
                '5',
                style: boldTextStyle(size: 12,color: Colors.grey),
              ),
            ],
          ),


          40.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anil Kapoor',
                    style: boldTextStyle(),
                  ),
                  6.height,
                  Text(
                    '04 08 2025',
                    style: primaryTextStyle(color: Colors.grey.withOpacity(0.7),size: 14),
                  ),
                ],
              ),


              Row(
                children: [
                  Text(
                    '5',
                    style: boldTextStyle(size: 13, color: yellow),
                  ),
                  4.width,
                  Icon(Icons.star, color: Colors.yellow, size: 22),
                ],
              ),

            ],
          ),
          6.height,
          Text(
            'The bike pressure wash from Mist is incredible. The technician was professional, and the results were beyond my expectations .My bike looks spotless, and the convenience is a huge plus.',
            style: primaryTextStyle(color: Colors.grey,size: 14),
          ),
          22.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anil Kapoor',
                    style: boldTextStyle(),
                  ),
                  6.height,
                  Text(
                    '04 08 2025',
                    style: primaryTextStyle(color: Colors.grey.withOpacity(0.7),size: 14),
                  ),
                ],
              ),


              Row(
                children: [
                  Text(
                    '5',
                    style: boldTextStyle(size: 13, color: yellow),
                  ),
                  4.width,
                  Icon(Icons.star, color: Colors.yellow, size: 22),
                ],
              ),

            ],
          ),
          6.height,
          Text(
            'The bike pressure wash from Mist is incredible. The technician was professional, and the results were beyond my expectations .My bike looks spotless, and the convenience is a huge plus.',
            style: primaryTextStyle(color: Colors.grey,size: 14),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
