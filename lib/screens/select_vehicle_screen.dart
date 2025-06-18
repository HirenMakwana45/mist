import 'package:flutter/material.dart';
import 'package:mist/extensions/animatedList/animated_wrap.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/extensions/text_styles.dart';
import 'package:mist/screens/service_screen.dart';
import 'package:mist/utils/app_colors.dart';

import '../Utils/app_common.dart';
import '../extensions/animatedList/animated_configurations.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
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

  List<String> imageItems = [
    ic_audi_logo,
    ic_bmw_logo,
    ic_chevrolet_logo,
    ic_citroen_logo,
    ic_fiat_logo,
    ic_ford_logo,
    ic_honda_logo,
    ic_hyundai_logo,
    ic_jeep_logo,
    ic_land_over_logo,
    ic_lexus_logo,
    ic_mahindra_logo,
    ic_maruti_suzuki_logo,
    ic_mercedes_benz_logo,
    ic_nissan_logo,
    ic_porsche_logo,
    ic_renault_logo,
    ic_skoda_logo,
    ic_tata_logo,
    ic_toyota_logo,
    ic_volksvegan_logo
  ];

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

  void showCarTypeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select your Car Type?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 12),
              _buildCarTypeButton(
                  Image.asset(
                    ic_car_hatchback,
                    height: 40,
                    width: 40,
                  ),
                  'Hatchback'),
              _buildCarTypeButton(
                  Image.asset(ic_car_sedan, height: 40, width: 40), 'Sedan'),
              _buildCarTypeButton(
                  Image.asset(ic_car_suv, height: 40, width: 40), 'SUV or MUV'),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Please Enter your Vehicle Name',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 6),
              TextField(
                decoration: InputDecoration(
                  hintStyle: primaryTextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.directions_car, color: Colors.grey),
                  hintText: 'Enter Vehicle Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  minimumSize: Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  ServiceScreen().launch(context);
                },
                child: Text('Proceed', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 8),
              // FloatingActionButton(
              //   backgroundColor: Colors.yellow,
              //   child: Icon(Icons.call, color: Colors.black),
              //   onPressed: () {},
              // )
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarTypeButton(Image img, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        20.width,
        img,
        30.width,
        Text(
          text,
          style: boldTextStyle(),
        )
      ],
    ).paddingSymmetric(horizontal: 10, vertical: 4);
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
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      "Cannot find your Vehicle?",
                      style: boldTextStyle(size: 11, color: Colors.blue),
                    ).paddingSymmetric(vertical: 4, horizontal: 8))
                .paddingRight(8)
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            16.height,
            Text(
              "Popular Vehicles",
              style: primaryTextStyle(),
            ),
            10.height,
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 40,
                childAspectRatio: 2,
              ),
              itemCount: imageItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // selectedTimeIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Image.asset(imageItems[index], fit: BoxFit.cover),
                  ).onTap(() {
                    showCarTypeDialog(context);
                  }),
                );
              },
            ),
            16.height,
            // Text(
            //   "All Brands",
            //   style: primaryTextStyle(),
            // ),
            // Text(
            //   "Click to see More",
            //   style: primaryTextStyle(),
            // ).onTap(() {
            //   showCarTypeDialog(context);
            // }),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
