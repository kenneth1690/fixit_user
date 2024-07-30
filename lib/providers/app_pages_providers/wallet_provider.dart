import 'dart:convert';
import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:fixit_user/models/app_setting_model.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';

import '../../screens/app_pages_screens/wallet_balance_screen/layouts/add_money_layout.dart';
import '../../screens/bottom_screens/cart_screen/layouts/service_detail_layout.dart';

class WalletProvider with ChangeNotifier {
  List<WalletList> walletList = [];
  String? wallet;
  UserModel? userModel;
  List<PaymentMethods> paymentList = [];
  SharedPreferences? preferences;
  double balance = 0.0;
  bool isGuest =false;


  TextEditingController moneyCtrl = TextEditingController();
  final FocusNode moneyFocus = FocusNode();

  onTapGateway(val) {
    wallet = val;
    notifyListeners();
    log("WALLL :#$wallet");
  }

  onAddMoney(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context2) {
        return AddMoneyLayout(buildContext: context);
      },
    ).then((value)async {
      final commonApi =
      Provider.of<CommonApiProvider>(context, listen: false);
      await commonApi.selfApi(context);

      getWalletList();
    });
  }

  getUserDetail(context) async {
    preferences = await SharedPreferences.getInstance();

     isGuest = preferences!.getBool(session.isContinueAsGuest) ?? false;
    //Map user = json.decode(preferences!.getString(session.user)!);
    userModel =
        UserModel.fromJson(json.decode(preferences!.getString(session.user)!));
    if(paymentMethods.isNotEmpty) {
      paymentList = paymentMethods;
    }else{
      final common = Provider.of<CommonApiProvider>(context,listen: false);
    await  common.getPaymentMethodList(context);
      paymentList = paymentMethods;
    }
    log("paymentList L${paymentList.length}");
    paymentList.removeWhere((element) => element.slug == "cash");
    wallet = paymentList[0].slug;
    log("paymentList SS${paymentList.length}");
    log("paymentList SS${paymentMethods.length}");
    if(walletList.isEmpty) {
      getWalletList();
    }
    notifyListeners();
  }

  getWalletList() async {
    try {
      await apiServices
          .getApi(api.wallet, [], isToken: true, isData: true)
          .then((value) {
        if (value.isSuccess!) {
          log("WALLLL :${value.data}");
          balance = double.parse(value.data['balance'].toString());
          walletList = [];
          for (var data in value.data['transactions']['data']) {
            walletList.add(WalletList.fromJson(data));
          }
          notifyListeners();
        }
      });
    } catch (e) {
      log("ERRROEEE getProviderById wallet: $e");
      notifyListeners();
    }
  }

  //add to wallet
  addToWallet(context1,context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    route.pop(context);
    showLoading(context);
    notifyListeners();
    try {
      var body = {
        "amount": moneyCtrl.text,
        "payment_method": wallet,
        "type": "wallet"
      };

      notifyListeners();
      log("checkoutBody: $body");
      await apiServices
          .postApi(api.addMoneyToWallet, body, isData: true, isToken: true)
          .then((value) async {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          moneyCtrl.text = "";
          wallet = paymentList[0].slug;
          notifyListeners();
          route
              .pushNamed(context, routeName.checkoutWebView, arg: value.data)
              .then((e) async {
            log("SSS :$e");
            if (e != null) {

              if (e['isVerify'] == true) {
                await getWalletList();
                await getVerifyPayment(value.data['item_id'], context);


              }
            }
          });
          notifyListeners();
        } else {
          snackBarMessengers(context, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
    }
  }

  //verify payment
  getVerifyPayment(data, context) async {
    try {

      await apiServices
          .getApi("${api.verifyPayment}?item_id=$data&type=wallet", {},
              isToken: true, isData: true)
          .then((value) {
            log("VGHDGHSD : ${value.message}");
        if (value.isSuccess!) {
          if (value.data["payment_status"].toString().toLowerCase() ==
              "pending") {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(language(context, appFonts.yourPaymentIsDeclined)),
              backgroundColor: appColor(context).red,
            ));
          } else {
            getWalletList();
          }
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }
}
