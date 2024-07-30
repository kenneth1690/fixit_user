import 'dart:developer';

import '../../config.dart';
import '../../models/status_booking_model.dart';

class CancelledBookingProvider with ChangeNotifier {
  List<StatusBookingModel> cancelledBookingList = [];
  BookingModel? booking;

  onReady(context){
  /*  cancelledBookingList = [];
    notifyListeners();
    appArray.cancelledBookingDetailList.asMap().entries.forEach((element) {
      if(!cancelledBookingList.contains(StatusBookingModel.fromJson(element.value))) {
        cancelledBookingList.add(StatusBookingModel.fromJson(element.value));
      }
    });
    notifyListeners();*/
    dynamic arg = ModalRoute.of(context)!.settings.arguments;
    log("arg::$arg");
    if(arg['bookingId'] != null){
      getBookingDetailBy(context,id: arg['bookingId']);
    }else {
      booking = arg['booking'];
      notifyListeners();
      getBookingDetailBy(context);
    }
  }

  //booking detail by id
  getBookingDetailBy(context,{id}) async {
    try {
      await apiServices.getApi("${api.booking}/${id ??booking!.id}", [],isToken: true,isData: true).then((value) {
        hideLoading(context);
        if (value.isSuccess!) {
          debugPrint("BOOKING DATA : ${value.data}");
          booking = BookingModel.fromJson(value.data);
          notifyListeners();
        }
      });
      log("STATYS L $booking");
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }
}