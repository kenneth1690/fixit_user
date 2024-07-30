import 'dart:developer';

import 'package:fixit_user/models/blog_model.dart';
import 'package:fixit_user/models/booking_status_model.dart';
import 'package:fixit_user/models/coupon_model.dart';
import 'package:fixit_user/models/currency_model.dart';

import '../../config.dart';

class ExpertServiceProvider with ChangeNotifier {
  final FocusNode searchFocus = FocusNode();
  List<ProviderModel> searchList = [];
  AnimationController? animationController;
  TextEditingController txtFeaturedSearch = TextEditingController();

  onReady(context, TickerProvider sync) async {

    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();

  }

  Future<List<ProviderModel>> fetchData(context)async{
    final dash = Provider.of<DashboardProvider>(context,listen: false);
    return dash.highestRateList;
  }


  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }


  //featured package list
  getFeaturedPackage() async {

    String apiLink = "";
    if (txtFeaturedSearch.text.isNotEmpty) {
      apiLink = "${api.highestRating}?search=${txtFeaturedSearch.text}";
    } else {
      apiLink = api.highestRating;
    }
    try {
      await apiServices
          .getApi(apiLink, [], isData: true, isMessage: true)
          .then((value) {
        if (value.isSuccess!) {
          List service = value.data;
          searchList = [];
          for (var data in service.reversed.toList()) {
            if (!searchList.contains(ProviderModel.fromJson(data))) {
              searchList.add(ProviderModel.fromJson(data));
            }
            notifyListeners();
          }
          notifyListeners();
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }

  onBack() {
    txtFeaturedSearch.text = "";
    searchList = [];
    notifyListeners();
    getFeaturedPackage();
  }
}
