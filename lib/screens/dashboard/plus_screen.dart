import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';

import '../../extensions/widgets.dart';
import '../../utils/app_images.dart';

import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';

import '../../extensions/widgets.dart';
import '../../utils/app_images.dart';

class PlusScreen extends StatefulWidget {
  const PlusScreen({super.key});

  @override
  State<PlusScreen> createState() => _PlusScreenState();
}

class _PlusScreenState extends State<PlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Mist Plus',
        titleSpacing: 30,
        showBack: false,
        context: context,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            20.height,
            Image.asset(
              img_mist_premium,
              fit: BoxFit.cover,
              scale: 2,
            ).center(),
            20.height,
            Text(
              'Unlock Mist Plus',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            10.height,
            Text(
              'Enjoy exclusive features, priority access, and an ad-free experience by upgrading to Mist Plus.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeature(Icons.star, 'Priority support & access'),
                _buildFeature(Icons.lock_open, 'Unlock all premium content'),
                _buildFeature(Icons.remove_circle_outline, 'Ad-free experience'),
                _buildFeature(Icons.update, 'Early access to new features'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
              },
              child: const Text(
                'Upgrade to Mist Plus',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.amber),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
