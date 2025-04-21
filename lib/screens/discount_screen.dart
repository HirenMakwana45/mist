import 'package:flutter/material.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../Utils/app_common.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";
  bool _showClearButton = false;
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return mSuffixTextFieldIconWidget(ic_search);
    }

    return IconButton(
      onPressed: () {
        mSearch.clear();
        mSearchValue = "";
        hideKeyboard(context);
      },
      icon: Icon(Icons.clear),
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
            textFieldType: TextFieldType.OTHER,
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
                border: Border.all(color: Colors.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                26.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ic_coupon_fill,
                      height: 28,
                      width: 28,
                    ),
                    12.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "50% OFF up to " + "₹" + "228",
                          style: boldTextStyle(color: secondaryColor),
                        ),
                        Text(
                          "Save " + "₹" + "100 " + "with this code",
                          style: secondaryTextStyle(color: Colors.blue, size: 12),
                        ),
                      ],
                    ),
                    12.width,

                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
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
                  color: Colors.grey.withOpacity(0.4),
                ),
                16.height,
                Text(
                  "APPLY",
                  style: boldTextStyle(color: Colors.blue, size: 18),
                )
              ],
            ).paddingSymmetric(horizontal: 20,vertical: 12),
          ),

        ],
      ).paddingAll(16),
    );
  }
}
