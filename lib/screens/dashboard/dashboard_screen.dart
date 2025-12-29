import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/screens/dashboard/home_screen.dart';
import 'package:mist/screens/dashboard/my_order_screen.dart';
import 'package:mist/screens/dashboard/plus_screen.dart';
import 'package:mist/screens/dashboard/profile_screen.dart';

import '../../Utils/app_colors.dart';
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
      body: AnimatedContainer(
        color: context.cardColor,
        duration: const Duration(seconds: 1),
        child: IndexedStack(index: mCurrentIndex, children: tab),
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
            icon: Image.asset(icHomeOutline, height: 22, color: mCurrentIndex == 0 ? secondaryColor : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(icMyOrders, height: 22, color: mCurrentIndex == 1 ? secondaryColor : Colors.grey),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(icPlus, height: 22, color: mCurrentIndex == 2 ? secondaryColor : Colors.grey),
            label: 'Plus',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(icProfile, height: 22, color: mCurrentIndex == 3 ? secondaryColor : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
