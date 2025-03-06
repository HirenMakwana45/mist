import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/screens/dashboard/home_screen.dart';
import 'package:mist/screens/dashboard/my_order_screen.dart';
import 'package:mist/screens/dashboard/plus_screen.dart';
import 'package:mist/screens/dashboard/profile_screen.dart';

import '../../Utils/app_colors.dart';
import '../../components/double_back_to_close_app.dart';
import '../../extensions/colors.dart';
import '../../extensions/text_styles.dart';
import '../../main.dart';
import '../../utils/app_images.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int mCurrentIndex = 0;
  final List<Widget> tab = [
    HomeScreen(),
    MyOrderScreen(),
    PlusScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          elevation: 4,
          backgroundColor: appStore.isDarkMode ? cardDarkColor : secondaryColor,
          content: Text('Tap back again to leave', style: primaryTextStyle(color: Colors.white)),
        ),
        child: AnimatedContainer(
          color: context.cardColor,
          duration: const Duration(seconds: 1),
          child: IndexedStack(index: mCurrentIndex, children: tab),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        currentIndex: mCurrentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.cardColor,
        selectedItemColor: secondaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            mCurrentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(ic_home_outline, height: 22, color: mCurrentIndex == 0 ? secondaryColor : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ic_my_orders, height: 22, color: mCurrentIndex == 1 ? secondaryColor : Colors.grey),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ic_plus, height: 22, color: mCurrentIndex == 2 ? secondaryColor : Colors.grey),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ic_profile, height: 22, color: mCurrentIndex == 3 ? secondaryColor : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
