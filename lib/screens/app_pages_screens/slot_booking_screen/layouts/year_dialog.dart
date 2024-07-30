import 'dart:developer';

import '../../../../config.dart';

class YearAlertDialog extends StatelessWidget {
  const YearAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SlotBookingProvider>(builder: (context, dateTimePvr, child) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
            title: const Text("Select Year"),
            content: SizedBox(
                width: 300,
                height: 300,
                child: Theme(
                    data: ThemeData(
                        useMaterial3: true,
                        colorScheme:  ColorScheme.light(
                            primary: appColor(context).primary,
                            onSurface: appColor(context).darkText)),
                    child: YearPicker(
                        initialDate: DateTime.now(),

                        firstDate:
                        DateTime.now().subtract(const Duration(days: 0)),
                        lastDate: DateTime(2040),
                        selectedDate: dateTimePvr.selectedYear,
                        onChanged: (DateTime dateTime) {
                          dateTimePvr.selectedYear = dateTime;
                          dateTimePvr.showYear = "${dateTime.year}";
                          dateTimePvr.focusedDay.value = DateTime.utc(
                              dateTimePvr.selectedYear.year,
                              dateTimePvr.chosenValue['index'],
                              dateTimePvr.focusedDay.value.day + 0);
                          dateTimePvr.onDaySelected(
                              dateTimePvr.focusedDay.value,
                              dateTimePvr.focusedDay.value,context);
                          Navigator.pop(context);
                          log("YEAR CHANGE : ${dateTimePvr.focusedDay.value}");
                        }))));
      });
    });
  }
}