import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mist/Utils/app_common.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/string_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/screens/faq_screen.dart';
import 'package:mist/screens/review_screen.dart';
import 'package:mist/screens/service_detail_screen.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

// import '../Utils/app_colors.dart';
import '../extensions/app_button.dart';
import '../extensions/colors.dart';
import '../extensions/horizontal_list.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_colors.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final List<String> serviceList = [
    "Care Wash",
    "Deep Clean",
    "Shine and Coat",
    "Luxury Car Care",
    "Special Car Care",
    "Bike and Moped"
  ];
  String selectedStatus = "Care Wash";
  final StoryController controller = StoryController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Service',
          color: Colors.white, context: context, showBack: true, center: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: serviceList.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        color: selectedStatus == serviceList[index]
                            ? primaryColor
                            : Colors.white,
                        border: Border.all(
                          width: 0.6,
                          color: selectedStatus == serviceList[index]
                              ? primaryColor
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      serviceList[index].toString().capitalizeFirstLetter(),
                      style: boldTextStyle(
                          size: 13,
                          color: selectedStatus == serviceList[index]
                              ? secondaryColor
                              : Colors.grey),
                    ),
                  ).onTap(() {
                    selectedStatus = serviceList[index];
                    print("Selected Index" + selectedStatus.toString());
                    setState(() {});
                  }).paddingRight(18);
                },
              ),
            ).paddingLeft(16),
            Text(
              "Car Wash",
              style: boldTextStyle(size: 20),
            ).paddingOnly(left: 16, top: 16, bottom: 10),
            Divider(
              thickness: 2,
              height: 0,
              color: Colors.grey.withOpacity(0.4),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(6)),
                color: blueGreyColor,
              ),
              child: Text(
                "Car Wash",
                style: boldTextStyle(
                  size: 14,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Interior + Exterior\nFoam Wash",
                      style: boldTextStyle(size: 18),
                    ),
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 22),
                        6.width,
                        Text(
                          '4.5',
                          style: boldTextStyle(size: 12),
                        ),
                        6.width,
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 6,
                        ),
                        6.width,
                        Text(
                          '596 ratings',
                          style: primaryTextStyle(size: 12, color: grey),
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.black,
                          size: 7,
                        ),
                        6.width,
                        Text(
                          'Foam Wash & Tyre Polish',
                          style: boldTextStyle(size: 13),
                        )
                      ],
                    ),
                    2.height,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 6,
                        ),
                        6.width,
                        Text(
                          'Interior Vacuum',
                          style: primaryTextStyle(size: 13, color: Colors.grey),
                        )
                      ],
                    ),
                    2.height,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey,
                          size: 6,
                        ),
                        6.width,
                        Text(
                          'Exterior High Pressure Wash',
                          style: primaryTextStyle(size: 13, color: Colors.grey),
                        )
                      ],
                    ),
                    10.height,
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: grey.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 14,
                              ),
                              Text("3 more"),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black,
                                size: 18,
                              ),
                            ],
                          ).paddingSymmetric(vertical: 6, horizontal: 10),
                        ),
                        8.width,
                        Text(
                          "View Details",
                          style: primaryTextStyle(color: Colors.blue),
                        ).onTap(() {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (context) {
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom, // Adjust for keyboard
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: context.height() * 0.70,
                                      child: Stack(
                                        children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                14.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 220,
                                                      child: Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                                        style: boldTextStyle(
                                                            size: 16),
                                                      )
                                                          .paddingSymmetric(
                                                              horizontal: 18)
                                                          .expand(),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  blueGreyColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '4.5',
                                                                style:
                                                                    boldTextStyle(
                                                                        size:
                                                                            12),
                                                              ),
                                                              6.width,
                                                              Icon(Icons.star,
                                                                  color: Colors
                                                                      .yellow,
                                                                  size: 15),
                                                            ],
                                                          ).paddingSymmetric(
                                                              horizontal: 8,
                                                              vertical: 6),
                                                        ),
                                                        Text(
                                                          '866 ratings',
                                                          style:
                                                              secondaryTextStyle(
                                                                  size: 10,
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ).paddingSymmetric(
                                                        horizontal: 18),
                                                  ],
                                                ),
                                                40.height,
                                                Row(
                                                  children: [
                                                    Text(
                                                      "₹228",
                                                      style: boldTextStyle(
                                                          size: 20,
                                                          color: Colors.blue),
                                                    ),
                                                    10.width,
                                                    Icon(
                                                      Icons.av_timer_outlined,
                                                      size: 20,
                                                    ),
                                                    4.width,
                                                    Text(
                                                      "1 hr 8 mins",
                                                      style: boldTextStyle(
                                                          size: 13,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ).paddingSymmetric(
                                                    horizontal: 18),
                                                40.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "What is Included in my Service?",
                                                      style: boldTextStyle(
                                                          size: 13,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "See all",
                                                      style: boldTextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Colors.grey,
                                                          size: 11,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ).paddingSymmetric(
                                                    horizontal: 18),
                                                18.height,
                                                HorizontalList(
                                                        padding: EdgeInsets.all(0),
                                                        itemCount: 1,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 74,
                                                                child: Column(
                                                                  children: [
                                                                    cachedImage(
                                                                        '',
                                                                        height:
                                                                            70,
                                                                        width:
                                                                            74),
                                                                    6.height,
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                                                          style: boldTextStyle(
                                                                              size: 11,
                                                                              color: Colors.grey),
                                                                        ).expand(),
                                                                        8.width,
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    4.height,
                                                                  ],
                                                                ),
                                                              ).onTap(() {
                                                                ServiceDetailScreen()
                                                                    .launch(
                                                                        context);
                                                              }).paddingRight(
                                                                  10),
                                                              SizedBox(
                                                                width: 80,
                                                                child: Column(
                                                                  children: [
                                                                    cachedImage(
                                                                        '',
                                                                        height:
                                                                            70,
                                                                        width:
                                                                            75),
                                                                    6.height,
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                                                          style: boldTextStyle(
                                                                              size: 11,
                                                                              color: Colors.grey),
                                                                        ).expand(),
                                                                        8.width,
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    4.height,
                                                                  ],
                                                                ),
                                                              ).paddingRight(
                                                                  10),
                                                              SizedBox(
                                                                width: 80,
                                                                child: Column(
                                                                  children: [
                                                                    cachedImage(
                                                                        '',
                                                                        height:
                                                                            70,
                                                                        width:
                                                                            75),
                                                                    6.height,
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                                                          style: boldTextStyle(
                                                                              size: 11,
                                                                              color: Colors.grey),
                                                                        ).expand(),
                                                                        8.width,
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    4.height,
                                                                  ],
                                                                ),
                                                              ).paddingRight(
                                                                  10),
                                                              SizedBox(
                                                                width: 80,
                                                                child: Column(
                                                                  children: [
                                                                    cachedImage(
                                                                        '',
                                                                        height:
                                                                            70,
                                                                        width:
                                                                            75),
                                                                    6.height,
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              2,
                                                                          "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                                                          style: boldTextStyle(
                                                                              size: 11,
                                                                              color: Colors.grey),
                                                                        ).expand(),
                                                                        8.width,
                                                                        Icon(
                                                                          Icons
                                                                              .arrow_forward_ios_rounded,
                                                                          size:
                                                                              14,
                                                                          color:
                                                                              Colors.grey,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    4.height,
                                                                  ],
                                                                ),
                                                              ).paddingRight(
                                                                  10),
                                                            ],
                                                          );
                                                        })
                                                    .paddingSymmetric(
                                                        horizontal: 18),
                                                30.height,
                                                // DefaultTabController(
                                                //   length: 2, // Two tabs
                                                //   child: Column(
                                                //     // mainAxisSize:
                                                //     //     MainAxisSize.min,
                                                //     children: [
                                                //       // Tab Bar
                                                //       TabBar(
                                                //         labelStyle: boldTextStyle(size: 14),
                                                //         dividerHeight: 0.5,
                                                //         isScrollable: false,indicatorSize: TabBarIndicatorSize.tab,
                                                //         labelColor:
                                                //             Colors.black,
                                                //         unselectedLabelColor:
                                                //             Colors.black,
                                                //         automaticIndicatorColorAdjustment:
                                                //             false,
                                                //         overlayColor:
                                                //             WidgetStateColor
                                                //                 .transparent,
                                                //         dividerColor:
                                                //             Colors.grey,
                                                //
                                                //         // indicatorColor: Colors.transparent,
                                                //         // physics: NeverScrollableScrollPhysics(),
                                                //         indicator:
                                                //             UnderlineTabIndicator(
                                                //           borderSide:
                                                //               BorderSide(
                                                //                   width: 3,
                                                //                   color: Colors
                                                //                       .yellow),
                                                //           insets: EdgeInsets
                                                //               .zero,
                                                //         ),
                                                //         tabs: [
                                                //           Tab(
                                                //               text:
                                                //                   "Service Options",),
                                                //           Tab(
                                                //               text:
                                                //                   "Know More"),
                                                //         ],
                                                //       ),
                                                //       // Tab Content
                                                //       Container(
                                                //         height:
                                                //             100,
                                                //         child: TabBarView(
                                                //           children: [
                                                //             Center(
                                                //                 child: Text(
                                                //                     "Service Options Content")),
                                                //             Center(
                                                //                 child: Text(
                                                //                     "Know More Content")),
                                                //             50.height
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                30.height,
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  "Help & Feedback",
                                                  style:
                                                      boldTextStyle(size: 16),
                                                ).paddingSymmetric(
                                                    horizontal: 18),
                                                20.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'See All Reviews',
                                                      style: boldTextStyle(
                                                          color: Colors.blue,
                                                          size: 14),
                                                    ).onTap(() {
                                                      ReviewScreen()
                                                          .launch(context);
                                                    }).paddingSymmetric(
                                                        horizontal: 18),
                                                  ],
                                                ),
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  "Frequently Asked Questions",
                                                  style:
                                                      boldTextStyle(size: 16),
                                                ).onTap(() {
                                                  FaqScreen().launch(context);
                                                }).paddingSymmetric(
                                                    horizontal: 18),
                                                70.height,
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 16,
                                            left: 16,
                                            right: 16,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "₹228",
                                                      style: boldTextStyle(
                                                          size: 16,
                                                          color: Colors.blue),
                                                    ),
                                                    Text(
                                                      "1 hr 8 mins",
                                                      style: secondaryTextStyle(
                                                          size: 12,
                                                          color: Colors.grey),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height:
                                                      context.height() * 0.055,
                                                  width: context.width() * 0.52,
                                                  decoration: BoxDecoration(
                                                      color: black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Add to Cart',
                                                        style: boldTextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      14.width,
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        color: Colors.white,
                                                        size: 14,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -100,
                                    right: 20,
                                    child: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 6,
                                              spreadRadius: 2,
                                            ),
                                          ],
                                        ),
                                        child: Icon(Icons.close,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        })
                      ],
                    ),
                    16.height,
                    Row(
                      children: [
                        Text(
                          "₹258",
                          style: primaryTextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        8.width,
                        Text(
                          "₹129",
                          style: boldTextStyle(
                            color: Colors.black,
                            size: 19,
                          ),
                        ),
                        8.width,
                        Text(
                          "50% OFF",
                          style: boldTextStyle(
                            color: Colors.green,
                            size: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ).paddingOnly(left: 16, top: 12, bottom: 20),
                Column(
                  children: [
                    cachedImage('', height: 110, width: 110),
                    14.height,
                    Container(
                      decoration: BoxDecoration(
                          color: black, borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'ADD',
                        style: boldTextStyle(color: Colors.white),
                      ).paddingSymmetric(horizontal: 26, vertical: 10),
                    )
                  ],
                ).paddingOnly(right: 12, top: 40),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                60,
                (index) => Container(
                  width: 3, // Dash width
                  height: 0.8, // Dash height
                  color: Colors.grey, // Dash color
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You are saving  ",
                  style: primaryTextStyle(),
                ),
                Text(
                  "₹129",
                  style: boldTextStyle(
                    color: Colors.green,
                    size: 15,
                  ),
                ),
                Text(
                  " with ",
                  style: primaryTextStyle(),
                ),
                Text(
                  "Mist+",
                  style: boldTextStyle(
                    color: Colors.black,
                    size: 15,
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: 10),
            Divider(
              thickness: 2,
              height: 0,
              color: Colors.grey.withOpacity(0.4),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(6)),
                color: Colors.green,
              ),
              child: Text(
                "CUSTOMER'S FAVOURITE",
                style: boldTextStyle(
                  size: 14,
                  color: Colors.white,
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 8),
            ),
            Container(
              height: 200,
              child: StoryView(

                controller: controller,
                storyItems: [

                  StoryItem.inlineImage(
                    url:
                    "https://srv1668-files.hstgr.io/6b84d6b571f2e6f0/files/public_html/Mist/img/ic_bike_delivery_3.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://srv1668-files.hstgr.io/6b84d6b571f2e6f0/files/public_html/Mist/img/ic_car_wash_5.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://srv1668-files.hstgr.io/6b84d6b571f2e6f0/files/public_html/Mist/img/ic_car_wash_2.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://srv1668-files.hstgr.io/6b84d6b571f2e6f0/files/public_html/Mist/img/ic_car_wash_6.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                    "https://srv1668-files.hstgr.io/6b84d6b571f2e6f0/files/public_html/Mist/img/ic_car_wash_3.jpg",
                    controller: controller,
                    caption: Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),

                ],
                onStoryShow: (storyItem, index) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: true,
                inline: true,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
