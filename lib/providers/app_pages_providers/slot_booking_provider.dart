import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/cart_model.dart';
import 'package:fixit_user/models/selected_service_cart.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/time_slot_model.dart';
import '../../screens/app_pages_screens/slot_booking_screen/layouts/provider_time_slot_layout.dart';
import '../../screens/app_pages_screens/slot_booking_screen/layouts/year_dialog.dart';
import '../../utils/date_time_picker.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

class SlotBookingProvider with ChangeNotifier {
  Services? servicesCart;
  int selectIndex = 0;
  bool isStep2 = false, isPackage = false, isBottom = true;
  PrimaryAddress? address;
  int selectProviderIndex = 0;
  List timeSlot = [];
  List newTimeSlot = [];
  int demoInt = 0;
  dynamic chosenValue;
  DateTime? selectedDay;
  DateTime selectedYear = DateTime.now();
  ScrollController scrollController = ScrollController();

  dynamic slotChosenValue, slotTime;
  DateTime? slotSelectedDay;
  DateTime slotSelectedYear = DateTime.now();

  int selectedIndex = 0;
  int scrollDayIndex = 0;
  int scrollMinIndex = 0;
  int scrollHourIndex = 0;
  String showYear = 'Select Year';
  TimeSlotModel? timeSlotModel;
  PageController pageController = PageController();
  CalendarFormat calendarFormat = CalendarFormat.week;
  CalendarFormat calendarFormatMonth = CalendarFormat.month;
  CarouselController carouselController = CarouselController();
  CarouselController carouselController1 = CarouselController();
  CarouselController carouselController2 = CarouselController();
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  final FocusNode noteFocus = FocusNode();
  bool visible = true;
  int val = 1;
  double loginWidth = 100.0;
  TextEditingController txtNote = TextEditingController();
  int? amIndex;
  DateTime? selectedDays;
  int? timeIndex;
  bool isVisible = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  addNewLoc(context) {
    final loc = Provider.of<LocationProvider>(context, listen: false);
    route.pushNamed(context, routeName.currentLocation).then((e) async {
      await loc.getLocationList(context);
      if (loc.addressList.length == 1) {
        address = loc.addressList[0];
        notifyListeners();
      }
    });
  }

  onTapNext(context) {
    servicesCart!.selectedServiceMan = null;
    notifyListeners();
    if (isPackage) {
      log("selectProviderIndex :$selectProviderIndex");
      servicePackageList[selectProviderIndex] = servicesCart!;

      servicePackageList[selectProviderIndex].selectedServiceNote =
          txtNote.text;

      notifyListeners();
      if (servicePackageList[selectProviderIndex].serviceDate != null) {
        servicesCart!.serviceDate = focusedDay.value;
        servicesCart!.selectedDateTimeFormat =
            DateFormat("aa").format(focusedDay.value);
        servicePackageList[selectProviderIndex].serviceDate = focusedDay.value;
        servicePackageList[selectProviderIndex].selectServiceManType =
            "app_choose";
        log("packageCtrl.servicePackageList[selectProviderIndex].selectServiceManType : ${servicesCart!.serviceDate}");
        isStep2 = false;
        notifyListeners();
        route.pop(context);
      } else {
        snackBarMessengers(context,
            message: "Please Select the Date & Time Slot");
      }
    } else {
      servicesCart!.selectedServiceNote = txtNote.text;
      servicesCart!.selectServiceManType = "app_choose";
      if (servicesCart!.serviceDate != null) {
        if (address != null) {
          log("servicesCart!.selectServiceManType : ${servicesCart!.selectServiceManType}");
          isStep2 = true;
          notifyListeners();
        } else {
          snackBarMessengers(context,
              message: language(context, appFonts.selectAddress));
        }
      } else {
        snackBarMessengers(context,
            message: "Please Select the Date & Time Slot");
      }
    }
  }

  onChangeSlot(index) {
    timeIndex = index;
    notifyListeners();
    checkSlotAvailable();
  }

  onAmPmChange(context, index) {
    amIndex = index;
    notifyListeners();
    filterSlotByAmPm(context);
  }

