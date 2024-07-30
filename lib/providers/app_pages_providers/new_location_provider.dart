import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';

import '../../models/country_state_model.dart';
import '../../services/environment.dart';

class NewLocationProvider with ChangeNotifier {
  int selectIndex = 0;
  List categoryList = [
    appFonts.home,
    appFonts.work,
    appFonts.other,
  ];
  PrimaryAddress? address;
  bool isCheck = false, isEdit = false;
  GlobalKey<FormState> locationFormKey = GlobalKey<FormState>();

  String dialCode = "+91";
  TextEditingController streetCtrl = TextEditingController();
  TextEditingController countryCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController zipCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode numberFocus = FocusNode();
  final FocusNode zipFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode stateFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();
  final FocusNode streetFocus = FocusNode();

  int? countryValue, stateValue;
  CountryStateModel? country;
  StateModel? state;

  getOnInitData(context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);

    log("GHFDGFH $data");
    if (data != null) {
      var arg = data['data'];
      address = arg;
      isEdit = true;
      log("STATEID :${address!.countryId!}");
      nameCtrl.text = address!.alternativeName ?? "";
      numberCtrl.text = address!.alternativePhone!;
      if (address!.latitude.toString() != position!.latitude.toString() &&
          address!.longitude.toString() != position!.longitude.toString()) {
        streetCtrl.text = locationCtrl.place!.street!;
        cityCtrl.text = locationCtrl.place!.locality!;
        zipCtrl.text = locationCtrl.place!.postalCode!;

      } else {
        zipCtrl.text = address!.postalCode!;
        streetCtrl.text = address!.address!;
        cityCtrl.text = address!.city!;
      }

      countryValue = int.parse(address!.countryId!);
      int index = locationCtrl.countryStateList
          .indexWhere((element) => element.id == countryValue);
      country = locationCtrl.countryStateList[index];
      locationCtrl.stateList = locationCtrl.countryStateList[index].state!;
      stateValue = int.parse(address!.stateId!);
      locationCtrl.notifyListeners();

      selectIndex = categoryList.indexWhere((element) =>
          element.toString().toLowerCase() == address!.type!.toLowerCase());
      state = locationCtrl.stateList[stateValue!];
      isCheck = address!.isPrimary == "1" ? true : false;
    } else {
      nameCtrl.text = "";

      numberCtrl.text = "";
      zipCtrl.text = locationCtrl.place!.postalCode!;
      streetCtrl.text = "";

      cityCtrl.text = locationCtrl.place!.locality!;
      isEdit = false;
      int ind = locationCtrl.countryStateList.indexWhere((element) =>
      element.name!.toLowerCase() == locationCtrl.place!.country!.toLowerCase());
      log("DDD :$ind");

      if (ind >= 0) {
        country = locationCtrl.countryStateList[ind];
        countryValue = ind;

        locationCtrl.stateList = locationCtrl.countryStateList[ind].state!;
      }
      int stateIndex = locationCtrl.stateList.indexWhere((element) =>
      element.name!.toLowerCase() ==
          locationCtrl.place!.administrativeArea!.toLowerCase());
      log("stateIndex :$stateIndex");
      if (stateIndex >= 0) {
        state = locationCtrl.stateList[stateIndex];
        stateValue = stateIndex;
      }
      notifyListeners();

      streetCtrl.text = locationCtrl.place!.street!;
     /* countryValue = locationCtrl.countryStateList[0].id!;
      int index = locationCtrl.countryStateList
          .indexWhere((element) => element.id == countryValue);
      country = locationCtrl.countryStateList[0];
      locationCtrl.stateList = locationCtrl.countryStateList[index].state!;
      stateValue = locationCtrl.stateList[0].id!;
      state = locationCtrl.stateList[0];*/
      notifyListeners();
      log("COUNTREY :$countryValue");
      log("COUNTREY :$stateValue");
    }

    notifyListeners();
  }

  isCheckBoxCheck(value) {
    isCheck = value;
    notifyListeners();
  }

  onBack() {
    streetCtrl.text = "";
    stateCtrl.text = "";
    countryCtrl.text = "";
    dialCode = "+91";
    cityCtrl.text = "";
    zipCtrl.text = "";
    nameCtrl.text = "";
    numberCtrl.text = "";
    notifyListeners();
  }

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }

  onCategory(index) {
    selectIndex = index;
    notifyListeners();
  }

  onChangeCountry(context, val,CountryStateModel c) {
    countryValue = val;
    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);
country = c;
    int index = locationCtrl.countryStateList
        .indexWhere((element) => element.id == countryValue);
    if (index >= 0) {
      locationCtrl.stateList = locationCtrl.countryStateList[index].state!;
   /*   stateValue = locationCtrl.stateList[0].id!;
      state = locationCtrl.stateList[stateValue!]*/
    }

    locationCtrl.notifyListeners();
    notifyListeners();
  }

  onChangeState(context,val,StateModel c) {
    stateValue = val;
    state = c;
    notifyListeners();
  }

  onAddLocation(context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (locationFormKey.currentState!.validate()) {
      if (isEdit) {
        editAddress(context);
      } else {
        if(country != null){
          if(state !=null){
            addAddress(context);
          }else{
            snackBarMessengers(context,message: language(context, appFonts.selectCountry));
          }
        }else{
          snackBarMessengers(context,message: language(context, appFonts.selectCountry));
        }

      }
    }
  }

  //add Address
  addAddress(context) async {

    try {
      final locationCtrl = Provider.of<LocationProvider>(context, listen: false);

      showLoading(context);
      notifyListeners();
      var body = {
        "latitude": position!.latitude,
        "longitude": position!.longitude,
        "type": categoryList[selectIndex].toString().toLowerCase(),
        "address": streetCtrl.text,
        "country_id": locationCtrl.countryStateList[countryValue!].id,
        "state_id": locationCtrl.stateList[stateValue!].id,
        "city": cityCtrl.text,
        "postal_code": zipCtrl.text,
        "alternative_name": nameCtrl.text,
        "alternative_phone": numberCtrl.text,
        "code": dialCode,
        "status":"1",
        "is_primary": isCheck ? true : false
      };

      log("body : $body");
      await apiServices
          .postApi('$apiUrl/address', body, isToken: true)
          .then((value) {
        hideLoading(context);
        log("VVVV : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          locationCtrl.getLocationList(context);
          route.pop(context);
          route.pop(context);

        } else {
          snackBarMessengers(context,
              color: appColor(context).red, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH : $e");
    }
  }

  //edit Address
  editAddress(context) async {
    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);

    showLoading(context);

    var body = {
      "latitude": position!.latitude,
      "longitude": position!.longitude,
      "type": categoryList[selectIndex].toString().toLowerCase(),
      "address": streetCtrl.text,
      "country_id": countryValue,
      "state_id": stateValue,
      "city": cityCtrl.text,
      "postal_code": zipCtrl.text,
      "alternative_name": nameCtrl.text,
      "alternative_phone": numberCtrl.text,
      "code": dialCode,
      "is_primary": isCheck ? true : false
    };
    log("ADDRESS ED :${"${api.address}/${address!.id}"}");
    log("body : $body");
    try {
      await apiServices
          .putApi("${api.address}/${address!.id}", body,
              isToken: true)
          .then((value) {
        hideLoading(context);
        log("VVVV : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          route.pop(context);
          route.pop(context);

        } else {
          snackBarMessengers(context,
              color: appColor(context).red, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH : $e");
    }
  }
}
