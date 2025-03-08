import 'package:flutter/material.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';

import '../Utils/app_common.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen({super.key});

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";
  bool _showClearButton = false;
  Widget _getClearButton() {
    if (!_showClearButton) {
      return mSuffixTextFieldIconWidget(ic_search);
    }

    return IconButton(
      onPressed: () {
        mSearch.clear();
        mSearchValue = "";
        hideKeyboard(context);
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Select Vehicle',
          color: Colors.white,
          context: context,
          showBack: true,
          center: false,
          actions: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                child: Text(
                  "Cannot find your Vehilce?",
                  style: boldTextStyle(size: 11,color: Colors.blue),
                ).paddingSymmetric(vertical: 4, horizontal: 8)).paddingRight(8)
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [
          AppTextField(
            controller: mSearch,
            textFieldType: TextFieldType.OTHER,
            isValidationRequired: false,
            autoFocus: false,
            suffix: _getClearButton(),
            decoration: defaultInputDecoration(context,
                isFocusTExtField: true, label: 'Search "Audi A4"'),
            onChanged: (v) {
              mSearchValue = v;
              // appStore.setLoading(true);
              // prescriptionsRowList.clear();
              // searchDataPrescriptionApi();
              setState(() {});
            },
            // onFieldSubmitted: (p0) {
            //   mSearchValue = p0;
            //   appStore.setLoading(true);
            //   searchDataPrescriptionApi();
            //   setState(() {});
            // },
          ).paddingAll(16),
        ],
      )),
    );
  }
}
