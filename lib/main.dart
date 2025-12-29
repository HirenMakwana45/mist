import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mist/screens/no_internet_screen.dart';
import 'package:mist/screens/splash_screen.dart';
import 'package:mist/store/UserStore/user_Store.dart';
import 'package:mist/store/app_store.dart';
import 'package:mist/utils/app_common.dart';
import 'package:mist/utils/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'Utils/app_config.dart';
import 'app_theme.dart';
import 'extensions/common.dart';
import 'extensions/constants.dart';
import 'extensions/decorations.dart';
import 'extensions/system_utils.dart';


AppStore appStore = AppStore();
UserStore userStore = UserStore();

late SharedPreferences sharedPreferences;
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: fIREBASEANDROIDAPIKEY,
          appId: fIREBASEANDROIDAPPID,
          messagingSenderId: fIREBASEANDROIDMESSAGINGSENDERID,
          projectId: fIREBASEANDROIDPROJECTID)
  )
      .then((value) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  });
  sharedPreferences = await SharedPreferences.getInstance();


  // setLogInValue();
  defaultAppButtonShapeBorder = RoundedRectangleBorder(borderRadius: radius(defaultAppButtonRadius));
  // oneSignalData();
  // await AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'basic_channel',
  //       channelName: 'Basic Notifications',
  //       channelDescription: 'Basic Notification Channel',
  //       defaultColor: primaryColor,
  //       playSound: true,
  //       importance: NotificationImportance.High,
  //       locked: true,
  //       enableVibration: true,
  //     ),
  //     NotificationChannel(
  //       channelKey: 'scheduled_channel',
  //       channelName: 'Scheduled Notifications',
  //       channelDescription: 'Scheduled Notification Channel',
  //       defaultColor: primaryColor,
  //       locked: true,
  //       importance: NotificationImportance.High,
  //       playSound: true,
  //       enableVibration: true,
  //     ),
  //   ],
  // );
  // setTheme();
  // if (!getStringAsync(PROGRESS_SETTINGS_DETAIL).isEmptyOrNull) {
  //   userStore.addAllProgressSettingsListItem(jsonDecode(getStringAsync(PROGRESS_SETTINGS_DETAIL)).map<ProgressSettingModel>((e) => ProgressSettingModel.fromJson(e)).toList());
  // } else {
  //   userStore.addAllProgressSettingsListItem(progressSettingList());
  // }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}


class MyApp extends StatefulWidget {
  static String tag = '/MyApp';

  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  bool isCurrentlyOnNoInternet = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((e) {
      if (e.contains(ConnectivityResult.none)) {
        log('not connected');
        isCurrentlyOnNoInternet = true;
        push(NoInternetScreen());
      } else {
        if (isCurrentlyOnNoInternet) {
          pop();
          isCurrentlyOnNoInternet = false;
          showToast(
            'Internet is connected',
            type: ToastificationType.error,
            progressColor: Colors.red,
          );
        }
        log('connected');
      }
    });
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp(
        title: appName,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        scrollBehavior: SBehavior(),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        localeResolutionCallback: (locale, supportedLocales) => locale,
        home: SplashScreen(),
      );
    });
  }
}
