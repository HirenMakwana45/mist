import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/screens/location/map_location_screen.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_common.dart';
import '../extensions/app_button.dart';
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/constants.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class AddressSelectionScreen extends StatefulWidget {
  const AddressSelectionScreen({super.key});

  @override
  State<AddressSelectionScreen> createState() => _AddressSelectionScreenState();
}

class _AddressSelectionScreenState extends State<AddressSelectionScreen> {
  TextEditingController mSearch = TextEditingController();
  TextEditingController mNameCont = TextEditingController();
  TextEditingController mCompleteAddressCont = TextEditingController();

  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";
  final bool _showClearButton = false;
  String selectedOption = "Home";
  final List<String> options = ["Home", "Work", "Other"];


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _getClearButton() {
    if (!_showClearButton) {
      return mSuffixTextFieldIconWidget(icSearch);
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
      appBar: appBarWidget('Address Selection', context: context, actions: []),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    controller: mSearch,
                    textFieldType: TextFieldType.oTHER,
                    isValidationRequired: false,
                    autoFocus: false,
                    suffix: _getClearButton(),
                    decoration: defaultInputDecoration(context,
                        isFocusTExtField: true,
                        label: 'Search address or location'),
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
                  40.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(                        size: 18,

                            Icons.my_location,
                            color: Colors.blue,
                          ),
                          10.width,
                          Text(
                            "Use Current Location",
                            style: boldTextStyle(
                              size: 14,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        size: 18,
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.blue,
                      ),
                    ],
                  ).onTap((){
                    MapLocationScreen().launch(context);
                  }).paddingSymmetric(horizontal: 10),
                  26.height,
                  Divider(color: Colors.grey.withValues(red:0.5)),
                  14.height,
                  Text(
                    "Saved Addresses",
                    style: boldTextStyle(size: 14),
                  ),
                  24.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.home,
                            size: 28,
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Home",
                                style: boldTextStyle(size: 14),
                              ),
                              Text(
                                "ABC",
                                style: secondaryTextStyle(
                                    size: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'edit') {
                              showModalBottomSheet(
                                 isScrollControlled: true,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: context.height() * 0.86,
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            30.height,
                                            Text(
                                              "Save Address as",
                                              style: boldTextStyle(size: 18),
                                            ),
                                            16.height,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: options.map((option) {
                                                bool isSelected = selectedOption == option;
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedOption = option;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      color: isSelected ? primaryColor : Colors.grey[300], // Background color
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Text(
                                                      option,
                                                      style: TextStyle(
                                                        color: isSelected ? Colors.white : Colors.black, // Text color
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Name',
                                                    style: secondaryTextStyle(
                                                        color:
                                                            textPrimaryColorGlobal)),
                                              ],
                                            ),
                                            4.height,
                                            AppTextField(
                                              controller: mNameCont,
                                              textFieldType: TextFieldType.nAME,
                                              // isValidationRequired: true,
                                              // focus: mFirstNameFocus,
                                              // nextFocus: mLastNameFocus,
                                              decoration:
                                                  defaultInputDecoration(
                                                      context,
                                                      label: 'Enter name'),
                                            ),
                                            16.height,
                                            Row(
                                              children: [
                                                Text('Complete Address',
                                                    style: secondaryTextStyle(
                                                        color:
                                                            textPrimaryColorGlobal)),
                                              ],
                                            ),
                                            4.height,
                                            AppTextField(
                                              controller: mCompleteAddressCont,
                                              textFieldType: TextFieldType.nAME,
                                              isValidationRequired: true,
                                              // focus: mLastNameFocus,
                                              // nextFocus: mDesignationFocus,
                                              decoration: defaultInputDecoration(
                                                  context,
                                                  label:
                                                      'Enter complete address'),
                                            ),
                                            10.height,
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.green
                                                      .withValues(red:0.1)),
                                              child: Text(
                                                "We need this info to provide the best experience for \n you. We ensure your data stay private.",
                                                style: boldTextStyle(
                                                    color: Colors.green,
                                                    size: 10),
                                              ).paddingAll(8),
                                            ).paddingAll(8)
                                          ],
                                        ).paddingSymmetric(horizontal: 18),
                                        Positioned(
                                          bottom: 16,
                                          left: 16,
                                          right: 16,
                                          child: AppButton(
                                            text: 'SAVE ADDRESS',
                                            padding:
                                                EdgeInsetsDirectional.all(0),
                                            width: context.width() * 0.92,
                                            height: context.height() * 0.066,
                                            color: secondaryColor,
                                            onTap: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );

                            } else if (value == 'delete') {}
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  Icon(Icons.edit, color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text("Edit"),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.red),
                                  SizedBox(width: 10),
                                  Text("Delete"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.height,
                  Divider(color: Colors.grey.withValues(red:0.5)),
                  70.height,
                ],
              ),
            ).paddingAll(16),
            // Loader().visible(appStore.isLoading)
          ],
        );
      }),
    );
  }
}
