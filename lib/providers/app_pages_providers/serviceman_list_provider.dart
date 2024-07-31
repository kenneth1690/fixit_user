import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';

import '../../screens/app_pages_screens/serviceman_list_screen/layouts/service_filter_layout.dart';

class ServicemanListProvider with ChangeNotifier {
  List<ProviderModel> servicemanList = [];
  List<ProviderModel> searchServicemanList = [];
  int selectedIndex = 0;
  int ratingIndex = 0;
  String providerId = "0";
  List selectCategory = [];
  int yearValue = 1;
  List selectedRates = [];
  final FocusNode searchFocus = FocusNode();
  TextEditingController controller = TextEditingController();
  AnimationController? animationController;
  String? requiredServiceman;
  bool isLoading = true;

  onReady(context, TickerProvider sync) async {
    selectCategory = [];
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    log("data : $data");
    providerId = data['providerId']!.toString();
    requiredServiceman = data['requiredServiceman']?.toString();
    List<ProviderModel> serviceList =data['selectedServiceMan']  ??[];
    for(var d in serviceList){
      if (selectCategory.contains(d.id)) {
        selectCategory.remove(d.id); // unselect
      } else {
        selectCategory.add(d.id); // select
      }
    }
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();

    getServicemenByProviderId(context, providerId);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }


  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  String totalCountFilter() {

    int count = 0;
    if (selectedRates.isNotEmpty) {
      count++;
    }
    if (selectCategory.isNotEmpty) {
      count++;
    }


    return count.toString();
  }


  onTapYear(context, val) {
    yearValue = val;
    notifyListeners();
    getServicemenByProviderId(context, providerId);
  }


  void onCategorySelected(context,index,indexKey,name)async {

    
    if(int.parse(requiredServiceman ?? "1") ==1){
      final selectProvider = Provider.of<ServiceSelectProvider>(context,listen: false);
      bool isValid = await selectProvider.checkSlotAvailable(context,index,indexKey);
      if(isValid){
        selectedIndex = indexKey;  
      }else{
        snackBarMessengers(context,message: "$name is Not Available");
      }
      
    }else {
      if (selectCategory.contains(index)) {
        selectCategory.remove(index); // unselect
      } else {
        final selectProvider = Provider.of<ServiceSelectProvider>(context,listen: false);
        bool isValid = await selectProvider.checkSlotAvailable(context,index,indexKey);
        if(selectCategory.length == int.parse(requiredServiceman ?? "1")){
       //   snackBarMessengers(context,message: "Only $requiredServiceman required person");
          snackBarMessengers(context,message: "Only $requiredServiceman required person");
        }else {
log(" isValid :$isValid");
          if(isValid) {
            selectCategory.add(index); // select
          }else{
            snackBarMessengers(context,message: "$name is Not Available");
          }

        }
      }
    }


    notifyListeners();
  }

  
  
  
  
  onTapRating(id) {
    if (!selectedRates.contains(id)) {
      selectedRates.add(id);
    } else {
      selectedRates.remove(id);
    }
    notifyListeners();
    log("selectedRates ;%$selectedRates");
  }

  onTapFilter(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const ServiceFilterLayout();
      },
    );
  }

  getServicemenByProviderId(context, id, {val}) async {

    try {
      if (val == null) {
        FocusScope.of(context).requestFocus(FocusNode());
      }

      String apiUrl = "";
if (selectedRates.isNotEmpty) {
        String rate = "";
        rate = selectedRates.join(', ');

        log("rate: $rate");
        apiUrl =
            "${api.serviceman}?provider_id=$id&experience=${yearValue == 1 ? "low" : "high"}&rating=$rate";
      } else {
        apiUrl =
            "${api.serviceman}?provider_id=$id&experience=${yearValue == 1 ? "low" : "high"}&search=${controller.text}";
      }
      notifyListeners();
      await apiServices.getApi(
        apiUrl,
        [],
      ).then((value) {
        if (value.isSuccess!) {
          List data = value.data;
          log("data : $data");

          servicemanList = [];
          for (var list in data) {
            if (!servicemanList.contains(ProviderModel.fromJson(list))) {
              servicemanList.add(ProviderModel.fromJson(list));
            }
            notifyListeners();
          }

        }
        isLoading =false;
        notifyListeners();
        log("serviceManList : ${servicemanList.length}");
      });
    } catch (e) {
      log("ERRROEEE getServicemenByProviderId : $e");
      notifyListeners();
    }
  }

  clearTap(context) {
    selectedRates = [];
    yearValue = 1;
    notifyListeners();
    animationController!.dispose();
    route.pop(context);
    getServicemenByProviderId(context, providerId,);
  }

  applyTap(context) {
    route.pop(context);
    getServicemenByProviderId(context, providerId);
  }

  onSaveTap(context) {
    List<ProviderModel> selectedProvider = [];
    log("selectCategory:$selectCategory");
    if(selectCategory.isNotEmpty) {
      servicemanList
          .asMap()
          .entries
          .forEach((element) {
        if (selectCategory.contains(element.value.id)) {
          if (!selectedProvider.contains(element.value)) {
            selectedProvider.add(element.value);
          }
        }
      });
    }else{
      if (!selectedProvider.contains(servicemanList[selectedIndex])) {
        selectedProvider.add(servicemanList[selectedIndex]);
      }
    }

    log("selectedProvider : ${selectedProvider.length}");
    notifyListeners();
    route.pop(context,arg: selectedProvider);
  }
}
