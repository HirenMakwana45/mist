import 'package:flutter/material.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/slot_selection_screen.dart';

import '../extensions/app_text_field.dart';
import '../extensions/decorations.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';
import 'package:lottie/lottie.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";
  // final bool _showClearButton = false;
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  // Widget _getClearButton() {
  //   if (!_showClearButton) {
  //     return mSuffixTextFieldIconWidget(icSearch);
  //   }
  //
  //   return IconButton(
  //     onPressed: () {
  //       mSearch.clear();
  //       mSearchValue = "";
  //       hideKeyboard(context);
  //     },
  //     icon: Icon(Icons.clear),
  //   );
  // }

  void showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/lottiefile/success.json',
                  height: 80, width: 80),
              10.height,
              Text('Get50! applied', style: boldTextStyle(size: 14)),
              10.height,
              Text(
                  'You saved '
                  "₹"
                  '100',
                  style: boldTextStyle(size: 22)),
              10.height,
              Text('with this coupon code',
                  style: secondaryTextStyle(size: 12)),
              40.height,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Let's GO!",
                  style: boldTextStyle(color: Colors.blue),
                ).paddingSymmetric(horizontal: 42, vertical: 6),
              ).onTap(() {
                SlotSelectionScreen().launch(context);
              })
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Coupons & Discounts',
          color: Colors.white, context: context, showBack: true, center: false),
      body: Column(
        children: [
          Text(
            "BEST OFFERS FOR YOU",
            style: primaryTextStyle(),
          ),
          AppTextField(
            controller: mSearch,
            textFieldType: TextFieldType.oTHER,
            isValidationRequired: false,
            autoFocus: false,
            // suffix: Text("Apply"),
            decoration: defaultInputDecoration(context,
                isFocusTExtField: true, label: 'Enter Coupon Code'),
            onChanged: (v) {
              mSearchValue = v;
              // appStore.setLoading(true);
              // prescriptionsRowList.clear();
              // searchDataPrescriptionApi();
              setState(() {});
            },
            // onFieldSubmitted: (p0) {
            //   mSearchValue = p0;
            //   appStore.setLoading(true);
            //   searchDataPrescriptionApi();
            //   setState(() {});
            // },
          ).paddingAll(18),
          20.height,
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withValues(red: 0.4)),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                26.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      icCouponFill,
                      height: 28,
                      width: 28,
                    ),
                    12.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "50% OFF up to "
                          "₹ "
                          "228",
                          style: boldTextStyle(color: secondaryColor),
                        ),
                        Text(
                          "Save "
                          "₹ "
                          "100 "
                          "with this code",
                          style:
                              secondaryTextStyle(color: Colors.blue, size: 12),
                        ),
                      ],
                    ),
                    12.width,
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.withValues(red: 0.5)),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "GET50!",
                        style: primaryTextStyle(color: secondaryColor),
                      ).paddingAll(4),
                    ),
                  ],
                ),
                16.height,
                Divider(
                  endIndent: 12,
                  indent: 12,
                  height: 0,
                  color: Colors.grey.withValues(red: 0.4),
                ),
                16.height,
                Text(
                  "APPLY",
                  style: boldTextStyle(color: Colors.blue, size: 18),
                ).onTap(() {
                  showPopupDialog(context);
                })
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 12),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
