import 'package:flutter/material.dart';

import '../extensions/widgets.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Coupons & Discounts',
          color: Colors.white, context: context, showBack: true, center: false),

    );
  }
}
