import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/booking_status_model.dart';
import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/year_dialog.dart';
import 'package:fixit_user/utils/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../screens/bottom_screens/booking_screen/layouts/booking_filter_layout.dart';

class BookingProvider with ChangeNotifier {
  String? month;
  double widget1Opacity = 0.0;
  AnimationController? animationController;
  List<BookingModel> bookingList = [];
  List statusList = [];
  bool isExpand = false;
  int selectIndex = 0;
  int? statusIndex;
  List<CategoryModel> categoryList = [];
  ScrollController scrollController = ScrollController();
  List selectedCategory = [];
  dynamic slotChosenValue;
  DateTime? slotSelectedDay;
  DateTime slotSelectedYear = DateTime.now();
  dynamic chosenValue;
  DateTime? selectedDay;
  DateTime selectedYear = DateTime.now();
  final ValueNotifier<DateTime> focusedDay = ValueNotifier(DateTime.now());
  CalendarFormat calendarFormat = CalendarFormat.month;
  int demoInt = 0;
  PageController pageController = PageController();
  TextEditingController categoryCtrl = TextEditingController();
  TextEditingController searchText = TextEditingController();
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime? rangeStart;
  DateTime? rangeEnd;
  DateTime currentDate = DateTime.now();
  final FocusNode searchFocus = FocusNode();
  final FocusNode categorySearchFocus = FocusNode();

  bool? isLastPage;
  int pageNumber = 1;
  bool error = false;
  bool? loading;

  List<BookingModel> posts = [];
  final numberOfPostsPerRequest = 10;

  onTapMonth(val) {
    month = val;
    notifyListeners();
  }

