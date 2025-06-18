import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/extensions/widgets.dart';
import 'package:mist/screens/choose_vehicle_screen.dart';

import '../Utils/app_common.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/loader_widget.dart';
import '../extensions/no_data_widget.dart';
import '../main.dart';
import '../utils/app_images.dart';
import 'no_data_screen.dart';



class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({super.key});

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String mSearchValue = "";
  bool _showClearButton = false;
  String? selectedCity;

  List<String> cityList = ['Rajkot', 'Ahmedabad', 'Surat'];

  @override
  void initState() {
    super.initState();
    mSearch.addListener(() {
      setState(() {
        _showClearButton = mSearch.text.isNotEmpty;
      });
    });
  }

  Widget _getClearButton() {
    if (!_showClearButton) return mSuffixTextFieldIconWidget(ic_search);
    return IconButton(
      onPressed: () {
        mSearch.clear();
        mSearchValue = "";
        hideKeyboard(context);
        setState(() {});
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredCities = cityList
        .where((city) => city.toLowerCase().contains(mSearch.text.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: appBarWidget('Select your city', context: context, showBack: false, center: true),
      body: Column(
        children: [
          AppTextField(
            controller: mSearch,
            textFieldType: TextFieldType.OTHER,
            isValidationRequired: false,
            autoFocus: false,
            suffix: _getClearButton(),
            decoration: defaultInputDecoration(context, isFocusTExtField: true, label: 'Search for your city'),
            onChanged: (v) {
              setState(() {
                mSearchValue = v;
              });
            },
          ).paddingAll(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.my_location, color: Colors.blue),
                  10.width,
                  Text("Use Current Location", style: boldTextStyle(color: Colors.blue)),
                ],
              ),
              Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue).onTap((){
                ChooseVehicleScreen().launch(context);

              }),
            ],
          ).paddingAll(16),
          Divider(color: Colors.grey.withOpacity(0.5)),
          8.height,
          Expanded(
            child: filteredCities.isEmpty
                ? NoDataWidget(title: "City not found")
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemCount: filteredCities.length,
              itemBuilder: (_, index) {
                String city = filteredCities[index];
                bool isSelected = selectedCity == city;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCity = city;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? primaryColor.withOpacity(0.7) : Colors.grey.shade200,
                      border: isSelected ? Border.all(color:secondaryColor, width: 2) : null,
                    ),
                    child: Text(city, style: primaryTextStyle()),
                  ),
                );
              },
            ),
          ),
          if (selectedCity != null)
            AppButton(
              color: secondaryColor,
              text: 'Next',
              onTap: () {
                ChooseVehicleScreen().launch(context);
              },
            ).paddingAll(16),
        ],
      ),
    );
  }
}
