import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../../Utils/app_colors.dart';
import '../../extensions/app_button.dart';
import '../../extensions/app_text_field.dart';
import '../../extensions/constants.dart';
import '../../extensions/decorations.dart';
import '../../extensions/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController mNameCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor.withOpacity(0.06),
      appBar: appBarWidget('Profile',
          titleSpacing: 30, showBack: false, context: context, actions: []),
      body: Column(
        children: [
          10.height,
          Container(
            width: double.infinity,
            // height: 450,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      // spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 4)),
                ]),
            child: Column(
              children: [
                10.height,
                Text(
                  "YOUR PROFILE DETAILS",
                  style: boldTextStyle(size: 14),
                ),
                // Divider(color: Colors.grey.withOpacity(0.5),indent: 20,endIndent: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 20,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: boldTextStyle(size: 14),
                            ),
                            Text(
                              "Zen",
                              style: primaryTextStyle(size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ).onTap(() {

                  showModalBottomSheet(
                    // isScrollControlled: true,
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                          ),
                          child: SizedBox(
                          width: double.infinity,
                          height: context.height() * 0.20,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  14.height,
                                  // Text(
                                  //   "Save Address as",
                                  //   style: boldTextStyle(size: 18),
                                  // ),
                                  // 16.height,
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: options.map((option) {
                                  //     bool isSelected = selectedOption == option;
                                  //     return GestureDetector(
                                  //       onTap: () {
                                  //         setState(() {
                                  //           selectedOption = option;
                                  //           print("Selected option is ===>"+selectedOption.toString());
                                  //         });
                                  //       },
                                  //       child: Container(
                                  //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  //         margin: EdgeInsets.symmetric(horizontal: 8),
                                  //         decoration: BoxDecoration(
                                  //           color: isSelected ? primaryColor : Colors.grey[300], // Background color
                                  //           borderRadius: BorderRadius.circular(12),
                                  //         ),
                                  //         child: Text(
                                  //           option,
                                  //           style: TextStyle(
                                  //             color: isSelected ? Colors.white : Colors.black, // Text color
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     );
                                  //   }).toList(),
                                  // ),
                                  // Row(
                                  //   crossAxisAlignment:
                                  //   CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text('Name',
                                  //         style: secondaryTextStyle(
                                  //             color:
                                  //             textPrimaryColorGlobal)),
                                  //   ],
                                  // ),
                                  4.height,
                                  AppTextField(
                                    controller: mNameCont,
                                    textFieldType: TextFieldType.NAME,
                                    // isValidationRequired: true,
                                    // focus: mFirstNameFocus,
                                    // nextFocus: mLastNameFocus,
                                    decoration:
                                    defaultInputDecoration(
                                        context,
                                        label: 'Enter name'),
                                  ),
                                  16.height,

                                  10.height,
                                ],
                              ).paddingSymmetric(horizontal: 18),
                              Positioned(
                                bottom: 16,
                                left: 16,
                                right: 16,
                                child: AppButton(
                                  text: 'Save',
                                  padding:
                                  EdgeInsetsDirectional.all(0),
                                  width: context.width() * 0.92,
                                  height: context.height() * 0.066,
                                  color: secondaryColor,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                                                ),
                        );
                    },
                  );
                }).paddingSymmetric(horizontal: 20, vertical: 14),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_rounded,
                          size: 20,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: boldTextStyle(size: 14),
                            ),
                            Text(
                              "contact@heypion.com",
                              style: primaryTextStyle(size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ).onTap(() {}).paddingSymmetric(horizontal: 20, vertical: 14),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          size: 20,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile",
                              style: boldTextStyle(size: 14),
                            ),
                            Text(
                              "+919638469716",
                              style: primaryTextStyle(size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ).onTap(() {}).paddingSymmetric(horizontal: 20, vertical: 14),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: boldTextStyle(size: 14),
                            ),
                            Text(
                              "Vehicle",
                              style: primaryTextStyle(size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ).onTap(() {}).paddingSymmetric(horizontal: 20, vertical: 14),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car_filled,
                          size: 20,
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Vehicle",
                              style: boldTextStyle(size: 14),
                            ),
                            Text(
                              "Vehicle",
                              style: primaryTextStyle(size: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ).onTap(() {}).paddingSymmetric(horizontal: 20, vertical: 14),
              ],
            ),
          ),
          28.height,
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      // spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 4)),
                ]),
            child: AppButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.red.shade300,
                  ),
                  8.width,
                  Text(
                    "Log out",
                    style: boldTextStyle(color: Colors.red.shade300, size: 14),
                  )
                ],
              ),
              // shapeBorder: Border.all(color: Colors.black,),
              // text: 'Log out',
              // textColor: Colors.red.shade300,
              padding: EdgeInsetsDirectional.all(0),
              width: context.width() * 0.90,
              height: context.height() * 0.060,
              color: Colors.white,
              onTap: () {},
            ),
            width: 120,
          ),
        ],
      ).paddingAll(16),
    );
  }
}