  filterSlotByAmPm(context) async {
    showLoading(context);

    timeSlot = [];
    notifyListeners();
    String gap = timeSlotModel!.timeUnit == "hours"
        ? "${timeSlotModel!.gap}:00"
        : "00:${timeSlotModel!.gap}";

    String day = DateFormat('EEEE').format(focusedDay.value);

    List<TimeSlots> dayWeek = timeSlotModel!.timeSlots!;
    log("DAY : ${dayWeek.indexWhere((element) => element.day!.toLowerCase() == day.toLowerCase())}");
    int index = dayWeek.indexWhere(
        (element) => element.day!.toLowerCase() == day.toLowerCase());
    if (index >= 0) {
      if (dayWeek[index].status == "1") {
        List newTimeSlot = await slots(dayWeek[index].startTime!.split(" ")[0],
            dayWeek[index].endTime, gap);
        newTimeSlot.asMap().entries.forEach((element) {
          focusedDay.value = DateTime.utc(
              focusedDay.value.year,
              focusedDay.value.month,
              focusedDay.value.day + 0,
              int.parse(element.value.toString().split(":")[0]),
              int.parse(element.value.toString().split(":")[0]));
          if (appArray.amPmList[amIndex!] == "AM") {
            if (focusedDay.value.hour < 12) {
              if (!timeSlot.contains(element.value)) {
                timeSlot.add(element.value);
              }
            }
          } else {
            if (focusedDay.value.hour >= 12) {
              if (!timeSlot.contains(element.value)) {
                timeSlot.add(element.value);
              }
            }
          }
        });
      } else {
        timeSlot = [];
      }
    }

    hideLoading(context);
    notifyListeners();
  }

  onChangeLocation(context, PrimaryAddress primaryAddress) async {
    final loc = Provider.of<LocationProvider>(context, listen: false);
    await loc.getLocationList(context);
    address = primaryAddress;
    if (isPackage) {
      final packageCtrl =
          Provider.of<SelectServicemanProvider>(context, listen: false);
      servicePackageList[selectProviderIndex].primaryAddress = address;
      packageCtrl.notifyListeners();
    } else {
      servicesCart!.primaryAddress = address;
    }

    notifyListeners();
  }

  void onDaySelected(DateTime selectDay, DateTime fDay, context) async {
    log("SSSS :$selectDay // $fDay");
    notifyListeners();
    /*focusedDay.value = selectDay;*/
    if (!isSameDay(selectedDay, selectDay)) {
      // Call `setState()` when updating the selected day
      selectedDay = selectedDay;
      focusedDay.value = fDay;

      log("SEKE : $slotTime");
    }
    notifyListeners();
    String day = DateFormat('EEEE').format(focusedDay.value);

    if (slotTime != null) {
      int ind = timeSlotModel!.timeSlots!.indexWhere(
          (element) => element.day!.toLowerCase() == day.toLowerCase());

      if (ind >= 0) {
        log("ind :${timeSlotModel!.timeSlots![ind].status}");
        if (timeSlotModel!.timeSlots![ind].status == "1") {
          String gap = timeSlotModel!.timeUnit == "hours"
              ? "${timeSlotModel!.gap}:00"
              : "00:${timeSlotModel!.gap}";

          timeSlot = await slots(
                  timeSlotModel!.timeSlots![ind].startTime!.split(" ")[0],
                  timeSlotModel!.timeSlots![ind].endTime,
                  gap) ??
              [];

          if (timeSlot.isNotEmpty) {
            focusedDay.value = DateTime.utc(
                focusedDay.value.year,
                focusedDay.value.month,
                focusedDay.value.day,
                DateTime.now().hour,
                DateTime.now().minute);
            checkSlotAvailable();
          }
        } else {
          timeSlot = [];
          notifyListeners();
        }
      } else {
        timeSlot = [];
        notifyListeners();
      }
    } else {
      fetchSlotTime(context);
    }
  }

  int count = 0;

