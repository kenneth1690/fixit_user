import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';

class CurrencyProvider with ChangeNotifier {


  CurrencyModel? currency;
  double currencyVal =
      double.parse(appArray.currencyList[0]["USD"].toString()).roundToDouble();
  String priceSymbol = "\$";

  setVal() {
    priceSymbol = currency!.symbol!;
   /* log("CCC : $currency");
    if (currency["title"] == appFonts.usDollar) {
      currencyVal =
          double.parse(currency["USD"].toString())
              .roundToDouble();
    } else if (currency["title"] == appFonts.euro) {
      currencyVal =
          double.parse(currency["EUR"].toString())
              .roundToDouble();
    } else if (currency["title"] == appFonts.inr) {
      currencyVal =
          double.parse(currency["INR"].toString())
              .roundToDouble();
    } else {
      currencyVal =
          double.parse(currency["POU"].toString())
              .roundToDouble();
    }
*/
    //  currencyVal =   double.parse(currency["code"].toString());
    notifyListeners();
  }
}
