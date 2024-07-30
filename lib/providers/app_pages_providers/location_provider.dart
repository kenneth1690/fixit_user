import 'dart:developer';
import 'package:fixit_user/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../screens/app_pages_screens/current_location_screen/layouts/google.dart';
import '../../widgets/alert_message_common.dart';
import 'dart:ui' as ui;

class LocationProvider with ChangeNotifier {
  AnimationController? animationController;
  bool isPositionedRight = false;
  bool isAnimateOver = false, isBottom = true;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  PrimaryAddress? address;
  double? newLog, newLat;
  int primaryAddress = 0;
  CameraPosition? cameraPosition;
  Set<Marker> markers = {};
  Position? position1;
  GoogleMapController? mapController;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  List<PrimaryAddress> addressList = [];
  Placemark? place;
  bool isEdit = false, isButtonShow = false;
  int count = 0;
  int? selectedIndex;

  dynamic argumentData;
  List<CountryStateModel> countryStateList = [];
  List<StateModel> stateList = [];
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  searchLocation(context) {
    route.push(context, const SearchLocation()).then((e) async {
      if (e != null) {
        log("GET :$e");
        position = e;
        notifyListeners();
        getAddressFromLatLng(context);
      }
    });
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

  void updatePosition(CameraPosition _position) {
    log("POS :$_position");
    position = LatLng(_position.target.latitude, _position.target.longitude);
    // / getAddressFromLatLng();
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

  onController(controller) {
    mapController = controller;
    notifyListeners();
  }

  onAnimate(TickerProvider sync) async {
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  selectAddress(ind) {
    selectedIndex = ind;
    notifyListeners();
  }

  // created method for getting user current location
  getUserCurrentLocation(context, {isRoute = false}) async {
    Geolocator.requestPermission().then((value) async {
      position1 = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      position = LatLng(position1!.latitude, position1!.longitude);
      notifyListeners();
      getAddressFromLatLng(context);
      if (isRoute) {
        route.pushNamed(context, routeName.currentLocation);
      }
      log("POS :$position");
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      log("ERROR $error");
    });
  }

  fetchCurrent(context) async {
    newLat = null;
    newLog = null;
    notifyListeners();
    getUserCurrentLocation(context);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  getAddressFromLatLng(context) async {

    await placemarkFromCoordinates(
        newLat ?? position!.latitude, newLog ?? position!.longitude)
        .then((List<Placemark> placeMarks) async {
      log("placeMarks :$placeMarks");
      place = placeMarks[0];
      markers = {};
      final Uint8List markerIcon =
      await getBytesFromAsset(eImageAssets.pin, 150);
      currentAddress = '${place!.name}';
      street = '${place!.street}';
      log("currentAddresscurrentAddress:$currentAddress");

      street =
      '${place!.name}, ${place!.street}, ${place!.subLocality}, ${place!.postalCode}';
      markers.add(Marker(
        draggable: true,
        onDrag: (value) {
          log("LAT : ${value.latitude} // LONG : ${value.longitude}");
          mapController!.animateCamera(
              CameraUpdate.newLatLng(LatLng(value.latitude, value.longitude)));
          notifyListeners();
        },
        onDragEnd: (value) {
          newLat = value.latitude;
          newLog = value.longitude;
          position = LatLng(value.latitude, value.longitude);
          if (newLat != null && newLog != null) {
            getAddressFromLatLng(context);
          }
          notifyListeners();
        },
        markerId: MarkerId(
            LatLng(newLat ?? position!.latitude, newLog ?? position!.longitude)
                .toString()),
        position:
        LatLng(newLat ?? position!.latitude, newLog ?? position!.longitude),
        infoWindow: InfoWindow(title: place!.name, snippet: place!.subLocality),
        icon: BitmapDescriptor.fromBytes(markerIcon),
      ));
      if (mapController != null) {
        mapController!.animateCamera(CameraUpdate.newLatLng(
            LatLng(position!.latitude, position!.longitude)));
      }
      notifyListeners();
      log("NEW : ${position!.latitude}/ ${position!.longitude}");
    }).catchError((e) {
      debugPrint("ee : $e");
    });

  }

  getLocationList(context) async {
    log("PPPP:$position");

    notifyListeners();
    try {
      await apiServices.getApi(api.address, [], isToken: true).then((value) {
        if (value.isSuccess!) {
          List address = value.data['data'];
          addressList = [];

          for (var data in address.reversed.toList()) {
            if (!addressList.contains(PrimaryAddress.fromJson(data))) {
              addressList.add(PrimaryAddress.fromJson(data));
            }
            notifyListeners();
          }
          notifyListeners();
        }
      });
        getDefaultAddress(context);
    } catch (e) {
      notifyListeners();
    }
  }

  getDefaultAddress(context) async {
    int index = addressList.indexWhere((element) => element.isPrimary == "1");
    log("index :$index");
    if (index >= 0) {
      primaryAddress = index;
      setPrimaryAddress = index;
      userPrimaryAddress = addressList[primaryAddress];
    } else {
      primaryAddress = 0;
      setPrimaryAddress = null;
      userPrimaryAddress = null;
      currentAddress = null;
    }

    notifyListeners();
    log("userPrimaryAddress : $userPrimaryAddress");

    if (index >= 0) {

      if(addressList[primaryAddress].latitude != null) {
        position = LatLng(double.parse(addressList[primaryAddress].latitude!),
            double.parse(addressList[primaryAddress].longitude!));
        notifyListeners();
      }
      //getAddressFromLatLng(context);
    } else {}
  }

//zone id
  getZoneId() async {
    log("position getZoneId:$position");
    try {
      await apiServices
          .getApi(
              "${api.zoneByPoint}?lat=${position!.latitude}&lng=${position!.longitude}",
              [],
              isData: true)
          .then((value) async {
        log("CALUE :${value.data}");
        if (value.isSuccess!) {
          List o = value.data['data'];
          String idsString = o.map((obj) => obj['id'].toString()).join(',');
          zoneIds = idsString;
          log("string :$idsString");
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(session.zoneIds, idsString);
          notifyListeners();
        }
        notifyListeners();
      });
    } catch (e) {
      log("EEEE getZoneId :: $e");
      notifyListeners();
    }
  }

  setDefault(context) {
    primaryAddress = selectedIndex!;
    log("primaryAddress :$primaryAddress");
    log("primaryAddress :${addressList[primaryAddress].address}");
    userPrimaryAddress = addressList[primaryAddress];
    street = addressList[primaryAddress].address;
    currentAddress = addressList[primaryAddress].address;
    log("street :$street");
    setPrimaryAddress = selectedIndex;
    notifyListeners();
    setAddressPrimary(context, userPrimaryAddress!.id);
    if(addressList[primaryAddress].latitude != null) {
      position = LatLng(double.parse(addressList[primaryAddress].latitude!),
          double.parse(addressList[primaryAddress].longitude!));
    }
    notifyListeners();
    //getAddressFromLatLng();
    route.pop(context);
    getZoneId();
  }

  //set primary address
  setAddressPrimary(context, id) async {
    try {
      await apiServices
          .putApi("${api.setAddressPrimary}/$id", [], isToken: true)
          .then((value) {
        log("setAddressPrimary : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {}
      });
    } catch (e) {
      log("CATCH setAddressPrimary: $e");
    }
  }

  // country state list
  getCountryState() async {
    countryStateList = [];
    notifyListeners();
    try {
      await apiServices.getApi(api.country, []).then((value) {
        if (value.isSuccess!) {
          List co = value.data;
          log("COUNRY :${co.length}");
          for (var data in value.data) {
            if (!countryStateList.contains(CountryStateModel.fromJson(data))) {
              countryStateList.add(CountryStateModel.fromJson(data));
            }
            notifyListeners();
          }

          stateList = countryStateList[0].state!;

          notifyListeners();
        }
      });
    } catch (e) {
      log("ERRROEEE getCountryState $e");
      notifyListeners();
    }
  }

  //delete Address
  deleteAddress(context, id, {isBack = false}) async {
    showLoading(context);
    route.pop(context);
    log("ADDRESS ID : ${api.address}/$id");

    try {
      await apiServices
          .deleteApi("${api.address}/$id", {}, isToken: true)
          .then((value) {
        hideLoading(context);
        log("VVVV : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          completeSuccess(context, isBack);
          getLocationList(context);
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

  deleteAccountConfirmation(context, sync, id, {isBack = false}) {
    animateDesign(sync);
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<LocationProvider>(
                builder: (context3, value, child) {
              return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  insetPadding:
                      const EdgeInsets.symmetric(horizontal: Insets.i20),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.all(SmoothRadius(
                          cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
                  backgroundColor: appColor(context).whiteBg,
                  content: Stack(alignment: Alignment.topRight, children: [
                    Column(mainAxisSize: MainAxisSize.min, children: [
                      // Gif
                      Stack(alignment: Alignment.topCenter, children: [
                        Stack(alignment: Alignment.topCenter, children: [
                          SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        SizedBox(
                                            height: Sizes.s180,
                                            width: Sizes.s150,
                                            child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                curve: isPositionedRight
                                                    ? Curves.bounceIn
                                                    : Curves.bounceOut,
                                                alignment: isPositionedRight
                                                    ? Alignment.center
                                                    : Alignment.topCenter,
                                                child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    height: 40,
                                                    child: Image.asset(
                                                        eImageAssets
                                                            .locationColor)))),
                                        Image.asset(eImageAssets.dustbin,
                                                height: Sizes.s88,
                                                width: Sizes.s88)
                                            .paddingOnly(bottom: Insets.i24)
                                      ]))
                              .decorated(
                                  color: appColor(context).fieldCardBg,
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r10)),
                        ]),
                        if (offsetAnimation != null)
                          SlideTransition(
                              position: offsetAnimation!,
                              child: (offsetAnimation != null &&
                                      isAnimateOver == true)
                                  ? Image.asset(eImageAssets.dustbinCover,
                                      height: 38)
                                  : const SizedBox())
                      ]),
                      // Sub text
                      const VSpace(Sizes.s15),
                      Text(
                          language(
                              context, appFonts.deleteLocationSuccessfully),
                          textAlign: TextAlign.center,
                          style: appCss.dmDenseRegular14
                              .textColor(appColor(context).lightText)
                              .textHeight(1.2)),
                      const VSpace(Sizes.s20),
                      Row(children: [
                        Expanded(
                            child: ButtonCommon(
                                onTap: () => route.pop(context),
                                title: appFonts.no,
                                borderColor: appColor(context).primary,
                                color: appColor(context).whiteBg,
                                style: appCss.dmDenseSemiBold16
                                    .textColor(appColor(context).primary))),
                        const HSpace(Sizes.s15),
                        Expanded(
                            child: ButtonCommon(
                          title: appFonts.yes,
                          color: appColor(context).primary,
                          onTap: () => deleteAddress(context, id),
                          style: appCss.dmDenseSemiBold16
                              .textColor(appColor(context).whiteColor),
                        ))
                      ])
                    ]).padding(
                        horizontal: Insets.i20,
                        top: Insets.i60,
                        bottom: Insets.i20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(language(context, appFonts.deleteLocation),
                              style: appCss.dmDenseExtraBold18
                                  .textColor(appColor(context).darkText)),
                          Icon(CupertinoIcons.multiply,
                                  size: Sizes.s20,
                                  color: appColor(context).darkText)
                              .inkWell(onTap: () => route.pop(context))
                        ]).paddingAll(Insets.i20)
                  ]));
            });
          });
        }).then((value) {
      isPositionedRight = false;
      isAnimateOver = false;
      notifyListeners();
    });
  }

  animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.s1).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.ms150).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 0.88))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  onLocationInit(context) async {
    argumentData = null;
    log("CALL :: $count");
    scrollController.addListener(listen);
    position = null;
    count++;
    notifyListeners();
    argumentData = ModalRoute.of(context)!.settings.arguments;
    currentAddress = "";
    if (argumentData != null) {
      var arg = argumentData['data'];
      isEdit = true;
      address = arg;
      log("LAT : ${address!.latitude}// ${address!.longitude}");

      position = LatLng(
          double.parse(address!.latitude!), double.parse(address!.longitude!));

      log("ARGH :$position");
      notifyListeners();

     // getAddressFromLatLng();
      notifyListeners();
    } else {
      log("ISSSS");
      getUserCurrentLocation(context);
      isEdit = false;
      notifyListeners();
    }
  }

  onReady(context) {
    dynamic arg = ModalRoute.of(context)!.settings.arguments ?? false;
    isButtonShow = arg;
    notifyListeners();
  }

  onBack() {
    selectedIndex = null;
    notifyListeners();
  }

  completeSuccess(context, isBack) {
    showCupertinoDialog(
      context: context,
      builder: (context1) {
        return AlertDialogCommon(
          title: appFonts.successfullyDelete,
          height: Sizes.s140,
          image: eGifAssets.successGif,
          subtext: language(context, appFonts.locationDeletedSuccessfully),
          bText1: language(context, appFonts.okay),
          b1OnTap: () {
            if (isBack) {
              route.pop(context);
              route.pop(context);
            } else {
              route.pop(context);
            }
          },
        );
      },
    );
  }
}
