import 'dart:developer';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/models/blog_model.dart';
import 'package:fixit_user/models/booking_status_model.dart';
import 'package:fixit_user/models/coupon_model.dart';
import 'package:fixit_user/models/currency_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../config.dart';
import '../../widgets/alert_message_common.dart';

class FeaturedServiceProvider with ChangeNotifier {
  List<Services> featuredServiceList = [];
  List<Services> searchList = [];
  final FocusNode searchFocus = FocusNode();
  TextEditingController txtFeaturedSearch = TextEditingController();
  final PagingController<int, Services> pagingController =
      PagingController(firstPageKey: 1);
  AnimationController? animationController;

  //featured package list
  getFeaturedPackage() async {
    String apiLink = "";
    if (txtFeaturedSearch.text.isNotEmpty) {
      apiLink = "${api.featuredServices}?search=${txtFeaturedSearch.text}";
    } else {
      apiLink = api.featuredServices;
    }
    try {
      await apiServices.getApi(apiLink, []).then((value) {
        if (value.isSuccess!) {
          List service = value.data;
          searchList = [];
          for (var data in service.reversed.toList()) {
            if (!searchList.contains(Services.fromJson(data))) {
              searchList.add(Services.fromJson(data));
            }
            notifyListeners();
          }
          notifyListeners();
        } else {
          searchList = [];
          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onBack(context,isBack){
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage();
    if(isBack){
      route.pop(context);
    }
  }

  onReady(context, TickerProvider sync) async {
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();
  }

  Future<List<Services>> fetchData(context) async {
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    return dash.featuredServiceList;
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }



  onFeatured(context, Services? services, id,
      {inCart, isSearch = false}) async {
    if (inCart) {
      route.pop(context);
      route.pushNamed(context, routeName.cartScreen);
    } else {

      final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
      providerDetail.selectProviderIndex = 0;
      providerDetail.notifyListeners();
      onBook(context, services!,

              addTap: () => onAdd(context, id, isSearch: isSearch),
              minusTap: () => onRemoveService(context, id, isSearch: isSearch))!
          .then((e) {
        searchList[id].selectedRequiredServiceMan =
            searchList[id].requiredServicemen;
        notifyListeners();
      });
    }
  }

  onRemoveService(context, index, {isSearch = false}) async {
    if (isSearch) {
      if ((searchList[index].selectedRequiredServiceMan!) == 1) {
        route.pop(context);
        isAlert = false;
        notifyListeners();
      } else {
        if ((searchList[index].requiredServicemen!) ==
            (searchList[index].selectedRequiredServiceMan!)) {
          isAlert = true;
          notifyListeners();
          await Future.delayed(DurationClass.s3);
          isAlert = false;
          notifyListeners();
        } else {
          isAlert = false;
          notifyListeners();
          searchList[index].selectedRequiredServiceMan =
              ((searchList[index].selectedRequiredServiceMan!) - 1)
                  ;
        }
      }
    } else {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.onRemoveService(context, index);
      dash.notifyListeners();
    }
    notifyListeners();
  }

  onAdd(context, index, {isSearch = false}) {
    isAlert = false;
    notifyListeners();
    if (isSearch) {
      int count = (searchList[index].selectedRequiredServiceMan!);
      count++;
      searchList[index].selectedRequiredServiceMan = count;
    } else {
      final dash = Provider.of<DashboardProvider>(context, listen: false);
      dash.onAdd(index);
      dash.notifyListeners();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController!.dispose();
    super.dispose();
  }
}
