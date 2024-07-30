import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/screens/app_setting_screen/layouts/currency_bottomsheet.dart';
import 'package:fixit_user/screens/app_setting_screen/layouts/theme_layout.dart';

class AppSettingProvider with ChangeNotifier {
  int selectIndex = 0;
  final SharedPreferences sharedPreferences;

  AppSettingProvider(this.sharedPreferences);

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }


  showLayout(context) async {
    showDialog(
      context: context,
      builder: (context1) {
        return const AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: Insets.i20),
          shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(SmoothRadius(
                  cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
          content: ThemeSelect(),
        );
      },
    );
  }

  onTapData(context, index) {
    log("dsf");
    if(index ==0){
      showLayout(context);
     // showDialog(context: context, builder: (context) => AlertDialog(content: ,),);
    }else
    if (index == 1) {
      currencyBottomSheet(context);
    } else if (index == 2) {
      route.pushNamed(context, routeName.changeLanguage);
    } else if (index == 3) {
      route.pushNamed(context, routeName.changePass);
    }
  }

  onChangeButton(index) async {
    selectIndex = index;
    notifyListeners();
  }

  onUpdate(context,CurrencyModel data) {
    currency(context).priceSymbol = data.symbol.toString();
    final currencyData =
    Provider.of<CurrencyProvider>(context, listen: false);
    currencyData.currency = data;
    currencyData.currencyVal = double.parse(data.exchangeRate!);

    currencyData.notifyListeners();
    route.pop(context);
  }

  currencyBottomSheet(context) {

    final dash = Provider.of<DashboardProvider>(context,listen: false);
    log("VURE :${currency(context).currency}");
    if(currency(context).currency != null) {
      selectIndex = dash.currencyList.indexWhere((element) => element.symbol ==
          currency(context).currency!.symbol);
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context2) {
          return const CurrencyBottomSheet();
        },
      );
    }else{
      selectIndex =0;
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context2) {
          return const CurrencyBottomSheet();
        },
      );
    }
  }
}
