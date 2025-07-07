import 'package:flutter/material.dart';
import 'package:mist/extensions/colors.dart';
import 'package:mist/extensions/common.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/choose_vehicle_screen.dart';
import 'package:mist/screens/login_screen.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../Utils/app_colors.dart';
import '../../components/darkmode_support.dart';
import '../../extensions/app_button.dart';
import '../../extensions/app_text_field.dart';
import '../../extensions/constants.dart';
import '../../extensions/decorations.dart';
import '../../extensions/widgets.dart';
import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController mNameCont = TextEditingController();
  TextEditingController mEmailCont = TextEditingController();
  TextEditingController mMobileCont = TextEditingController();
  TextEditingController mAddressCont = TextEditingController();
  TextEditingController mVehicleCont = TextEditingController();

  String _version = '';
  String _buildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _version = info.version;
      _buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor.withOpacity(0.06),
      appBar: appBarWidget('Profile',
          titleSpacing: 30, showBack: false, context: context, actions: []),
      body:SizedBox(
          height: MediaQuery.of(context).size.height,

          child: Stack(children: [
            Column(
              children: [
                10.height,
                Container(
                  width: double.infinity,
                  // height: 450,
                  decoration: BoxDecoration(
                      color:  appStore.isDarkMode ? Colors.black87 :Colors.white,
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
                                          onTap: () {
                                            pop();
                                          },
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

                                          4.height,
                                          AppTextField(
                                            controller: mEmailCont,
                                            textFieldType: TextFieldType.NAME,
                                            // isValidationRequired: true,
                                            // focus: mFirstNameFocus,
                                            // nextFocus: mLastNameFocus,
                                            decoration:
                                            defaultInputDecoration(
                                                context,
                                                label: 'Enter Email'),
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
                                          onTap: () {
                                            pop();
                                          },
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

                                          4.height,
                                          AppTextField(
                                            controller: mMobileCont,
                                            textFieldType: TextFieldType.NAME,
                                            // isValidationRequired: true,
                                            // focus: mFirstNameFocus,
                                            // nextFocus: mLastNameFocus,
                                            decoration:
                                            defaultInputDecoration(
                                                context,
                                                label: 'Enter Mobile'),
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
                                          onTap: () {
                                            pop();
                                          },
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
                                    "134-A,Abc Street",
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

                                          4.height,
                                          AppTextField(
                                            controller: mAddressCont,
                                            textFieldType: TextFieldType.NAME,
                                            // isValidationRequired: true,
                                            // focus: mFirstNameFocus,
                                            // nextFocus: mLastNameFocus,
                                            decoration:
                                            defaultInputDecoration(
                                                context,
                                                label: 'Enter Address'),
                                          ),
                                          26.height,

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
                                          onTap: () {
                                            pop();
                                          },
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
                                    "Bike",
                                    style: primaryTextStyle(size: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ).onTap(() {
                        ChooseVehicleScreen().launch(context);

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
                                appStore.isDarkMode
                                    ? Icons.nightlight_round
                                    : Icons.wb_sunny,
                                // color: Colors.grey,
                                size: 20,
                              ),
                              16.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Appearance",
                                    style: boldTextStyle(size: 14),
                                  ),
                                  Text(
                                    appStore.isDarkMode ? "Dark" : "Light",
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
                          context: context,
                          backgroundColor: context.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (_) => ThemeModeSelectorBottomSheet(),
                        );

                      }).paddingSymmetric(horizontal: 20, vertical: 14),

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
                    onTap: () {
                      LoginScreen().launch(context);

                    },
                  ),
                  width: 120,
                ),


              ],
            ).paddingAll(16),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image.asset(
                  //   img_logo_transparent,
                  //   color: Colors.grey.withOpacity(0.6),
                  //   height: 80,
                  // ),
                  // 8.height,
                  Text(
                    'Version: $_version+$_buildNumber',
                    style: secondaryTextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ).copyWith(height: 1.3),
                  ),
                ],
              ),
            ),
          ],)),

       );
  }
}
