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
import '../extensions/app_text_field.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/loader_widget.dart';
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
  String? mSearchValue = "";
  bool _showClearButton = false;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

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
      appBar: appBarWidget('Select your city',
          context: context, showBack: false, center: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                AppTextField(
                  controller: mSearch,
                  textFieldType: TextFieldType.OTHER,
                  isValidationRequired: false,
                  autoFocus: false,
                  suffix: _getClearButton(),
                  decoration: defaultInputDecoration(context,
                      isFocusTExtField: true, label: 'Search for your city'),
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
                ).paddingAll(18),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.my_location,
                          color: Colors.blue,
                        ),
                        10.width,
                        Text(
                          "Use Current Location",
                          style: boldTextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.blue,
                    ),
                  ],
                ).paddingAll(16),
                30.height,
                Divider(color: Colors.grey.withOpacity(0.5)),
                8.height,
                Divider(color: Colors.grey.withOpacity(0.5)),
                // GridView.builder(
                //   shrinkWrap: true,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 3),
                //   itemBuilder: (context, index) {
                //     return Column(
                //       children: [],
                //     );
                //   },
                // ),
                // prescriptionsRowList.isNotEmpty
                //     ? SizedBox(
                //   height: 600,
                //   child: ListView.builder(
                //     // reverse: prescriptionsRowList.length > 1,
                //     physics: AlwaysScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: prescriptionsRowList.length,
                //     itemBuilder: (context, i) {
                //       return Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 prescriptionsRowList[i]
                //                     .patientName
                //                     .toString(),
                //                 style: primaryTextStyle(size: 16),
                //               ),
                //               Container(
                //                 padding: const EdgeInsets.only(
                //                     left: 8,
                //                     right: 8,
                //                     bottom: 5,
                //                     top: 5),
                //                 decoration: BoxDecoration(
                //                     border: Border.all(
                //                         color: prescriptionsRowList[i]
                //                             .status ==
                //                             'open'
                //                             ? BlueColor
                //                             : prescriptionsRowList[i]
                //                             .status ==
                //                             'close'
                //                             ? YellowColor
                //                             : prescriptionsRowList[
                //                         i]
                //                             .status ==
                //                             'delivered'
                //                             ? GreenColor
                //                             : darkRedColor),
                //                     borderRadius:
                //                     BorderRadius.circular(24)),
                //                 child: Text(
                //                   prescriptionsRowList[i]
                //                       .status
                //                       .toString(),
                //                   style: primaryTextStyle(
                //                       size: 12,
                //                       color: prescriptionsRowList[i]
                //                           .status ==
                //                           'open'
                //                           ? BlueColor
                //                           : prescriptionsRowList[i]
                //                           .status ==
                //                           'closed'
                //                           ? YellowColor
                //                           : prescriptionsRowList[i]
                //                           .status ==
                //                           'delivered'
                //                           ? GreenColor
                //                           : darkRedColor),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           4.height,
                //           Row(
                //             mainAxisAlignment:
                //             MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 parseDocumentDate(DateTime.parse(
                //                     prescriptionsRowList[i]
                //                         .createdAt
                //                         .toString())),
                //                 style: secondaryTextStyle(
                //                     size: 12, color: lightColor),
                //               ),
                //               Text(
                //                 prescriptionsRowList[i].prId.toString(),
                //                 style: secondaryTextStyle(
                //                     size: 12, color: lightColor),
                //               ),
                //             ],
                //           ),
                //           10.height,
                //           Container(
                //               width: double.infinity,
                //               height: 1,
                //               color: context.dividerColor),
                //           10.height,
                //         ],
                //       ).onTap(() {
                //         PrescriptionDetailsScreen(
                //           prescriptionId:
                //           prescriptionsRowList[i].prescriptionId!,
                //         ).launch(context);
                //       });
                //     },
                //   ),
                // )
                //     : Stack(
                //   children: [
                //     SizedBox(
                //       height: context.height() * 0.6,
                //       child: NoDataScreen(
                //         mTitle: 'No Data found',
                //       )
                //           .visible(prescriptionsRowList!.isEmpty)
                //           .center()
                //           .visible(!appStore.isLoading),
                //     )
                //   ],
                // ),
                Text('Next').onTap(() {
                  ChooseVehicleScreen().launch(context);
                }),
                70.height,
              ],
            ),
          ),
          // Loader().visible(appStore.isLoading)
        ],
      ),
    );
  }
}