  onInit(context,
      {isPackage = false,
      index,
      isEdit = false,
      service,
      sync,
      isProviderTimeSlot = false}) async {
    log("isPackage :$isPackage");
    if (isEdit) {
      servicesCart = service;
      focusedDay.value = DateTime.utc(focusedDay.value.year,
          focusedDay.value.month, focusedDay.value.day + 0);
      onDaySelected(focusedDay.value, focusedDay.value, context);
      DateTime dateTime = DateTime.now();
      int index = appArray.monthList
          .indexWhere((element) => element['index'] == dateTime.month);
      chosenValue = appArray.monthList[index];
      notifyListeners();
    } else {
      fetchSlotTime(context);
      log("dfjghjkdlkbhlfih");
      focusedDay.value = DateTime.now();
      if (isPackage) {
        final packageCtrl =
            Provider.of<SelectServicemanProvider>(context, listen: false);
        servicesCart = packageCtrl.servicePackageModel!.services![index];
        servicesCart = servicesCart;
      } else {
        servicesCart = service;
      }
      notifyListeners();

      if (servicesCart!.serviceDate != null) {
        if (timeSlotModel != null) {
          String gap = timeSlotModel!.timeUnit == "hour"
              ? "${timeSlotModel!.gap}:00"
              : "00:${timeSlotModel!.gap}";
          focusedDay.value = servicesCart!.serviceDate!;
          String day = DateFormat('EEEE').format(focusedDay.value);
          int listIndex = timeSlotModel!.timeSlots!
              .indexWhere((element) => element.day!.toLowerCase() == day);
          if (listIndex >= 0) {
            if (timeSlotModel!.timeSlots![listIndex].status == "1") {
              timeSlot = await slots(slotTime["timeSlot"]["start_time"],
                  slotTime["timeSlot"]["end_time"], gap);
            } else {
              timeSlot = [];
            }
          }
        }
        if (isProviderTimeSlot == false) {
          scrollHourIndex = appArray.hourList.indexWhere((element) {
            log("EE : $element");
            log("EE : ${focusedDay.value.hour}");
            return element == focusedDay.value.hour.toString();
          });
          scrollMinIndex = appArray.minList.indexWhere(
              (element) => element == focusedDay.value.minute.toString());
          log("index : ${focusedDay.value.hour}");
          log("index : $scrollHourIndex");
          notifyListeners();
          await Future.delayed(DurationClass.s3);

          carouselController.jumpToPage(scrollHourIndex);

          carouselController1.jumpToPage(scrollMinIndex);
          amIndex = servicesCart!.selectedDateTimeFormat == "AM" ? 0 : 1;
          carouselController2.jumpToPage(amIndex!);

          notifyListeners();
        } else {
          focusedDay.value = DateTime.utc(focusedDay.value.year,
              focusedDay.value.month, focusedDay.value.day + 0);
          onDaySelected(focusedDay.value, focusedDay.value, context);
          DateTime dateTime = DateTime.now();
          int index = appArray.monthList
              .indexWhere((element) => element['index'] == dateTime.month);
          chosenValue = appArray.monthList[index];
          log("index : $dateTime");
          scrollHourIndex = appArray.hourList.indexWhere((element) {
            return element == dateTime.hour.toString();
          });
          scrollMinIndex = appArray.minList
              .indexWhere((element) => element == dateTime.minute.toString());
          log("scrollHourIndex :$scrollHourIndex");
          carouselController.jumpToPage(scrollHourIndex);

          carouselController1.jumpToPage(scrollMinIndex);
          amIndex = DateFormat("aa").format(dateTime) == "AM" ? 0 : 1;
          carouselController2.jumpToPage(amIndex!);
        }
      } else {
        if (isProviderTimeSlot == false) {
          focusedDay.value = DateTime.utc(focusedDay.value.year,
              focusedDay.value.month, focusedDay.value.day + 0);
          onDaySelected(focusedDay.value, focusedDay.value, context);
          DateTime dateTime = DateTime.now();
          int index = appArray.monthList
              .indexWhere((element) => element['index'] == dateTime.month);
          chosenValue = appArray.monthList[index];
          log("index : $dateTime");
          scrollHourIndex = appArray.hourList.indexWhere((element) {
            return element == dateTime.hour.toString();
          });
          scrollMinIndex = appArray.minList
              .indexWhere((element) => element == dateTime.minute.toString());
          log("scrollHourIndex :$scrollHourIndex");
          carouselController.jumpToPage(scrollHourIndex);

          carouselController1.jumpToPage(scrollMinIndex);
          amIndex = DateFormat("aa").format(dateTime) == "AM" ? 0 : 1;
          carouselController2.jumpToPage(amIndex!);
        }
      }
    }
    notifyListeners();
    fetchSlotTime(context);
  }

