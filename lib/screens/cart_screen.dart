import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/main.dart';
import 'package:mist/screens/discount_screen.dart';
import 'package:mist/screens/slot_selection_screen.dart';

import '../Utils/app_colors.dart';
import '../extensions/colors.dart';
import '../extensions/horizontal_list.dart';
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
                      size: 14, color: Colors.blueGrey.withValues(red: 0.6)),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          icA4,
                          height: 60,
                          width: 80,
                        ),
                        Text(
                          "Audi A4",
                          style: boldTextStyle(),
                        )
                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: lRedColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.delete_outline_outlined,
                          color: darkRedColor,
                        ).paddingAll(6))
                  ],
                ).paddingAll(16),
                Text(
                  'Base Package',
                  style: secondaryTextStyle(color: Colors.blue),
                ).paddingSymmetric(horizontal: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interior + Exterior Foam Wash ',
                      style: boldTextStyle(
                          color: appStore.isDarkMode
                              ? Colors.white
                              : secondaryColor),
                    ),
                    Text(
                      '₹ '
                      '129 ',
                      style: boldTextStyle(
                          color: appStore.isDarkMode
                              ? Colors.white
                              : secondaryColor),
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
                28.height,
                Text(
                  'Add Ons',
                  style: boldTextStyle(
                      color:
                          appStore.isDarkMode ? Colors.white : secondaryColor),
                ).paddingSymmetric(horizontal: 16),
                HorizontalList(
                    padding: EdgeInsets.all(0),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            height: 160,
                            width: 140,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(icCarWash_5,
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 140),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        '35 mins',
                                        style: secondaryTextStyle(
                                            size: 12, color: Colors.black),
                                      ).paddingSymmetric(
                                          horizontal: 8, vertical: 2),
                                    ).paddingOnly(left: 8, top: 8),
                                  ],
                                ),
                                8.height,
                                Row(
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      "Bike Pressure  Wash + Hybrid Ceramic Coat",
                                      style: boldTextStyle(
                                          size: 12, color: Colors.white),
                                    ).expand(),
                                    8.width,
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                                8.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ "
                                      "809",
                                      style: boldTextStyle(
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            'Add',
                                            style: boldTextStyle(
                                                size: 12, color: Colors.black),
                                          ).paddingSymmetric(
                                              horizontal: 18, vertical: 2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                              ],
                            ),
                          ).paddingRight(14),
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            height: 160,
                            width: 140,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(icCarWash_6,
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 140),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        '1 mins',
                                        style: secondaryTextStyle(
                                            size: 12, color: Colors.black),
                                      ).paddingSymmetric(
                                          horizontal: 8, vertical: 2),
                                    ).paddingOnly(left: 8, top: 8),
                                  ],
                                ),
                                8.height,
                                Row(
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      "Foam Wash",
                                      style: boldTextStyle(
                                          size: 12, color: Colors.white),
                                    ).expand(),
                                    8.width,
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                                8.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ "
                                      "809",
                                      style: boldTextStyle(
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            'Add',
                                            style: boldTextStyle(
                                                size: 12, color: Colors.black),
                                          ).paddingSymmetric(
                                              horizontal: 18, vertical: 2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                              ],
                            ),
                          ).paddingRight(14),
                          Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            height: 160,
                            width: 140,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(icCarWash_4,
                                        fit: BoxFit.cover,
                                        height: 80,
                                        width: 140),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Text(
                                        '35 mins',
                                        style: secondaryTextStyle(
                                            size: 12, color: Colors.black),
                                      ).paddingSymmetric(
                                          horizontal: 8, vertical: 2),
                                    ).paddingOnly(left: 8, top: 8),
                                  ],
                                ),
                                8.height,
                                Row(
                                  children: [
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      "Bike Pressure Wash Hybrid Ceramic Coat",
                                      style: boldTextStyle(
                                          size: 12, color: Colors.white),
                                    ).expand(),
                                    8.width,
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                                8.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "₹ "
                                          "809",
                                      style: boldTextStyle(
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(
                                            'Add',
                                            style: boldTextStyle(
                                                size: 12, color: Colors.black),
                                          ).paddingSymmetric(
                                              horizontal: 18, vertical: 2),
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingSymmetric(horizontal: 12),
                              ],
                            ),
                          ).paddingRight(14),
                        ],
                      );
                    }).paddingSymmetric(horizontal: 16),
                55.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          icCoupon,
                          height: 25,
                          width: 25,
                        ),
                        6.width,
                        Text(
                          'Apply Coupon',
                          style: boldTextStyle(
                              color: appStore.isDarkMode
                                  ? Colors.white
                                  : secondaryColor),
                        ).onTap(() {
                          DiscountScreen().launch(context);
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '10 Available',
                          style: primaryTextStyle(color: Colors.blue),
                        ),
                        6.width,
                        Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ).onTap(() {
                      DiscountScreen().launch(context);
                    }),
                  ],
                ).paddingSymmetric(horizontal: 16),
                55.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(imgCarShine,
                        fit: BoxFit.cover, height: 55, width: 90),
                    Text(
                      'Add another Car/Bike',
                      style: boldTextStyle(
                          color: appStore.isDarkMode
                              ? Colors.white
                              : secondaryColor,
                          size: 18),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Add',
                        style: boldTextStyle(size: 14, color: Colors.white),
                      ).paddingSymmetric(horizontal: 12, vertical: 8),
                    ).paddingRight(16),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 11,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "₹228",
                      style: boldTextStyle(size: 16, color: Colors.blue),
                    ),
                    Text(
                      "1 hr 8 mins",
                      style: secondaryTextStyle(size: 12, color: Colors.grey),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: context.height() * 0.055,
                  width: context.width() * 0.42,
                  decoration: BoxDecoration(
                      color: black, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Slot',
                        style: boldTextStyle(color: Colors.white),
                      ),
                      14.width,
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 14,
                      ),
                    ],
                  ),
                ).onTap(() {
                  SlotSelectionScreen().launch(context);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
