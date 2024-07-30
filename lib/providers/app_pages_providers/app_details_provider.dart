import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/pages_model.dart';
import 'package:fixit_user/screens/app_pages_screens/app_details_screen/layouts/page_detail.dart';

class AppDetailsProvider with ChangeNotifier {

  List<PagesModel> pageList =[];

   onTapOption(data,context) {
     log("TITLE : $data");
     if (data["title"] == appFonts.helpSupport) {
       route.pushNamed(context, routeName.helpSupport);
     }else {
       log("pageList : ${pageList.length}");
       int index = pageList.indexWhere((element) {
log("DDDDD :${element.title!.replaceAll(' ', '').toLowerCase()}");
         return element.title!.replaceAll(' ', '').toLowerCase() ==
             data['title'].toString().toLowerCase();
       });
       log('INDEX : $index');
       if (index >= 0) {
         route.push(context, PageDetail(page: pageList[index],));
       }
     }
   }

//get page list api
   getAppPages()async{
     try {
       await apiServices.getApi(api.page, []).then((value) {
         if (value.isSuccess!) {

          List page = value.data;
          page.asMap().forEach((key, value) {
            pageList.add(PagesModel.fromJson(value));
          });
           notifyListeners();
         }
       });
     } catch (e) {
       notifyListeners();
     }
   }
}