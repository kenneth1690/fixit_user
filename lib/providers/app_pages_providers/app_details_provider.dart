import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/pages_model.dart';
import 'package:fixit_user/screens/app_pages_screens/app_details_screen/layouts/page_detail.dart';

class AppDetailsProvider with ChangeNotifier {
  List<PagesModel> pageList = [];

  onTapOption(data, context) {
    log("TITLE : $data");
    if (data!.title!.toString().toLowerCase() == appFonts.helpSupport) {
      route.pushNamed(context, routeName.helpSupport);
    } else {
        route.push(
            context,
            PageDetail(
              page: data,
            ));

    }
  }

//get page list api
  getAppPages() async {
    try {
      await apiServices.getApi(api.page, []).then((value) {
        if (value.isSuccess!) {
          List page = value.data;
          pageList =[];
          page.asMap().forEach((key, value) {
             pageList.add(PagesModel.fromJson(value));
          });
          pageList = pageList.reversed.toList();
          notifyListeners();

        }
      });
    } catch (e) {
      log("EEEE getAppPages : $e");
      notifyListeners();

    }
  }
}
