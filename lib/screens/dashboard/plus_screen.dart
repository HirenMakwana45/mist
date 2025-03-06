import 'package:flutter/material.dart';

import '../../extensions/widgets.dart';

class PlusScreen extends StatefulWidget {
  const PlusScreen({super.key});

  @override
  State<PlusScreen> createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Mist Plus',
          titleSpacing: 30, showBack: false, context: context, actions: []),
    );
  }
}
