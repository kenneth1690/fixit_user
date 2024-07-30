import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fixit_user/config.dart';
import 'package:intl/intl.dart';

Color colorCondition(String? text, context) {
  if (text == appFonts.pending) {
    return appColor(context).pending;
  } else if (text == appFonts.accepted || text == appFonts.assigned) {
    return appColor(context).accepted;
  } else if (text == appFonts.onGoing ||
      text == appFonts.onHold ||
      text == appFonts.startAgain) {
    return appColor(context).ongoing;
  } else if (text == appFonts.cancel) {
    return appColor(context).red;
  } else if (text == appFonts.onHold) {
    return appColor(context).red;
  } else {
    return appColor(context).primary;
  }
}

Color colorConditionById(String? text, context) {
  final dash = Provider.of<DashboardProvider>(context, listen: false);
  int index = dash.bookingStatusList
      .indexWhere((element) => element.id.toString() == text);
  if (index > 0) {
    if (dash.bookingStatusList[index].slug == appFonts.pending) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else if (dash.bookingStatusList[index].slug ==
            appFonts.accepted ||
        dash.bookingStatusList[index].slug ==
            appFonts.assigned) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else if (dash.bookingStatusList[index].slug ==
        appFonts.onGoing) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else if (dash.bookingStatusList[index].slug ==
        appFonts.cancel) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else if (dash.bookingStatusList[index].slug ==
        appFonts.assigned) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else if (dash.bookingStatusList[index].slug ==
        appFonts.onHold) {
      return Color(int.parse(
          "0xFF${dash.bookingStatusList[index].hexaCode!.split("#")[1]}"));
    } else {
      return appColor(context).primary;
    }
  } else {
    return appColor(context).pending;
  }
}

String monthCondition(String? text) {
  if (text == '1') {
    return "JAN";
  } else if (text == '2') {
    return "FEB";
  } else if (text == '3') {
    return "MAR";
  } else if (text == '4') {
    return "APR";
  } else if (text == '5') {
    return "MAY";
  } else if (text == '6') {
    return "JUN";
  } else if (text == '7') {
    return "JUL";
  } else if (text == '8') {
    return "AUG";
  } else if (text == '9') {
    return "SEP";
  } else if (text == '10') {
    return "OCT";
  } else if (text == "11") {
    return "NOV";
  } else if (text == '12') {
    return "DEC";
  } else {
    return "JAN";
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Future<bool> isNetworkConnection() async {
  var connectivityResult = await Connectivity()
      .checkConnectivity(); //Check For Wifi or Mobile data is ON/OFF
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    final result = await InternetAddress.lookup(
        'google.com'); //Check For Internet Connection
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

String? getDistance(context, lat1, long1) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((double.parse(lat1) - position!.latitude) * p) / 2 +
      c(double.parse(lat1) * p) *
          c(double.parse(long1) * p) *
          (1 - c((double.parse(long1) - position!.longitude) * p)) /
          2;
  return (12742 * asin(sqrt(a))).toStringAsPrecision(1).toString();
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
 /// String v = hexString.replaceAll("#", "0xFF");
  //buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(hexString.substring(1, hexString.length ), radix: 16) + 0xFF000000);
}

getFcmToken() async {
  String? token;
  token = await FirebaseMessaging.instance.getToken();

  return token;
}

getTime(time) {
  if (!DateTime.now().difference(time).isNegative) {
    if (DateTime.now().difference(time).inMinutes < 1) {
      return "a few seconds ago";
    } else if (DateTime.now().difference(time).inMinutes < 60) {
      return "${DateTime.now().difference(time).inMinutes} minutes ago";
    } else if (DateTime.now().difference(time).inMinutes < 1440) {
      return "${DateTime.now().difference(time).inHours} hours ago";
    } else if (DateTime.now().difference(time).inMinutes > 1440) {
      return DateFormat('dd MMM, yyyy').format(time);
    }
  }
}

slots(start, end, gap) {
  String startTime = start;
  String space = gap;
  DateTime date= DateFormat.jm().parse(end);
  String closeTime =DateFormat("HH:mm").format(date);
  int? startTimeInMinutes = _getTimeInMinutesSinceMidnight(startTime, false);
  int? closeTimeInMinutes = _getTimeInMinutesSinceMidnight(closeTime, false);
  int? spaceInMinutes = _getTimeInMinutesSinceMidnight(space, true);

  if (startTimeInMinutes == null ||
      closeTimeInMinutes == null ||
      spaceInMinutes == null) {
    return;
  }

  List<String> slotsList = [];
  for (int i = startTimeInMinutes;
      i <= closeTimeInMinutes;
      i += spaceInMinutes) {
    slotsList.add(_getTimeInStringForMinutesSinceMidnight(i));
  }

  return slotsList;
}

int? _getTimeInMinutesSinceMidnight(String time, isCount) {
  final parts = time.split(":");

  if (parts.length != 2 && parts.length !=3) {
    return null;
  }

  final a = int.tryParse(parts[0]);
  final b = int.tryParse(parts[1]);

  if (a == null || b == null) {
    return null;
  }

  return a * 60 + b;
}

String _getTimeInStringForMinutesSinceMidnight(int time) {
  final hours = time ~/ 60;
  final minutes = time % 60;

  formatTime(int val) {
    if (val < 10) {
      return "0$val";
    } else {
      return "$val";
    }
  }

  return "${formatTime(hours)}:${formatTime(minutes)}";
}

isServiceEmpty(List<Services> list) {
  bool isAnyEmpty = false;
  list.asMap().entries.forEach((element) {
    if (element.value.selectServiceManType == "app_choose") {
      isAnyEmpty = true;
    }
  });
  return isAnyEmpty;
}

isServiceManEmpty(List<Services> list) {
  List<ProviderModel> provider = [];

  for (var data in list) {
    if (data.selectedServiceMan != null &&
        data.selectedServiceMan!.isNotEmpty) {
      data.selectedServiceMan!.asMap().entries.forEach((element) {
        provider.add(element.value);
      });
    }
  }

  return provider;
}

getName(List<CartModel> cart, id, isPackage) {
  String name = "";
  for (var list in cart) {
    if (list.isPackage == false) {
      if (list.serviceList!.id == id) {
        name = list.serviceList!.title!;
        return name;
      }
    } else {
      for (var pack in list.servicePackageList!.services!) {
        if (pack.id == id) {
          name = pack.title!;
          return name;
        }
      }
    }
  }
  return name;
}

getTotalRequiredServiceMan(List<CartModel> cart, id, isPackage) {
  int count = 0;
  for (var list in cart) {
    if (list.isPackage == false) {
      if (list.serviceList!.id == id) {
        count = int.parse(list.serviceList!.selectedRequiredServiceMan!);
        return count;
      }
    } else {
      for (var pack in list.servicePackageList!.services!) {
        if (pack.id == id) {
          count = int.parse(pack.selectedRequiredServiceMan!);
          return count;
        }
      }
    }
  }
  return count;
}

bool isInCart(context, id) {
  final cart = Provider.of<CartProvider>(context, listen: false);
  return cart.cartList
      .where((element) =>
          element.isPackage == false && element.serviceList!.id == id)
      .isNotEmpty;
}

bookingReasons(List<BookingReasons> bookingReasons) {
  String reason = "";
  bookingReasons.asMap().entries.forEach((e) {
    if (e.value.status!.name == appFonts.cancelled ||
        e.value.status!.name == appFonts.cancel) {
      reason = e.value.reason!;
    }
  });
  return reason;
}

bool isServiceRate(List<Reviews> review) {
  print("LENG :${review.length} ");
  bool isNotComplete = false;

  int index =
      review.indexWhere((element) => element.consumerId == userModel!.id);
  if (index >= 0) {
    isNotComplete = true;
  } else {
    isNotComplete = false;
  }
  return isNotComplete;
}

getDate(date) {
  DateTime now = DateTime.now();
  String when;
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(date));
  if (dateTime.day == now.day) {
    when = 'Today';
  } else if (dateTime.day == now.subtract(const Duration(days: 1)).day) {
    when = 'Yesterday';
  } else {
    when = "${DateFormat.MMMd().format(dateTime)}-other";
  }
  return when;
}

bool isPaymentComplete(BookingModel value) {
  bool isPayment = false;

  if (value.paymentMethod == "cash") {
    isPayment = true;
  } else {
    if (value.extraCharges != null && value.extraCharges!.isNotEmpty) {
      /*bool isNotComplete = value.extraCharges!
          .where(
              (element) => element.paymentMethod == null)
          .isNotEmpty;
      if (isNotComplete) {
        isPayment = true;
      } else {
        isPayment = false;
      }*/
      for( var d in value.extraCharges!){

        if(d.paymentStatus == null || d.paymentStatus!.toLowerCase() == "pending"){
          isPayment = true;
        }
      }
    } else {
      if(value.paymentStatus!.toLowerCase()  !="completed" ){
        isPayment = true;
      }else{
        isPayment = false;
      }

    }
  }

  return isPayment;
}

double totalServicesCharges(BookingModel bookingModel){
  double price = 0.0;
  for(var d in bookingModel.extraCharges!){
    price = price +double.parse(d.total!);
  }
  return price;
}

double totalServicesChargesAndTotalBooking(BookingModel bookingModel){
  double price = 0.0;
  for(var d in bookingModel.extraCharges!){
    price = price +double.parse(d.total!);
  }

  if(bookingModel.paymentMethod!.toLowerCase() == "cash" ){
    price = price + bookingModel.total!;
  }else{
    if(bookingModel.paymentStatus!.toLowerCase() != "completed"){
      price = price + bookingModel.total!;
    }
  }

  return price;
}


/// Capitalize given String
String capitalizeFirstLetter(val) {

  return (val != null)
      ? (val![0].toString().toUpperCase() + val!.substring(1))
      : validate(value: val);
}


// Check null string, return given value if null
String validate({String? value}) {

  if (isEmptyOrNull(value)) {
    return value!;
  } else {
    return value!;
  }
}


/// Returns true if given String is null or isEmpty
bool  isEmptyOrNull(val) =>
    val == null ||
        (val != null && val!.isEmpty) ||
        (val != null && val! == 'null');