  onRangeSelect(start, end, focusedDay) {
    selectedDay = null;
    currentDate = focusedDay;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    notifyListeners();
  }

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context3) {
          return const YearAlertDialog();
        });
  }

  onDropDownChange(choseVal) {
    notifyListeners();
    chosenValue = choseVal;

    notifyListeners();
    int index = choseVal['index'];
    focusedDay.value =
        DateTime.utc(focusedDay.value.year, index, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
  }

  onLeftArrow() {
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
  }

  void onDaySelected(DateTime selectDay, DateTime fDay) {
    notifyListeners();
    focusedDay.value = selectDay;
  }

  onPageCtrl(dayFocused) {
    focusedDay.value = dayFocused;
    demoInt = dayFocused.year;
    notifyListeners();
  }

  onInit(context) {
    focusedDay.value = DateTime.utc(focusedDay.value.year,
        focusedDay.value.month, focusedDay.value.day + 0);
    onDaySelected(focusedDay.value, focusedDay.value);
    DateTime dateTime = DateTime.now();
    int index = appArray.monthList
        .indexWhere((element) => element['index'] == dateTime.month);
    chosenValue = appArray.monthList[index];
    final dashCtrl = Provider.of<DashboardProvider>(context, listen: false);
    categoryList = dashCtrl.categoryList;

    notifyListeners();
  }

  onCalendarCreate(controller) {
    pageController = controller;
  }

  //category list
  getCategory({search}) async {
    try {
      String apiUrl = api.category;
      if(zoneIds.isNotEmpty) {
        if (search != null && search != "") {
          apiUrl = "${api.category}?search=$search&zone_ids=$zoneIds";
        } else {
          apiUrl = "${api.category}?zone_ids=$zoneIds";
        }
      }else{
        if (search != null && search != "") {
          apiUrl = "${api.category}?search=$search";
        } else {
          apiUrl = api.category;
        }
      }
      log("CATEGIRY");
      await apiServices.getApi(apiUrl, []).then((value) {
        if (value.isSuccess!) {
          List category = value.data;
          categoryList = [];
          for (var data in category.reversed.toList()) {
            if (!categoryList.contains(CategoryModel.fromJson(data))) {
              categoryList.add(CategoryModel.fromJson(data));
            }
            notifyListeners();
          }
        } else {
          categoryList = [];
          notifyListeners();
        }
      });
      log("categoryList :${categoryList.length}");
    } catch (e) {
      notifyListeners();
    }
  }

  onCategoryChange(context, id) {
    if (!statusList.contains(id)) {
      statusList.add(id);
    } else {
      statusList.remove(id);
    }

    notifyListeners();
  }

  onStatus(index) {
    statusIndex = index;
    notifyListeners();
  }

  onFilter(index) {
    selectIndex = index;
    notifyListeners();
  }

  onExpand(data, index) {
    bookingList[index].isExpand = !bookingList[index].isExpand!;
    notifyListeners();
  }

  onReady(context, DashboardProvider dash) {
    dash.getBookingHistory(context);
    dash.notifyListeners();
    notifyListeners();
  }

  onFetchData(context, sync) {
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    onInit(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      widget1Opacity = 1;
      notifyListeners();
    });
    notifyListeners();
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  onTapFilter(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const BookingFilterLayout();
      },
    ).then((value) {
      getCategory();
      categoryCtrl.text = "";
      final dash = Provider.of<DashboardProvider>(context, listen: false);

      dash.getBookingHistory(context);
    });
  }

  onTapBookings(BookingModel data, context) {
    final dash = Provider.of<DashboardProvider>(context, listen: false);
   if (data.bookingStatus != null) {
      if (data.bookingStatus!.slug == appFonts.pending) {
        //route.pushNamed(context, routeName.packageBookingScreen);
        route
            .pushNamed(context, routeName.pendingBookingScreen, arg: {"booking":data})
            .then((e) {
          dash.getBookingHistory(context);
        });
      } else if (data.bookingStatus!.slug == appFonts.accepted ||
          data.bookingStatus!.slug == appFonts.assigned) {
        route
            .pushNamed(context, routeName.acceptedBookingScreen, arg: {"booking":data})
            .then((e) {
          dash.getBookingHistory(context);
        });
      } else if (data.bookingStatus!.slug ==
              appFonts.onGoing ||
          data.bookingStatus!.slug == appFonts.ontheway ||
          data.bookingStatus!.slug == appFonts.startAgain ||
          data.bookingStatus!.slug == appFonts.onHold) {
        route
            .pushNamed(context, routeName.ongoingBookingScreen, arg: {"booking":data})
            .then((e) {
          dash.getBookingHistory(context);
        });
      } else if (data.bookingStatus!.slug ==
          appFonts.completed) {
        route
            .pushNamed(context, routeName.completedServiceScreen, arg: {"booking":data})
            .then((e) {
          dash.getBookingHistory(context);
        });
      } else if (data.bookingStatus!.slug == appFonts.cancel) {
        route
            .pushNamed(context, routeName.cancelledServiceScreen, arg: {"booking":data})
            .then((e) {
          dash.getBookingHistory(context);
        });
      }
    } else {
      route
          .pushNamed(context, routeName.pendingBookingScreen, arg: {"booking":data})
          .then((e) {
        dash.getBookingHistory(context);
      });
    }
  }

  clearTap(context, {isBack = true}) {
    statusIndex = null;
    selectedCategory = [];
    rangeEnd = null;
    rangeStart = null;
    notifyListeners();

    if (isBack) {
      route.pop(context, arg: "clear");
    }
  }

  editAddress(context, BookingModel? bookingModel) {
    route.pushNamed(context, routeName.myLocation, arg: true).then((e) {
      if (e != null) {
        PrimaryAddress address = e;
        updateStatus(context, bookingModel!.id, address.id,
            isUpdateAddress: true);
      }
    });
  }

  editDateTimeTap(context, BookingModel? bookingModel) {
    log("fghdfghdjhg");

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context3) {
          return DateTimePicker(
            isWeek: false,
            isService: false,
            isEdit: true,
            service: bookingModel!.service,
          );
        }).then((value) {
      log("value:$value");
      updateStatus(context, bookingModel!.id, value);
    });
  }

  //update status
  updateStatus(context, id, argData, {isUpdateAddress = false}) async {
    try {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      showLoading(context);
      notifyListeners();
      log("argData :$argData");
      dynamic data;
      if (isUpdateAddress) {
        data = {
          "address_id": argData,
        };
      } else {
        data = {
          "date_time":
              "${DateFormat("dd-MMM-yyyy").format(argData["date"])},${DateFormat("hh:mm").format(argData["date"])} ${argData["time"].toString().toLowerCase()}"
        };
      }

      log("DDD:$data");
      await apiServices
          .putApi("${api.booking}/$id", data, isToken: true, isData: true)
          .then((value) async {
        if (value.isSuccess!) {
          await dash.getBookingHistory(context);

          hideLoading(context);
          notifyListeners();
        } else {
          hideLoading(context);
          notifyListeners();
        }
      });
      hideLoading(context);
      notifyListeners();
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }

  String totalCountFilter() {
    int count = 0;

    if (selectedCategory.isNotEmpty) {
      count++;
    }
    if (rangeStart != null || rangeEnd != null) {
      count++;
    }
    if (statusIndex != null) {
      count++;
    }

    return count.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    animationController!.dispose();
    notifyListeners();
    super.dispose();
  }
}
