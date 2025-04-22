import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mist/extensions/colors.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/horizontal_list.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/payment/payment_screen.dart';
import 'package:mist/screens/select_vehicle_screen.dart';
import 'package:mist/utils/app_colors.dart';
import 'package:mist/utils/app_common.dart';

import '../../extensions/animatedList/animated_wrap.dart';
import '../../extensions/app_button.dart';
import '../../extensions/widgets.dart';
// import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../address_selection_screen.dart';
import '../service_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  List<Widget> imageItems = [
    Image.asset(ic_car_wash_1, fit: BoxFit.cover),
    Image.asset(ic_car_wash_2, fit: BoxFit.cover),
    Image.asset(ic_car_wash_3, fit: BoxFit.cover),
    Image.asset(ic_car_wash_4, fit: BoxFit.cover),
  ];
  // List<Widget> autoCareItems = [
  //   Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     // mainAxisSize: MainAxisSize.min,
  //     children: [
  //       SizedBox(
  //           child: cachedImage('', fit: BoxFit.cover, height: 30, width: 30)),
  //       4.height,
  //       Text('Car Wash', style: boldTextStyle(size: 10)),
  //     ],
  //   ).onTap((){}),
  //   Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       cachedImage('', fit: BoxFit.cover, height: 30, width: 30),
  //       4.height,
  //       Text('Deep Clean', style: boldTextStyle(size: 10)),
  //     ],
  //   ),
  //   Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       cachedImage('', fit: BoxFit.cover, height: 30, width: 30),
  //       4.height,
  //       Text('Shine and Coat', style: boldTextStyle(size: 10)),
  //     ],
  //   ),
  //   Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,      mainAxisAlignment: MainAxisAlignment.center,
  //
  //     children: [
  //       cachedImage('', fit: BoxFit.cover, height: 30, width: 30),
  //       4.height,
  //       Text('Luxury Car Care', style: boldTextStyle(size: 10)),
  //     ],
  //   ),
  //   Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,      mainAxisAlignment: MainAxisAlignment.center,
  //
  //     children: [
  //       cachedImage('', fit: BoxFit.cover, height: 30, width: 30),
  //       4.height,
  //       Text('Special Car Care', style: boldTextStyle(size: 10)),
  //     ],
  //   ),
  //   Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,      mainAxisAlignment: MainAxisAlignment.center,
  //
  //     children: [
  //       cachedImage('', fit: BoxFit.cover, height: 30, width: 30),
  //       4.height,
  //       Text('Bike and Moped', style: boldTextStyle(size: 10)),
  //     ],
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('',
          titleWidget: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Address',
                    style: boldTextStyle(size: 14),
                  ),
                  Text(
                    'Guwahati',
                    style: secondaryTextStyle(color: Colors.grey, size: 13),
                  )
                ],
              ),
              6.width,
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
              )
            ],
          ).onTap(() {
            AddressSelectionScreen().launch(context);
          }),
          titleSpacing: 10,
          showBack: false,
          context: context,
          actions: [
            Row(
              children: [
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                ),
                6.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Verna',
                      style: boldTextStyle(size: 14),
                    ),
                    Text(
                      'Hyundai',
                      style: secondaryTextStyle(color: Colors.grey, size: 13),
                    )
                  ],
                ).paddingTop(8),
                8.width,
                cachedImage(
                  ic_car_logo,
                  height: 28,
                  width: 28,
                ),
                8.width,
              ],
            ).onTap(() {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    height: context.height() * 0.60,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select Vehicle",
                                  style: boldTextStyle(size: 18),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 18,
                                      ),
                                      2.width,
                                      Text(
                                        "Add New Vehicle",
                                        style: boldTextStyle(
                                          size: 14,
                                        ),
                                      ),
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 6, vertical: 8),
                                )
                              ],
                            ),
                            16.height,
                            Text(
                              "Saved Vehicles",
                              style:
                                  boldTextStyle(size: 14, color: Colors.grey),
                            ),
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    cachedImage(
                                      ic_bike_logo,
                                      height: 28,
                                      width: 28,
                                    ),
                                    8.width,
                                    Text(
                                      "BIKE, ",
                                      style: boldTextStyle(size: 18),
                                    ),
                                    Text(
                                      "2-Wheeler",
                                      style: primaryTextStyle(
                                          size: 16, color: Colors.grey),
                                    )
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: lRedColor,
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: darkRedColor,
                                    ).paddingAll(6))
                              ],
                            ),
                            6.height,
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            12.height
                          ],
                        ).paddingSymmetric(horizontal: 18),
                      ],
                    ),
                  );
                },
              );
            }),
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: imageItems,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    autoPlayAnimationDuration: Duration(milliseconds: 3000),
                    aspectRatio: 9 / 6,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageItems.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ).paddingBottom(28),
              // 13.height,
            ],
          ),
          Transform.translate(
            offset: Offset(0, -20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Doorstep Autocare Services",
                    style: boldTextStyle(),
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Car Wash', style: boldTextStyle(size: 12)),
                        ],
                      ).onTap(() {
                        ServiceScreen().launch(context);
                      }),
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Deep Clean', style: boldTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Shine and Coat',
                              style: boldTextStyle(size: 12)),
                        ],
                      ),
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Luxury Car \nCare',
                              style: boldTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Special Car \nCare',
                              style: boldTextStyle(size: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          cachedImage('',
                              fit: BoxFit.cover, height: 50, width: 50),
                          4.height,
                          Text('Bike and Moped',
                              style: boldTextStyle(size: 12)),
                        ],
                      ),
                    ],
                  ),
                  30.height,

                  20.height,
                  Text('Select Vehicle').onTap((){
                    SelectVehicleScreen().launch(context);
                  }),
                  20.height,
                  Text(
                    "Benefits of Car Care",
                    style: boldTextStyle(size: 18, weight: FontWeight.w900),
                  ),
                  16.height,
                  HorizontalList(
                    padding: EdgeInsets.all(0),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                color: lightGreenColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                cachedImage(
                                  ic_car_logo,
                                  height: 30,
                                  width: 30,
                                ),
                                10.width,
                                Text(
                                  'Why Car Care is \nImportant?',
                                  style: boldTextStyle(size: 12),
                                )
                              ],
                            ).paddingSymmetric(vertical: 10, horizontal: 10),
                          ),
                          10.width,
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                                color: lightPinkColor,
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                cachedImage(
                                  ic_car_wash,
                                  height: 30,
                                  width: 30,
                                ),
                                10.width,
                                Text(
                                  'Why Professional Car\nWash is Important?',
                                  style: boldTextStyle(size: 12),
                                )
                              ],
                            ).paddingSymmetric(vertical: 10, horizontal: 10),
                          ),
                        ],
                      );
                    },
                  ),
                  10.height,
                  Text(
                    "Popular Services",
                    style: boldTextStyle(),
                  ),
                  10.height,
                  HorizontalList(
                      padding: EdgeInsets.all(0),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  cachedImage('', height: 110, width: 115),
                                  6.height,
                                  Row(
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                        style: boldTextStyle(size: 10),
                                      ).expand(),
                                      8.width,
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  4.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹809",
                                        style: boldTextStyle(
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: boldTextStyle(size: 12),
                                          ),
                                          6.width,
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 15),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingRight(14),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  cachedImage('', height: 110, width: 115),
                                  6.height,
                                  Row(
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                        style: boldTextStyle(size: 10),
                                      ).expand(),
                                      8.width,
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  4.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹809",
                                        style: boldTextStyle(
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: boldTextStyle(size: 12),
                                          ),
                                          6.width,
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 15),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingRight(14),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  cachedImage('', height: 110, width: 115),
                                  6.height,
                                  Row(
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        "Interior + Exterior Foam Wash + Hybrid Ceramic Coat",
                                        style: boldTextStyle(size: 10),
                                      ).expand(),
                                      8.width,
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  4.height,
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "₹809",
                                        style: boldTextStyle(
                                          color: Colors.black,
                                          size: 12,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: boldTextStyle(size: 12),
                                          ),
                                          6.width,
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 15),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingRight(14),
                          ],
                        );
                      })
                ],
              ).paddingAll(16),
            ),
          )
        ]),
      ),
    );
  }
}
