import 'dart:developer';

import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/am_pm_layout.dart';
import 'package:fixit_user/screens/app_pages_screens/slot_booking_screen/layouts/time_slot_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../config.dart';

class ProviderTimeSlotLayout extends StatelessWidget {
  final bool? isService;
  final int? selectProviderIndex;
  final Services? service;
  const ProviderTimeSlotLayout(
      {super.key, this.isService, this.selectProviderIndex, this.service});

  @override
  Widget build(BuildContext context) {
    return Consumer<SlotBookingProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50).then((_) => value
            .onInit(context, isPackage: isService, index: selectProviderIndex,service: service,isProviderTimeSlot: true)),
        child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: Stack(

              children: [
                SingleChildScrollView(
                  child: LoadingComponent(
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.providersTimeSlot),
                                style: appCss.dmDenseBold18.textColor(
                                    appColor(context).darkText)),
                            const Icon(CupertinoIcons.multiply)
                                .inkWell(onTap: () => route.pop(context))
                          ]).paddingSymmetric(vertical: Insets.i20),
                      const VSpace(Sizes.s25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.date),
                                style: appCss.dmDenseMedium14.textColor(
                                    appColor(context).darkText)),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                          iconEnabledColor: Colors.black,
                                          items: appArray.monthList
                                              .map<DropdownMenuItem>(
                                                  (monthValue) {
                                            return DropdownMenuItem(
                                                value: monthValue,
                                                child: Text(monthValue['title'],
                                                    style: appCss
                                                        .dmDenseRegular14
                                                        .textColor(
                                                            appColor(context)
                                                                
                                                                .darkText)));
                                          }).toList(),
                                          icon: SvgPicture.asset(
                                              eSvgAssets.dropDown),
                                          onChanged: (choseVal) =>
                                              value.onDropDownChange(
                                                  choseVal,context))).boxShapeExtension(
                                      color: appColor(context)
                                          
                                          .fieldCardBg,
                                      radius: AppRadius.r4),
                                  const HSpace(Sizes.s10),
                                  Container(
                                          alignment: Alignment.center,
                                          height: Sizes.s34,
                                          width: Sizes.s87,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "${value.selectedYear.year}",
                                                  style: appCss.dmDenseRegular14
                                                      .textColor(
                                                          appColor(context)
                                                              
                                                              .darkText),
                                                ),
                                                SvgPicture.asset(
                                                    eSvgAssets.dropDown)
                                              ]))
                                      .boxShapeExtension(
                                          color: appColor(context)
                                              
                                              .fieldCardBg,
                                          radius: AppRadius.r4)
                                      .inkWell(
                                          onTap: () =>
                                              value.selectYear(context)),
                                ])
                          ]),
                      const VSpace(Sizes.s8),

                      TableCalendar(
                              currentDay: value.focusedDay.value,
                              lastDay: DateTime.utc(DateTime.now().year + 100, 3, 14),
                              firstDay: DateTime(DateTime.now().year,
                                  DateTime.now().month, DateTime.now().day),
                              focusedDay: value.focusedDay.value,
                              headerVisible: false,
                              availableGestures:
                                  AvailableGestures.horizontalSwipe,
                              calendarFormat: value.calendarFormat,
                              //onDaySelected: value.onDaySelected,
                              rowHeight: 55,
                              onPageChanged: (dayFocused) =>
                                  value.onPageCtrl(dayFocused),
                              onCalendarCreated: (controller) =>
                                  value.onCalendarCreate(controller),
                              selectedDayPredicate: (day) {
                                // Use `selectedDayPredicate` to determine which day is currently selected.
                                // If this returns true, then `day` will be marked as selected.

                                // Using `isSameDay` is recommended to disregard
                                // the time-part of compared DateTime objects.
                                return isSameDay(value.selectedDays, day);
                              },
                              daysOfWeekVisible: true,
                              pageJumpingEnabled: true,
                              pageAnimationEnabled: false,
                              onDaySelected: (selectedDay, focusedDay) =>
                                  value.onDaySelected(selectedDay, focusedDay,context),
                              daysOfWeekStyle: DaysOfWeekStyle(
                                  dowTextFormatter: (date, locale) =>
                                      DateFormat.E(locale).format(date)[0],
                                  weekdayStyle: TextStyle(
                                      color:
                                          appColor(context).darkText,
                                      fontWeight: FontWeight.bold),
                                  weekendStyle: TextStyle(
                                      color:
                                          appColor(context).darkText,
                                      fontWeight: FontWeight.bold)),

                              calendarBuilders: CalendarBuilders(
                                defaultBuilder: (context, day, focusedDay) => Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: Sizes.s30,
                                      width: Sizes.s30,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              
                                              .whiteColor,
                                          shape: BoxShape.circle),
                                      child: Text(day.day.toString(),style: appCss.dmDenseMedium14.textColor(appColor(context).lightText),),
                                    ),
                                    const VSpace(Sizes.s5),
                                    Container(
                                        alignment: Alignment.center,
                                        height: Sizes.s5,
                                        width: Sizes.s5,
                                        decoration: BoxDecoration(
                                            color: appColor(context)
                                                
                                                .trans,
                                            shape: BoxShape.circle)),
                                  ],
                                ),
                                todayBuilder: (context, day, focusedDay) =>
                                    Column(
mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: Sizes.s30,
                                      width: Sizes.s30,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              
                                              .primary,
                                          shape: BoxShape.circle),
                                      child: Text(day.day.toString(),style: appCss.dmDenseMedium14.textColor(appColor(context).whiteBg),),
                                    ),
                                    const VSpace(Sizes.s5),
                                    Container(
                                      alignment: Alignment.center,
                                      height: Sizes.s5,
                                      width: Sizes.s5,
                                      decoration: BoxDecoration(
                                          color: appColor(context)
                                              
                                              .primary,
                                          shape: BoxShape.circle)),

                                  ],
                                ),
                              ),
                              calendarStyle: CalendarStyle(
                                  markerSize: 10,
                                  markerDecoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  selectedDecoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                                  todayTextStyle: appCss.dmDenseMedium14.textColor(appColor(context).primary),
                                  todayDecoration: BoxDecoration(color: appColor(context).primary.withOpacity(.10), shape: BoxShape.circle)))
                          .paddingAll(Insets.i20)
                          .boxShapeExtension(color: appColor(context).fieldCardBg),
                      const VSpace(Sizes.s25),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(language(context, appFonts.availableTimeSlots),
                                style: appCss.dmDenseSemiBold14.textColor(
                                    appColor(context).darkText)),
                            Row(
                                children: appArray.amPmList
                                    .asMap()
                                    .entries
                                    .map((e) => AmPmLayout(
                                        data: e.value,
                                        index: e.key,
                                        selectedIndex: value.amIndex,
                                        onTap: () =>
                                            value.onAmPmChange(context, e.key)))
                                    .toList())
                          ]),
                      const VSpace(Sizes.s15),
                      Column(children: [
                        value.timeSlot.isNotEmpty
                            ? GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount: value.timeSlot.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisExtent: Sizes.s35,
                                        mainAxisSpacing: Sizes.s10,
                                        crossAxisSpacing: Sizes.s10),
                                itemBuilder: (context, index) {
                                  /*  return TimeSlotLayout(
                                    title: appArray.timeSlotsList[index],
                                    selectedIndex: value.timeIndex,
                                    index: index,
                                    onTap: ()=> value.onChangeSlot(index)
                                  );*/
                                  return Container(
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      shape: SmoothRectangleBorder(
                                        borderRadius: SmoothBorderRadius(
                                          cornerRadius: 6,
                                          cornerSmoothing: 1,
                                        ),
                                      ),
                                      color: value.timeIndex == index
                                          ? appColor(context).primary
                                          : appColor(context)
                                              
                                              .whiteColor,
                                    ),
                                    child: Text(value.timeSlot[index],
                                        style: value.timeIndex == index
                                            ? appCss.dmDenseRegular14.textColor(
                                                appColor(context)
                                                    
                                                    .whiteColor)
                                            : appCss.dmDenseMedium14.textColor(
                                                appColor(context)
                                                    
                                                    .lightText)),
                                  ).inkWell(
                                      onTap: () => value.onChangeSlot(index));
                                })
                            : Column(children: [
                                Image.asset(eImageAssets.notFound,
                                    height: Sizes.s80, width: Sizes.s150),
                                Text(language(context, appFonts.onThisDate),
                                        textAlign: TextAlign.center,
                                        style: appCss.dmDenseMedium14.textColor(
                                            appColor(context)
                                                
                                                .lightText))
                                    .paddingSymmetric(horizontal: Insets.i40)
                              ]).paddingSymmetric(vertical: Insets.i20)
                      ]).paddingAll(Insets.i15).boxShapeExtension(
                          color: appColor(context).fieldCardBg),
                      const VSpace(Sizes.s30),
                    ]).paddingSymmetric(horizontal: Insets.i20),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCommon(
                    title: appFonts.addDateTime,
                    margin: 20,
                    onTap: () => value.provideTimeSlotSelect(context),
                  ).marginOnly(bottom: Insets.i10),
                )
              ],
            )).bottomSheetExtension(context),
      );
    });
  }
}
