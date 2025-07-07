import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mist/Utils/app_colors.dart';
import 'package:mist/extensions/extension_util/context_extensions.dart';
import 'package:mist/extensions/extension_util/int_extensions.dart';
import 'package:mist/extensions/extension_util/widget_extensions.dart';
import 'package:mist/screens/dashboard/dashboard_screen.dart';
import 'package:mist/screens/payment/payment_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import '../extensions/colors.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';

class SlotSelectionScreen extends StatefulWidget {
  const SlotSelectionScreen({super.key});

  @override
  State<SlotSelectionScreen> createState() => _SlotSelectionScreenState();
}

class _SlotSelectionScreenState extends State<SlotSelectionScreen> {
  int selectedDateIndex = 0; // Default selected date
  int? selectedTimeIndex;
  bool agreedToTerms = false;

  // Generate next 7 days dynamically
  List<DateTime> upcomingDates = List.generate(
    3,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  List<String> timeSlots = [
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM"
  ];
//Razorpay
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        DashboardScreen().launch(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Select Slot', context: context, actions: []),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select the Date for your Service",
                style: boldTextStyle()),
        
            SizedBox(height: 12),
        
            // Date Selection (Horizontal Scroll)
            // SizedBox(
            //   height: 80,
            //
            //   child:
            //   ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: upcomingDates.length,
            //     itemBuilder: (context, index) {
            //       DateTime date = upcomingDates[index];
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedDateIndex = index;
            //           });
            //         },
            //         child: Container(
            //           margin: EdgeInsets.symmetric(horizontal: 6),
            //           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            //           decoration: BoxDecoration(
            //             color: selectedDateIndex == index
            //                 ? secondaryColor.withOpacity(0.9)
            //                 : Colors.grey[200],
            //             borderRadius: BorderRadius.circular(10),
            //           ),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(DateFormat('MMM').format(date).toUpperCase(),
            //                   style: secondaryTextStyle(
            //                     color: selectedDateIndex == index
            //                         ? Colors.white
            //                         : Colors.grey,
            //                     size: 11,
            //                   )),
            //               Text(DateFormat('dd').format(date),
            //                   style: boldTextStyle(  color: selectedDateIndex == index
            //                       ? Colors.white
            //                       : Colors.black,)),
            //               Text(DateFormat('EEE').format(date).toUpperCase(),
            //                   style: primaryTextStyle(size: 14,  color: selectedDateIndex == index
            //                       ? Colors.white
            //                       : Colors.grey,)),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(Duration(days: 30)),
              focusedDay: upcomingDates[selectedDateIndex],
              selectedDayPredicate: (day) {
                return isSameDay(upcomingDates[selectedDateIndex], day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDateIndex = 0;
                  upcomingDates[0] = selectedDay;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
              ),
            ),
        
            20.height,
        
            Text("Select the start time for your service",
                style: boldTextStyle()),
        

            20.height,
            TimePickerSpinner(
              is24HourMode: false,
              normalTextStyle: primaryTextStyle(color: Colors.grey),
              highlightedTextStyle: boldTextStyle(color: secondaryColor),
              spacing: 30,
              itemHeight: 40,
              isForce2Digits: true,
              time: selectedTimeIndex != null
                  ? DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, int.parse(timeSlots[selectedTimeIndex!].split(':')[0]))
                  : DateTime.now(),
                onTimeChange: (time) {
                  String formatted = DateFormat('h:mm a').format(time);
                  int index = timeSlots.indexWhere((slot) => slot == formatted);
                  if (index != -1) {
                    setState(() {
                      selectedTimeIndex = index;
                    });
                  } else {
                    // Optional: handle custom times not in timeSlots list
                    setState(() {
                      selectedTimeIndex = null;
                    });
                  }
                }
        
            ),
            // GridView.builder(
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 2,
            //   ),
            //   itemCount: timeSlots.length,
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           selectedTimeIndex = index;
            //         });
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: selectedTimeIndex == index
            //               ? secondaryColor.withOpacity(0.9)
            //               : Colors.grey[200],
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         alignment: Alignment.center,
            //         child: Text(
            //           timeSlots[index],
            //           style: primaryTextStyle(
            //             color: selectedTimeIndex == index
            //                 ? Colors.white
            //                 : Colors.black,
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ).expand(),
        
            20.height,
        
            // Terms & Conditions
            Row(
              children: [
                Checkbox(
                  value: agreedToTerms,
                  onChanged: (value) {
                    setState(() {
                      agreedToTerms = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                      "By proceeding further, you agree to our Terms and Conditions."),
                ),
              ],
            ),
        
            SizedBox(height: 20),
        
            // Confirm Button
            // ElevatedButton(
            //   onPressed: agreedToTerms
            //       ? () {
            //           String selectedDate = DateFormat('dd MMM yyyy')
            //               .format(upcomingDates[selectedDateIndex]);
            //           String selectedTime = selectedTimeIndex != null
            //               ? timeSlots[selectedTimeIndex!]
            //               : "Not Selected";
            //           print("Selected Date: $selectedDate");
            //           print("Selected Time: $selectedTime");
            //         }
            //       : null, // Disable button if terms not accepted
            //   child: Text("Confirm Booking"),
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size(double.infinity, 50),
            //   ),
            // ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        "₹228",
                        style: boldTextStyle(
                            size: 16,
                            color: Colors.blue),
                      ),
                      Text(
                        "1 hr 8 mins",
                        style: secondaryTextStyle(
                            size: 12,
                            color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height:
                    context.height() * 0.055,
                    width: context.width() * 0.52,
                    decoration: BoxDecoration(
                        color: black,
                        borderRadius:
                        BorderRadius.circular(
                            8)),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .center,
                      children: [
                        Text(
                          'Checkout',
                          style: boldTextStyle(
                              color:
                              Colors.white),
                        ),
                        14.width,
                        Icon(
                          Icons
                              .arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ).onTap((){
                    Razorpay razorpay = Razorpay();
                    var options = {
                      'key': 'rzp_live_ILgsfZCZoFIKMb',
                      'amount': 34000,
                      'name': 'Booking',
                      'image': 'https://heypion.com/assets/img/img_mist_logo',
                      // 'description': 'Fine T-Shirt',
                      'retry': {'enabled': true, 'max_count': 1},
                      'send_sms_hash': true,
                      // 'prefill': {
                      //   'contact': '+91 9638469716',
                      //   'email': 'cntact@heyepion.com'
                      // },
                      'external': {
                        'wallets': ['paytm'],
                      },
                      'theme': {'color': '#F8E600'}
                    };
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                        handleExternalWalletSelected);
                    razorpay.open(options);
                  })
                ],
              ),
            ),
        
          ],
        ).paddingAll(16),
      ),
    );
  }
}
