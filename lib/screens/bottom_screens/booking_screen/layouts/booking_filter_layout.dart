import 'dart:developer';

import 'package:fixit_user/screens/bottom_screens/booking_screen/layouts/booking_status_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config.dart';
import '../../../../utils/general_utils.dart';

class BookingFilterLayout extends StatelessWidget {
  const BookingFilterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context);

    return Consumer<BookingProvider>(builder: (context1, value, child) {
      return SizedBox(
          height: Sizes.s600,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("${language(context, appFonts.filterBy)} (${value
                  .totalCountFilter()})",
                  style: appCss.dmDenseMedium18
                      .textColor(appColor(context).darkText)),
              const Icon(CupertinoIcons.multiply)
                  .inkWell(onTap: () => route.pop(context))
            ]).paddingSymmetric(horizontal: Insets.i20),
            SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    height: Sizes.s50,
                    decoration: BoxDecoration(
                        color: appColor(context).fieldCardBg,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r30))),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: appArray.bookingFilterList
                            .asMap()
                            .entries
                            .map((e) =>
                            FilterTapLayout(
                                data: e.value,
                                index: e.key,
                                selectedIndex: value.selectIndex,
                                onTap: () => value.onFilter(e.key)))
                            .toList())
                        .paddingAll(Insets.i5))
                    .paddingOnly(
                    top: Insets.i25,
                    bottom: Insets.i20,
                    left: Insets.i20,
                    right: Insets.i20)
            ),
            Text(language(context, value.selectIndex == 0
                ? appFonts.bookingStatus : value.selectIndex == 1 ? appFonts
                .selectDateOnly : appFonts.categoryList),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).lightText))
                .paddingSymmetric(horizontal: Insets.i20),
            const VSpace(Sizes.s15),
            Expanded(
                child: Column(children: [
                  value.selectIndex == 0
                      ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                          ...dash.bookingStatusList
                              .asMap()
                              .entries
                              .map((e) =>
                              BookingStatusFilterLayout(
                                  title: e.value.name.toString()
                                      .capitalizeFirst(),
                                  index: e.key,
                                  selectedIndex: value.statusIndex,
                                  onTap: () => value.onStatus(e.key)).inkWell(onTap: () => value.onStatus(e.key)))

                        ]).paddingSymmetric(horizontal: Insets.i20),
                      ))
                      : value.selectIndex == 2
                      ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          children: [

                            SearchTextFieldCommon(
                              controller: value.categoryCtrl,
                              focusNode: value.categorySearchFocus,
                              suffixIcon:value.categoryCtrl.text.isNotEmpty? Icon(Icons.cancel,color: appColor(context).darkText,).inkWell(onTap: (){
                                value.categoryCtrl.text ="";
                                if (value.selectIndex == 2) {
                                  value.getCategory(
                                      search: value.categoryCtrl.text);
                                }
                              }):null,
                              onChanged: (val) {
                                if(val.isEmpty){
                                  if (value.selectIndex == 2) {
                                    value.getCategory(
                                        search: value.categoryCtrl.text);
                                  }
                                }else if(val.length >2){
                                  if (value.selectIndex == 2) {
                                    value.getCategory(
                                        search: value.categoryCtrl.text);
                                  }
                                }
                                value.notifyListeners();
                              },

                              onFieldSubmitted: (v) => value.getCategory(
                                  search: value.categoryCtrl.text),
                            ).padding(
                                bottom: Insets.i15, horizontal: Insets.i20),

                            ...value.categoryList
                                .asMap()
                                .entries
                                .map((e) =>
                                ListTileLayout(
                                    data: e.value,
                                    selectedCategory: value.statusList,
                                    index: e.key,
                                    onTap: () =>
                                        value.onCategoryChange(
                                            context, e.value.id)).inkWell(onTap:  () =>
                                    value.onCategoryChange(
                                        context, e.value.id)))

                          ]),
                    ),
                  )
                      : Expanded(child: SingleChildScrollView(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if( value.rangeEnd != null)
                          Text("${value.rangeStart!.day} ${monthCondition(
                              value.rangeStart!.month.toString())} ${language(
                              context, appFonts.to)} ${value.rangeEnd!
                              .day} ${monthCondition(
                              value.rangeStart!.month.toString())} ${value
                              .selectedYear.year}",
                              style: appCss.dmDenseMedium18.textColor(
                                  appColor(context).primary)).padding(
                              horizontal: Insets.i20, bottom: Insets.i15),

                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonArrow(arrow: eSvgAssets.arrowLeft,
                                  onTap: () => value.onLeftArrow()),
                              const HSpace(Sizes.s20),
                              Container(
                                  height: Sizes.s34,
                                  alignment: Alignment.center,
                                  width: Sizes.s100,
                                  child: DropdownButton(
                                      underline: Container(),
                                      focusColor: Colors.white,
                                      value: value.chosenValue,
                                      style: const TextStyle(
                                          color: Colors.white),
                                      iconEnabledColor: appColor(context)
                                          
                                          .darkText,
                                      items: appArray.monthList
                                          .map<DropdownMenuItem>((monthValue) {
                                        return DropdownMenuItem(
                                            onTap: () =>
                                                value.onTapMonth(
                                                    monthValue['title']),
                                            value: monthValue,
                                            child: Text(monthValue['title'],
                                                style:
                                                appCss.dmDenseLight14.textColor(
                                                    appColor(context)
                                                        .darkText)));
                                      }).toList(),
                                      icon: SvgPicture.asset(
                                          eSvgAssets.dropDown),
                                      onChanged: (choseVal) =>
                                          value.onDropDownChange(choseVal)))
                                  .boxShapeExtension(
                                  color: appColor(context).fieldCardBg,
                                  radius: AppRadius.r4),
                              const HSpace(Sizes.s20),
                              Container(
                                  alignment: Alignment.center,
                                  height: Sizes.s34,
                                  width: Sizes.s87,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Text("${value.selectedYear.year}",
                                          style: appCss.dmDenseLight14
                                              .textColor(
                                              appColor(context)
                                                  .darkText),),
                                        SvgPicture.asset(eSvgAssets.dropDown)
                                      ])).boxShapeExtension(
                                  color: appColor(context).fieldCardBg,
                                  radius: AppRadius.r4)
                                  .inkWell(
                                  onTap: () => value.selectYear(context)),
                              const HSpace(Sizes.s20),
                              CommonArrow(arrow: eSvgAssets.arrowRight,
                                  onTap: () => value.onRightArrow()),
                            ]).paddingSymmetric(horizontal: Insets.i10),
                        const VSpace(Sizes.s15),
                        TableCalendar(
                            rowHeight: 40,
                            headerVisible: false,
                            daysOfWeekVisible: true,
                            pageJumpingEnabled: true,
                            pageAnimationEnabled: false,
                            rangeSelectionMode: RangeSelectionMode.toggledOn,
                            lastDay: DateTime.utc(DateTime
                                .now()
                                .year + 100, 3, 14),
                            firstDay: DateTime.utc(DateTime
                                .now()
                                .year, DateTime
                                .now()
                                .month, DateTime
                                .now()
                                .day),
                            onDaySelected: value.onDaySelected,
                            focusedDay: value.focusedDay.value,
                            rangeStartDay: value.rangeStart,
                            rangeEndDay: value.rangeEnd,
                            availableGestures: AvailableGestures.none,
                            calendarFormat: value.calendarFormat,
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            onRangeSelected: (start, end, focusedDay) =>
                                value.onRangeSelect(start, end, focusedDay),
                            headerStyle: const HeaderStyle(
                                leftChevronVisible: false,
                                formatButtonVisible: false,
                                rightChevronVisible: false),
                            onPageChanged: (dayFocused) =>
                                value.onPageCtrl(dayFocused),
                            onCalendarCreated: (controller) =>
                                value.onCalendarCreate(controller),
                            selectedDayPredicate: (day) {
                              return isSameDay(value.focusedDay.value, day);
                            },
                            daysOfWeekStyle: DaysOfWeekStyle(

                                dowTextFormatter: (date, locale) =>
                                DateFormat.E(locale).format(date)[0],
                                weekdayStyle: appCss.dmDenseBold14.textColor(
                                    appColor(context).primary),

                                weekendStyle: appCss.dmDenseBold14.textColor(
                                    appColor(context).primary)),
                            calendarStyle: CalendarStyle(
                                rangeHighlightColor: appColor(context)
                                    .primary.withOpacity(0.10),
                                rangeEndDecoration: BoxDecoration(
                                    color: appColor(context).primary,
                                    shape: BoxShape.circle
                                ),

                                defaultTextStyle: appCss.dmDenseLight14
                                    .textColor(
                                    appColor(context).darkText),
                                withinRangeTextStyle: appCss.dmDenseLight14
                                    .textColor(
                                    appColor(context).primary),
                                rangeStartTextStyle: appCss.dmDenseLight14
                                    .textColor(
                                    appColor(context).whiteColor),
                                rangeEndTextStyle: appCss.dmDenseLight14
                                    .textColor(
                                    appColor(context).whiteColor),
                                rangeStartDecoration: BoxDecoration(
                                    color: appColor(context).primary,
                                    shape: BoxShape.circle
                                ),
                                todayTextStyle: appCss.dmDenseMedium14
                                    .textColor(
                                    appColor(context).primary),
                                todayDecoration: BoxDecoration(
                                    color: appColor(context)
                                        
                                        .primary
                                        .withOpacity(.10),
                                    shape: BoxShape.circle))).paddingAll(
                            Insets.i20)
                            .boxShapeExtension(
                            color: appColor(context).fieldCardBg)
                            .paddingSymmetric(horizontal: Insets.i20)
                      ]
                  ))),
                  BottomSheetButtonCommon(textOne: appFonts.clearAll,
                      textTwo: appFonts.apply,
                      applyTap: () {
                        value.pageNumber = 1;
                        value.notifyListeners();
                        dash.getBookingHistory(context);
                        route.pop(context);
                      },
                      clearTap: () => value.clearTap(context))
                ]))
          ]).paddingOnly(top: Insets.i20))
          .bottomSheetExtension(context);
    }
    );
  }
}
