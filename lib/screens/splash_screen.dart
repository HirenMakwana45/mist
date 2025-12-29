import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mist/extensions/extension_util/duration_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';

import '../../../main.dart';
import '../utils/app_images.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;
    if (!mounted) return;
    // LocationPermissionScreen().launch(context);
    // MapLocationScreen().launch(context);
    LoginScreen().launch(context);
    // if (!getBoolAsync(IS_FIRST_TIME)) {
    //   WalkThroughScreen().launch(context, isNewTask: true);
    // } else {
    //   if (userStore.isLoggedIn) {
    //    const DashboardScreen().launch(context, isNewTask: true);
    //   } else {
    //      SignInScreen().launch(context, isNewTask: true);
    //   }
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            appStore.isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness:
            appStore.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(icLogo,
                width: 100, fit: BoxFit.cover),
            // Text(APP_NAME,style: boldTextStyle(color: primaryColor,size: 28),)
          ],
        ).center(),
      ),
    );
  }
}
