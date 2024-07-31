import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../config.dart';
import '../../utils/date_time_picker.dart';

class ServiceSelectProvider with ChangeNotifier {
  bool isStep2 = false, isPackage = false, isBottom = true;
  Services? servicesCart;
  PrimaryAddress? address;
  int selectProviderIndex = 0;
  UserModel? userModel;
  final FocusNode noteFocus = FocusNode();
  TextEditingController txtNote = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void listen() {
    if (scrollController.position.pixels >= 100) {
      hide();
      log("scrollController.position.pixels${scrollController.position.pixels}");
      notifyListeners();
    } else {
      show();
      log("scrollController.position.pixels${scrollController.position.pixels}");
      notifyListeners();
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

  addToCart(context) async {
    debugPrint(":::;Serr :${servicesCart!.selectedServiceMan}");
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
    notifyListeners();
    route.pushNamed(context, routeName.cartScreen);
  }

  onNext(context) {
    if ((servicesCart!.selectedRequiredServiceMan!) ==
        (servicesCart!.selectedServiceMan != null
            ? servicesCart!.selectedServiceMan!.length
            : 1)) {
      servicesCart!.selectServiceManType = "as_per_my_choice";
     if(address != null){
       if (servicesCart!.serviceDate != null) {
         if (servicesCart!.selectedServiceMan != null &&
             servicesCart!.selectedServiceMan!.isNotEmpty) {
           if (isPackage) {
             isStep2 = false;
             notifyListeners();
             final packageCtrl =
             Provider.of<SelectServicemanProvider>(context, listen: false);
             servicePackageList[selectProviderIndex] = servicesCart!;

             route.pop(context, arg: servicesCart);
           } else {
             isStep2 = true;
           }
         } else {
           snackBarMessengers(context,
               message: "Please select Any 1 serviceman",
               color: appColor(context).red);
         }
       } else {
         snackBarMessengers(context,
             message: "Please select Date/Time slot",
             color: appColor(context).red);
       }
     } else {
       snackBarMessengers(context,
           message: "Please select Date/Time slot",
           color: appColor(context).red);
     }
    } else {
      Fluttertoast.showToast(msg: "Please Select 1 more required serviceman");
      //snackBar(context,content: Text( "Please Select 1 more required serviceman"));
    }
    notifyListeners();
  }

  onInit(context) async {
    showLoading(context);

    scrollController.addListener(listen);
    isStep2 = false;
    log("Dsdgfh :$servicesCart");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    notifyListeners();
    /*  dynamic data = ModalRoute.of(context)!.settings.arguments;
    servicesCart = data['selectServicesCart'];
    servicesCart!.selectedRequiredServiceMan =
        servicesCart!.requiredServicemen ?? "1";
    isPackage = data['isPackage'] ?? false;
    selectProviderIndex = data['selectProviderIndex'] ?? 0;*/
    dynamic data = ModalRoute.of(context)!.settings.arguments;

    servicesCart = data['selectServicesCart'];
    log("data : ${servicesCart!.selectServiceManType}");
    servicesCart!.selectedRequiredServiceMan =
        servicesCart!.selectedRequiredServiceMan ?? 1;
    isPackage = data['isPackage'] ?? false;
    selectProviderIndex = data['selectProviderIndex'] ?? 0;
    notifyListeners();
    final locationCtrl = Provider.of<LocationProvider>(context, listen: false);
    if (locationCtrl.addressList.isNotEmpty) {
      int index = locationCtrl.addressList
          .indexWhere((element) => element.isPrimary == 1);
      if (index > 0) {
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
    log("CHECK : #$isPackage");
    hideLoading(context);

    userModel =
        UserModel.fromJson(json.decode(preferences.getString(session.user)!));
    notifyListeners();
  }

  onChangeLocation(context, PrimaryAddress primaryAddress) {
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

  Future<bool> checkSlotAvailable(context, id, indexKey) async {
    bool isValid = false;
    if (servicesCart!.serviceDate != null) {
      try {
        var data = {
          "provider_id": 4,
          "dateTime":
              "${DateFormat("dd-MMM-yyy,hh:mm").format(servicesCart!.serviceDate!)} ${DateFormat("aa").format(servicesCart!.serviceDate!).toLowerCase()}"
        };

        log("data : $data");
        await apiServices
            .getApi(api.isValidTimeSlot, data, isData: true, isToken: true)
            .then((value) async {
          if (value.isSuccess!) {
            log("DDAA `:${value.data}");
            if (value.data['isValidTimeSlot'] == true) {
              isValid = true;
              return true;
            }
            notifyListeners();
          } else {
            isValid = false;
            notifyListeners();
            snackBarMessengers(context, message: value.message);
            return false;
          }
        });
      } catch (e) {
        isValid = false;
        notifyListeners();
        return false;
      }
    } else {
      isValid = false;
      notifyListeners();
      snackBarMessengers(context, message: "Please Select Date and Time");
      return false;
    }
    return isValid;
  }

  onTapDate(context) {
    debugPrint("servicesCart :${servicesCart!.selectServiceManType}");
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context3) {
          return DateTimePicker(
            isService: isPackage,
            service: servicesCart,
            selectProviderIndex: selectProviderIndex,
          );
        }).then((value) {
      if (value != null) {
        log("SSSS:$value");
        notifyListeners();
        if (isPackage) {
          final packageCtrl =
              Provider.of<SelectServicemanProvider>(context, listen: false);
          servicesCart = value;
          servicePackageList[selectProviderIndex] = servicesCart!;
          servicePackageList[selectProviderIndex].serviceDate =
              servicesCart!.serviceDate;
          servicePackageList[selectProviderIndex].selectDateTimeOption =
              "custom";
          servicePackageList[selectProviderIndex].selectedDateTimeFormat =
              servicesCart!.selectedDateTimeFormat;
          notifyListeners();
          packageCtrl.notifyListeners();
        } else {
          servicesCart = value;
          notifyListeners();
        }
      }
    });
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
}
