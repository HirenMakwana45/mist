import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/utils/app_colors.dart';

import '../Services/auth_service.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../main.dart';
import '../utils/app_common.dart';
import '../utils/app_images.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mMobileCont = TextEditingController();
  String cCode = '+91';
  final String termsUrl = "https://heypion.com.com";
  final String privacyUrl = "https://heypion.com.com";

  GlobalKey<FormState> mFormKey = GlobalKey<FormState>();

  List<Widget> imageItems = [
    Image.asset(ic_car_wash_1, fit: BoxFit.cover),
    Image.asset(ic_car_wash_2, fit: BoxFit.cover),
    Image.asset(ic_car_wash_3, fit: BoxFit.cover),
    Image.asset(ic_car_wash_4, fit: BoxFit.cover),
    Image.asset(ic_car_wash_5, fit: BoxFit.cover),
    Image.asset(ic_car_wash_6, fit: BoxFit.cover),
  ];

  Future<void> sendOTP() async {
    hideKeyboard(context);
    appStore.setLoading(true);

    String number = '$cCode${mMobileCont.text.trim()}';
    if (!number.startsWith('+')) {
      number = '$mMobileCont ${mMobileCont.text.trim()}';
    }

    await loginWithOTP(
      context,
      number,
      mMobileCont.text.trim(),
    ).then((value) {}).catchError((e) {
      toast(e.toString());
      appStore.setLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: mFormKey,
        child: Stack(
          children: [
            Column(
              children: [
                50.height,
                Row(
                  children: [
                    Text(
                      "Top-Quality Car Care \nProduct for a Lasting Shine",
                      style: boldTextStyle(size: 22),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20),
                6.height,
                Row(
                  children: [
                    Text(
                      "15+ Product for Superior cleaning \nand protection",
                      style: primaryTextStyle(size: 16, color: Colors.grey),
                    )
                  ],
                ).paddingSymmetric(horizontal: 20),
                40.height,
                CarouselSlider(
                    items: imageItems,
                    options: CarouselOptions(
                      height: 160,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.4,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 1500),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    )),
                40.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "India's #1 Car Wash\nand Bike Care",
                      style: boldTextStyle(size: 20, color: secondaryColor),
                    )
                  ],
                ),
                8.height,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Log in or Sign up",
                        style: secondaryTextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                16.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile Number',
                        style: secondaryTextStyle(color: textPrimaryColorGlobal)),
                    2.width,
                    Text('*', style: secondaryTextStyle(color: RedColor))
                  ],
                ).paddingSymmetric(horizontal: 26, vertical: 4),
                4.height,
                AppTextField(
                  // focus: _focusNode,

                  controller: mMobileCont,
                  textFieldType: TextFieldType.PHONE,
                  // maxLength: 10,
                  isValidationRequired: true,
                  inputFormatters: [
                    // LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Phone number';
                    } else if (value.length < 10) {
                      return 'Phone number must be 10 digits long';
                    }
                    return null;
                  },
                  decoration: defaultInputDecoration(context,
                      label: 'Enter your mobile number',
                      mPrefix: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CountryCodePicker(
                              enabled: false,
                              initialSelection: cCode,
                              showCountryOnly: false,
                              showFlag: false,
                              boxDecoration: BoxDecoration(
                                  borderRadius: radius(defaultRadius),
                                  color: context.scaffoldBackgroundColor),
                              showFlagDialog: true,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              textStyle: primaryTextStyle(),
                              onInit: (c) {
                                // countryCode = c!.dialCode;
                                // setValue(COUNTRY_CODE, c.code);
                              },
                              onChanged: (c) {
                                cCode = c.dialCode.toString();
                                // countryCode = c.dialCode;
                                // setValue(COUNTRY_CODE, c.code);
                              },
                            ),
                            VerticalDivider(color: Colors.grey.withOpacity(0.5)),
                            16.width,
                          ],
                        ),
                      )),
                ).paddingSymmetric(horizontal: 26, vertical: 4),
                // 20.height,
                10.height,
                AppButton(
                  text: 'Login/Signup',
                  padding: EdgeInsetsDirectional.all(0),
                  width: context.width() * 0.82,
                  height: context.height() * 0.066,
                  color: secondaryColor,
                  onTap: () {
                    OtpScreen(
                      verificationId: 'verificationId',
                      mobileNumber: 'phoneNumber',
                    ).launch(context);
    // if (mFormKey.currentState!.validate()) {
    //   // sendOTP();
    //
    // }
                  },
                ),

                // 16.width,
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: secondaryTextStyle(size: 14, color: Colors.grey),
                  children: [
                    TextSpan(text: "By proceeding you agree to the \n"),
                    TextSpan(
                      text: "Terms & Conditions",
                      style: secondaryTextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrls(termsUrl),
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: secondaryTextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrls(privacyUrl),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