  fetchSlotTime(context) async {
    timeSlot = [];
    log("dfjghjk");

    showLoading(context);
    notifyListeners();
    try {
      log("dddd : ${servicesCart!.id}");
      await apiServices
          .getApi("${api.providerTimeSlot}/${servicesCart!.user!.id}", [],
              isData: true, isToken: true)
          .then((value) async {
        log("CALLA :${value.data}");
        if (value.isSuccess == true) {
          timeSlotModel = TimeSlotModel.fromJson(value.data);

          log("timeSlotModel:$timeSlotModel");
          slotTime = value.data;
          String gap = timeSlotModel!.timeUnit == "hours"
              ? "${timeSlotModel!.gap}:00"
              : "00:${timeSlotModel!.gap}";

          DateTime dateTime = DateTime.now();
          String day = DateFormat('EEEE').format(dateTime);

          List<TimeSlots> dayWeek = timeSlotModel!.timeSlots!;
          log("DAY : ${dayWeek.indexWhere((element) => element.day!.toLowerCase() == day.toLowerCase())}");
          int index = dayWeek.indexWhere(
              (element) => element.day!.toLowerCase() == day.toLowerCase());
          if (index >= 0) {
            if (timeSlotModel!.timeSlots![index].status == "1") {
              timeSlot = await slots(dayWeek[index].startTime!.split(" ")[0],
                  dayWeek[index].endTime, gap);
              print('Hours-------- $timeSlot');

              //print('Hours-------- $hoursLeft');
              notifyListeners();
              checkSlotAvailable();
            } else {
              timeSlot = [];
            }
          }
        }
        hideLoading(context);
        notifyListeners();
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("EEEE fetchSlotTime: $e");
    }
  }

  checkSlotAvailable({isEdit = false, context, isService = false}) async {
    focusedDay.value = DateTime.utc(
        focusedDay.value.year,
        focusedDay.value.month,
        focusedDay.value.day + 0,
        int.parse(timeSlot[timeIndex ?? 0].toString().split(":")[0]),
        int.parse(timeSlot[timeIndex ?? 0].toString().split(":")[1]));
    try {
      log("SSS : ${servicesCart!.user!.id}");
      log("SSS : ${"${DateFormat("dd-MMM-yyy,hh:mm").format(focusedDay.value)} ${amIndex != null ? appArray.amPmList[amIndex ?? 0].toLowerCase() : DateFormat("aa").format(focusedDay.value).toLowerCase()}"}");
      var data = {
        "provider_id": servicesCart!.user!.id,
        "dateTime":
            "${DateFormat("dd-MMM-yyy,hh:mm").format(focusedDay.value)} ${amIndex != null ? appArray.amPmList[amIndex ?? 0].toLowerCase() : DateFormat("aa").format(focusedDay.value).toLowerCase()}"
      };

      log("data : $data");
      await apiServices
          .getApi(api.isValidTimeSlot, data, isData: true, isToken: true)
          .then((value) async {
        if (value.isSuccess!) {
          log("DDAA 1:${value.data}");
          if (value.data['isValidTimeSlot'] == true) {
            String day = DateFormat('EEEE').format(focusedDay.value);

            List<TimeSlots> dayWeek = timeSlotModel!.timeSlots!;
            int listIndex = dayWeek.indexWhere(
                (element) => element.day!.toLowerCase() == day.toLowerCase());

            String gap = timeSlotModel!.timeUnit == "hours"
                ? "${timeSlotModel!.gap}:00"
                : "00:${timeSlotModel!.gap}";
            if (listIndex >= 0) {
              if (timeSlotModel!.timeSlots![listIndex].status == "1") {
                timeSlot = await slots(
                        dayWeek[listIndex].startTime!.split(" ")[0],
                        dayWeek[listIndex].endTime,
                        gap) ??
                    [];
              } else {
                timeIndex = null;
                timeSlot = [];
                notifyListeners();
              }
            } else {
              timeIndex = null;
              timeSlot = [];
              notifyListeners();
            }
          } else {
            timeIndex = null;
            timeSlot = [];
            notifyListeners();
            Fluttertoast.showToast(msg: value.message);
          }

          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  checkSlotAvailableForAppChoose(
      {context, isEdit = false, isService = false}) async {
    try {

      showLoading(context);
      notifyListeners();
      focusedDay.value = DateTime.utc(
        focusedDay.value.year,
        focusedDay.value.month,
        focusedDay.value.day + 0,
        int.parse(appArray.hourList[scrollHourIndex]),
        int.parse(appArray.minList[scrollMinIndex]),
      );
      var data = {
        "provider_id": servicesCart!.userId,
        "dateTime":
            "${DateFormat("dd-MMM-yyy,hh:mm").format(focusedDay.value)} ${amIndex != null ? appArray.amPmList[amIndex ?? 0].toLowerCase() : DateFormat("aa").format(focusedDay.value).toLowerCase()}"
      };

      log("data : $data");
      await apiServices
          .getApi(api.isValidTimeSlot, data, isData: true, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          log("DDAA 3:${value.data}");
          if (value.data['isValidTimeSlot'] == true) {
            dateTimeSelect(context, isService, isEdit: isEdit);
          } else {
            timeIndex = null;
            timeSlot = [];
            notifyListeners();
            Fluttertoast.showToast(msg: value.message);
          }

          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onMinDecrement() {
    if (scrollMinIndex > 0) {
      scrollMinIndex--;
    }
    carouselController1.jumpToPage(scrollMinIndex);
    notifyListeners();
  }

  onMinIncrement() {
    if (scrollMinIndex < appArray.minList.length - 1) {
      scrollMinIndex++;
    }
    notifyListeners();
    carouselController1.jumpToPage(scrollMinIndex);
    notifyListeners();
  }

  onDayDecrement() {
    if (scrollDayIndex > 0) {
      scrollDayIndex--;
    }
    notifyListeners();
    carouselController2.jumpToPage(scrollDayIndex);
    notifyListeners();
  }

  onDayIncrement() {
    if (scrollDayIndex < appArray.dayList.length) {
      scrollDayIndex++;
    }
    notifyListeners();
    carouselController2.jumpToPage(scrollDayIndex);
    notifyListeners();
  }

  onDropDownChange(choseVal, context) async {
    notifyListeners();

    int index = choseVal['index'];
    log("chosenValue : $index");

    DateTime now =
        DateTime.utc(focusedDay.value.year, index, focusedDay.value.day);
    log("HHHHHHH :${now} ${focusedDay.value}");
    log("HHHHHHH :${now} ${now.isAfter(focusedDay.value) || DateFormat('MMMM-yyyy').format(now) == DateFormat('MMMM-yyyy').format(focusedDay.value)}");
    if (now.isAfter(DateTime.now()) ||
        DateFormat('MMMM-yyyy').format(now) ==
            DateFormat('MMMM-yyyy').format(focusedDay.value)) {
      chosenValue = choseVal;

      notifyListeners();
      focusedDay.value =
          DateTime.utc(focusedDay.value.year, index, focusedDay.value.day + 0);
      onDaySelected(focusedDay.value, focusedDay.value, context);
      log("choseVal : $choseVal");
      String day = DateFormat('EEEE').format(focusedDay.value);

      if (timeSlotModel != null) {
        List<TimeSlots> dayWeek = timeSlotModel!.timeSlots!;
        int listIndex = dayWeek.indexWhere(
            (element) => element.day!.toLowerCase() == day.toLowerCase());

        if (listIndex >= 0) {
          String gap = timeSlotModel!.timeUnit == "hours"
              ? "${timeSlotModel!.gap}:00"
              : "00:${timeSlotModel!.gap}";
          if (dayWeek[listIndex].status == "1") {
            timeSlot = await slots(dayWeek[listIndex].startTime!.split(" ")[0],
                    dayWeek[listIndex].endTime, gap) ??
                [];
          } else {
            timeSlot = [];
            notifyListeners();
          }
        } else {
          timeSlot = [];
          notifyListeners();
        }
      }
    } else {
      if (DateFormat('MMMM-yyyy').format(now) ==
          DateFormat('MMMM-yyyy').format(DateTime.now())) {
        focusedDay.value = DateTime.utc(
            focusedDay.value.year, index, focusedDay.value.day + 0);
        onDaySelected(focusedDay.value, focusedDay.value, context);
        log("choseVal : $choseVal");
        String day = DateFormat('EEEE').format(focusedDay.value);
        if (timeSlotModel != null) {
          List<TimeSlots> dayWeek = timeSlotModel!.timeSlots!;
          int listIndex = dayWeek.indexWhere(
              (element) => element.day!.toLowerCase() == day.toLowerCase());

          if (listIndex >= 0) {
            String gap = timeSlotModel!.timeUnit == "hours"
                ? "${timeSlotModel!.gap}:00"
                : "00:${timeSlotModel!.gap}";
            if (dayWeek[listIndex].status == "1") {
              timeSlot = await slots(
                      dayWeek[listIndex].startTime!.split(" ")[0],
                      dayWeek[listIndex].endTime,
                      gap) ??
                  [];
            } else {
              timeSlot = [];
              notifyListeners();
            }
          } else {
            timeSlot = [];
            notifyListeners();
          }
        }
      } else {
        log("ERROR");
        isVisible = true;
        notifyListeners();
        await Future.delayed(DurationClass.s3);

        isVisible = false;
        notifyListeners();
      }
    }
  }

  onPageCtrl(dayFocused) {
    focusedDay.value = dayFocused;
    demoInt = dayFocused.year;
    log("dayFocused :: $demoInt");
    notifyListeners();
  }

  onHourScroll(index) {
    scrollHourIndex = index;
    notifyListeners();
  }

  onHourTap(context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
primaryColor: appColor(context).primary,
              timePickerTheme: TimePickerThemeData(
                backgroundColor: appColor(context).whiteBg,
                hourMinuteColor: appColor(context).stroke,
                dialTextStyle: TextStyle(
                  color: appColor(context).red, // Set the text color for "Enter time"
                ),
                dayPeriodColor: appColor(context).primary.withOpacity(.6),
                hourMinuteTextColor: appColor(context).primary, // Text color for hours and minutes
                dayPeriodTextColor: appColor(context).primary, // Text color for AM/PM
                dayPeriodBorderSide: BorderSide(color: appColor(context).primary), // Border color for AM/PM
                dialHandColor: appColor(context).primary, // Color of the hour hand
                dialTextColor: appColor(context).darkText, // Text color on the clock dial
                dialBackgroundColor: appColor(context).fieldCardBg,
                entryModeIconColor: appColor(context).primary,
                helpTextStyle:  TextStyle(
                  color: appColor(context).whiteBg, // Set the text color for "Enter time"
                ),
                cancelButtonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(appColor(context).primary), foregroundColor:MaterialStateProperty.all<Color>(appColor(context).whiteBg)),
                confirmButtonStyle: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(appColor(context).primary), foregroundColor:MaterialStateProperty.all<Color>(appColor(context).whiteBg)),
                hourMinuteTextStyle: TextStyle(fontSize: 30), // Text style for hours
          )),
          child: child!,
        );
      },
    );

    log("TIME : ${time}");
    log("TIME : ${time!.format(context)}");
    log("TIME : ${time!.period.name}");
    scrollHourIndex = appArray.hourList.indexWhere((element) {
      return element == time.hour.toString();
    });
    scrollMinIndex = appArray.minList
        .indexWhere((element) => element == time.minute.toString());
    log("scrollHourIndex :$scrollHourIndex");
    carouselController.jumpToPage(scrollHourIndex);

    carouselController1.jumpToPage(scrollMinIndex);
    amIndex = time.period.name.toUpperCase() == "AM" ? 0 : 1;
    carouselController2.jumpToPage(amIndex!);
    notifyListeners();
  }

  onMinScroll(index) {
    scrollMinIndex = index;
    notifyListeners();
  }

  onDayScroll(index) {
    scrollDayIndex = index;
    notifyListeners();
  }

  onCalendarCreate(controller) {
    log("controller : $controller");
    pageController = controller;
  }

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context3) {
          return const YearAlertDialog();
        });
  }

  onLeftArrow() async {
    DateTime now = DateTime.now();
    if (DateFormat('MM-yyyy').format(focusedDay.value) !=
        DateFormat('MM-yyyy').format(now)) {
      pageController.previousPage(
          duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
      final newMonth = focusedDay.value.subtract(const Duration(days: 30));
      focusedDay.value = newMonth;
      int index = appArray.monthList
          .indexWhere((element) => element['index'] == focusedDay.value.month);
      chosenValue = appArray.monthList[index];
      selectedYear = DateTime.utc(focusedDay.value.year, focusedDay.value.month,
          focusedDay.value.day + 0);
      notifyListeners();
    } else {
      isVisible = true;
      notifyListeners();
      await Future.delayed(DurationClass.s3);

      isVisible = false;
      notifyListeners();
    }
    log("FFF : $focusedDay");
  }

  onRightArrow() {
    pageController.nextPage(
        duration: const Duration(microseconds: 200), curve: Curves.bounceIn);
    final newMonth = focusedDay.value.add(const Duration(days: 30));
    focusedDay.value = newMonth;
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == focusedDay.value.month);
    chosenValue = appArray.monthList[index];
    selectedYear = DateTime.utc(focusedDay.value.year, focusedDay.value.month,
        focusedDay.value.day + 0);
    notifyListeners();
    log("hbfbfdbf::::::$newMonth");
  }

  void listen() {
    if (scrollController.position.pixels >= 200) {
      hide();
    } else {
      show();
    }
    notifyListeners();
  }

  void show() {
    if (!isBottom) {
      isBottom = true;
      notifyListeners();
    }
  }

  void hide() {
    if (isBottom) {
      isBottom = false;
      notifyListeners();
    }
  }

  onReady(context) async {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    scrollController.addListener(listen);
    log("ARG: $data");
    servicesCart = data['selectServicesCart'];
    servicesCart!.selectedRequiredServiceMan =
        servicesCart!.selectedRequiredServiceMan ??1;
    isPackage = data['isPackage'] ?? false;
    selectProviderIndex = data['selectProviderIndex'] ?? 0;
    notifyListeners();
    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);
    if (locationCtrl.addressList.isNotEmpty) {
      int index = locationCtrl.addressList
          .indexWhere((element) => element.isPrimary == 1);
      if (index >= 0) {
        address = locationCtrl.addressList[index];
      } else {
        address = locationCtrl.addressList[0];
      }
    }
    if (isPackage) {
      final packageCtrl =
          Provider.of<SelectServicemanProvider>(context, listen: false);
      servicePackageList[selectProviderIndex].primaryAddress = address;
      packageCtrl.notifyListeners();
    } else {
      servicesCart!.primaryAddress = address;
    }
    DateTime dateTime = DateTime.now();
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == dateTime.month);
    chosenValue = appArray.monthList[index];
    notifyListeners();
  }

  setAddress(context) {
    if (isPackage) {
      final packageCtrl =
          Provider.of<SelectServicemanProvider>(context, listen: false);
      servicePackageList[selectProviderIndex].primaryAddress = address;
      packageCtrl.notifyListeners();
      notifyListeners();
    }
  }

  onRemoveService(context) {
    if ((servicesCart!.selectedRequiredServiceMan!) == 1) {
      route.pop(context);
    } else {
      servicesCart!.selectedRequiredServiceMan =
          ((servicesCart!.selectedRequiredServiceMan!) - 1);
    }
    notifyListeners();
  }

  onAdd() {
    int count = (servicesCart!.selectedRequiredServiceMan!);
    count++;
    servicesCart!.selectedRequiredServiceMan = count;

    notifyListeners();
  }

  onDateTimeSelect(context, index) {
    selectIndex = index;
    notifyListeners();
  }

  onProviderDateTimeSelect(context) {
    log("SSS : $selectProviderIndex ");
    if (selectIndex != null) {
      if (selectIndex == 0) {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context3) {
              return DateTimePicker(
                isWeek: false,
                isService: isPackage,
                selectProviderIndex: selectProviderIndex,
                service: servicesCart,
              );
            }).then((value) {
          log("VVVS :#$value");
          if (isPackage) {
            final packageCtrl =
                Provider.of<SelectServicemanProvider>(context, listen: false);
            servicePackageList[selectProviderIndex].serviceDate =
                servicesCart!.serviceDate;
            servicePackageList[selectProviderIndex].selectDateTimeOption =
                selectIndex == 0 ? "custom" : "timeSlot";
            servicePackageList[selectProviderIndex].selectedDateTimeFormat =
                servicesCart!.selectedDateTimeFormat;
            notifyListeners();
            packageCtrl.notifyListeners();
          }
        });
        notifyListeners();
      } else {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context3) {
              return Consumer<SlotBookingProvider>(
                  builder: (context1, value, child) {
                return StatefulBuilder(builder: (context2, setState) {
                  return ProviderTimeSlotLayout(
                    isService: isPackage,
                    selectProviderIndex: selectProviderIndex,
                    service: servicesCart,
                  );
                });
              });
            }).then((value) {
          log("VVVS : $value");
          if (value == null) {
            focusedDay.value = DateTime.now();
            notifyListeners();
          }
          amIndex = null;
          timeSlot = [];
          notifyListeners();
          if (isPackage) {
            final packageCtrl =
                Provider.of<SelectServicemanProvider>(context, listen: false);
            servicePackageList[selectProviderIndex] = servicesCart!;
            servicePackageList[selectProviderIndex].serviceDate =
                servicesCart!.serviceDate;
            servicePackageList[selectProviderIndex].selectDateTimeOption =
                selectIndex == 0 ? "custom" : "timeSlot";
            servicePackageList[selectProviderIndex].selectedDateTimeFormat =
                servicesCart!.selectedDateTimeFormat;
            notifyListeners();
            packageCtrl.notifyListeners();
            log("packageCtrl.servicePackageList[selectProviderIndex].serviceDate :${servicePackageList[selectProviderIndex].serviceDate}");
          }
        });
      }
      notifyListeners();
    } else {
      snackBarMessengers(context,
          message: "Please Select Date Time slot option");
    }
  }

  dateTimeSelect(context, isService, {isEdit = false}) {
    log("isService: $servicesCart");
    focusedDay.value = DateTime.utc(
      focusedDay.value.year,
      focusedDay.value.month,
      focusedDay.value.day,
      int.parse(appArray.hourList[scrollHourIndex]),
      int.parse(appArray.minList[scrollMinIndex]),
    );
    notifyListeners();

    if (isEdit) {
      route.pop(context, arg: {
        "date": focusedDay.value,
        "time": appArray.amPmList[scrollDayIndex]
      });
    } else {
      servicesCart!.serviceDate = focusedDay.value;
      servicesCart!.selectedDateTimeFormat = appArray.amPmList[scrollDayIndex];
      notifyListeners();
      if (isService) {
        final packageCtrl =
            Provider.of<SelectServicemanProvider>(context, listen: false);
        packageCtrl.notifyListeners();
      }
      log("isService: ${servicesCart!.selectedDateTimeFormat}");
      route.pop(context, arg: !isService ? servicesCart : focusedDay.value);
    }
  }

  provideTimeSlotSelect(context) async {
    log("timeIndex : $timeIndex");
    if (timeIndex != null) {
      focusedDay.value = DateTime.utc(
        focusedDay.value.year,
        focusedDay.value.month,
        focusedDay.value.day,
        int.parse(timeSlot[timeIndex!].toString().split(":")[0]),
        int.parse(timeSlot[timeIndex!].toString().split(":")[1]),
      );

      servicesCart!.serviceDate = focusedDay.value;
      servicesCart!.selectedDateTimeFormat =
          DateFormat("aa").format(focusedDay.value);
      notifyListeners();
      log("DOC: $isPackage ///${servicesCart!.serviceDate}");
      if (isPackage) {
        final packageCtrl =
            Provider.of<SelectServicemanProvider>(context, listen: false);
        servicePackageList[selectProviderIndex] = servicesCart!;
        servicePackageList[selectProviderIndex].serviceDate =
            servicesCart!.serviceDate;
        notifyListeners();
        servicePackageList[selectProviderIndex].selectDateTimeOption =
            selectIndex == 0 ? "custom" : "timeSlot";
        servicePackageList[selectProviderIndex].selectedDateTimeFormat =
            servicesCart!.selectedDateTimeFormat;
        packageCtrl.notifyListeners();
        log("DOC:sss $isPackage ///${servicesCart!.serviceDate}");
      }
      route.pop(context, arg: isPackage ? servicesCart : focusedDay.value);
    } else {
      snackBarMessengers(context, message: "Please select time slot");
    }
  }

  String buttonName(context) {
    String name = appFonts.next;
    log("isPackage ::$isPackage");
    if (isPackage) {
      final packageCtrl =
          Provider.of<SelectServicemanProvider>(context, listen: false);
      if (servicePackageList.length == 1) {
        name = appFonts.submit;
        return name;
      } else {
        log("IMDD:${selectProviderIndex + 1} //$selectProviderIndex");
        if (selectProviderIndex + 1 < servicePackageList.length) {
          name = appFonts.submit;
        } else {
          name = appFonts.next;
        }

        return name;
      }
    } else {
      return appFonts.next;
    }
  }

  onBack(context) {
    log("WOEK ");
    if (isStep2) {
      isStep2 = false;
    } else {
      isStep2 = false;
      route.pop(context);
      txtNote.text = "";
    }
    if (servicesCart != null) {
      servicesCart!.serviceDate = null;
      servicesCart!.selectDateTimeOption = null;
      if (isPackage) {
        final packageCtrl =
            Provider.of<SelectServicemanProvider>(context, listen: false);
        servicePackageList[selectProviderIndex].serviceDate = null;
        servicePackageList[selectProviderIndex].selectDateTimeOption = null;
      }
      amIndex = null;
    }
    notifyListeners();
  }

  addToCart(context) async {
    servicesCart!.primaryAddress = address;
    notifyListeners();
    final cartCtrl = Provider.of<CartProvider>(context, listen: false);

    int index = cartCtrl.cartList.indexWhere((element) =>
        element.isPackage == false &&
        element.serviceList != null &&
        element.serviceList!.id == servicesCart!.id);
    log("ADDD :${servicesCart!.primaryAddress}");
    if (index >= 0) {
      //snackBarMessengers(context, message: "Package Already Added");
      cartCtrl.cartList[index].serviceList = servicesCart;

      cartCtrl.notifyListeners();
    } else {
      CartModel cartModel =
          CartModel(isPackage: false, serviceList: servicesCart);
      cartCtrl.cartList.add(cartModel);
      cartCtrl.notifyListeners();
    }

    log("CART: ${cartCtrl.cartList}");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(session.cart);
    List<String> personsEncoded =
        cartCtrl.cartList.map((person) => jsonEncode(person.toJson())).toList();
    await preferences.setString(session.cart, json.encode(personsEncoded));

    cartCtrl.notifyListeners();
    cartCtrl.checkout(context);
    isStep2 = false;
    selectIndex = 0;
    txtNote.text = "";
    servicesCart = null;
    final selectOption =
        Provider.of<SelectServicemanProvider>(context, listen: false);
    final providerDetail =
        Provider.of<ProviderDetailsProvider>(context, listen: false);
    selectOption.servicePackageModel = null;
    providerDetail.selectProviderIndex = 0;
    providerDetail.selectIndex = 0;
    focusedDay.value = DateTime.now();
    notifyListeners();

    route.pushNamed(context, routeName.cartScreen);
  }
}
