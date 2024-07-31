import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit_user/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:share_plus/share_plus.dart';

class ProfileProvider with ChangeNotifier {
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;

  SharedPreferences? preferences;
  List<ProfileModel> profileLists = [];
  bool isPositionedRight = false;
  bool isAnimateOver = false, isGuest = false;

  onFloatImage() {
    notifyListeners();
  }

  onAnimate() async{
    preferences = await SharedPreferences.getInstance();
    isGuest  = preferences!.getBool(session.isContinueAsGuest) ?? false;
    if(isGuest){
      profileLists =
          appArray.guestProfileList.map((e) => ProfileModel.fromJson(e)).toList();
    }else {
      profileLists =
          appArray.profileList.map((e) => ProfileModel.fromJson(e)).toList();
      getUserDetail();
    }

  }

  getUserDetail() async {
    preferences = await SharedPreferences.getInstance();
    isGuest  = preferences!.getBool(session.isContinueAsGuest) ?? false;
    //Map user = json.decode(preferences!.getString(session.user)!);
    if(!isGuest){
      userModel =
          UserModel.fromJson(
              json.decode(preferences!.getString(session.user)!));
    }

    notifyListeners();
  }

  animateDesign(TickerProvider sync) {
    Future.delayed(DurationClass.s1).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(DurationClass.s2).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 1.7))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  onTapOption(data, context, controller, sync) {

    if (data.title == appFonts.favouriteList) {
      if(isGuest){
        route.pushAndRemoveUntil(context);
      }else {
        route.pushNamed(context, routeName.favoriteList);
      }
    } else if (data.title == appFonts.manageLocations) {
      if(isGuest){
        route.pushAndRemoveUntil(context);
      }else {
        route.pushNamed(context, routeName.myLocation);
      }
    } else if (data.title == appFonts.myReviews) {
      if(isGuest){
        route.pushAndRemoveUntil(context);
      }else {
      route.pushNamed(context, routeName.review);
      }
    } else if (data.title == appFonts.appDetails) {
      route.pushNamed(context, routeName.appDetails);
    } else if (data.title == appFonts.rateUs) {
      if(isGuest){
        route.pushAndRemoveUntil(context);
      }else {
        route.pushNamed(context, routeName.rateApp);
      }
    }  else if (data.title == appFonts.chatHistory) {
      if(isGuest){
        route.pushAndRemoveUntil(context);
      }else {
        final chat = Provider.of<ChatHistoryProvider>(context, listen: false);
        chat.onReady(context);

        route.pushNamed(context, routeName.chatHistory);
      }
    } else if (data.title == appFonts.logOut) {
      logoutConfirmation(context);


    } else if (data.title == appFonts.shareApp) {
      Share.share('Download the Fixit User App for get better services at home.\n\nhttps://play.google.com/store/apps/details?id=com.webiots.fixituserapi');

    } else if (data.title == appFonts.deleteAccount) {
      animateDesign(sync);
      showDialog(
          context: context,
          builder: (context1) {
            return StatefulBuilder(builder: (context2, setState) {
              return Consumer<ProfileProvider>(
                  builder: (context3, value, child) {
                return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppRadius.r14))),
                    backgroundColor: appColor(context).whiteBg,
                    content: Stack(alignment: Alignment.topRight, children: [
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        // Gif
                        Stack(alignment: Alignment.topCenter, children: [
                          Stack(alignment: Alignment.bottomCenter, children: [
                            SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                        alignment: Alignment.center,
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
                                                      ? isAnimateOver
                                                          ? Alignment.center
                                                          : Alignment.topCenter
                                                      : Alignment.centerLeft,
                                                  child: AnimatedContainer(
                                                      duration: const Duration(
                                                          milliseconds: 200),
                                                      height: isPositionedRight
                                                          ? 88
                                                          : 13,
                                                      child: Image.asset(
                                                          eImageAssets
                                                              .accountDel)))),
                                          Image.asset(eImageAssets.dustbin,
                                              height: Sizes.s88,
                                              width: Sizes.s88)
                                        ]))
                                .paddingOnly(top: 50)
                                .decorated(
                                    color:
                                        appColor(context).fieldCardBg,
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
                        Text(language(context, appFonts.yourAccountWill),
                            textAlign: TextAlign.center,
                            style: appCss.dmDenseRegular14
                                .textColor(appColor(context).lightText)
                                .textHeight(1.2)),
                        const VSpace(Sizes.s20),
                        Row(children: [
                          Expanded(
                              child: ButtonCommon(
                                  onTap: () => route.pop(context),
                                  title: appFonts.cancel,
                                  borderColor: appColor(context).red,
                                  color: appColor(context).whiteBg,
                                  style: appCss.dmDenseSemiBold16.textColor(
                                      appColor(context).red))),
                          const HSpace(Sizes.s15),
                          Expanded(
                              child: ButtonCommon(
                                  color: appColor(context).red,
                                  onTap: () => deleteAccount(context),
                                  title: appFonts.delete))
                        ])
                      ]).padding(
                          horizontal: Insets.i20,
                          top: Insets.i60,
                          bottom: Insets.i20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Title
                            Text(language(context, appFonts.deleteAccount),
                                style: appCss.dmDenseExtraBold18.textColor(
                                    appColor(context).darkText)),
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
  }

  logoutConfirmation(context, ) {
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<LocationProvider>(
                builder: (context3, value, child) {
                  return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      insetPadding: const EdgeInsets.symmetric(horizontal: Insets.i20),
                      shape: const  SmoothRectangleBorder(
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
                                  child: Image.asset(eImageAssets.failedBook,height: Sizes.s165,
                                       width: Sizes.s88).paddingOnly(bottom: Insets.i15,top: Insets.i25))

                                  .decorated(
                                  color: appColor(context).fieldCardBg,
                                  borderRadius:
                                  BorderRadius.circular(AppRadius.r10)),
                            ]),
                          ]),
                          // Sub text
                          const VSpace(Sizes.s15),
                          Text(language(context, appFonts.logoutDesc),
                              textAlign: TextAlign.center,
                              style: appCss.dmDenseRegular14
                                  .textColor(appColor(context).lightText)
                                  .textHeight(1.3)),
                          const VSpace(Sizes.s20),
                          Row(children: [
                            Expanded(
                                child: ButtonCommon(
                                    onTap: () => route.pop(context),
                                    title: appFonts.cancel,
                                    borderColor: appColor(context).primary,
                                    color: appColor(context).whiteBg,
                                    style: appCss.dmDenseSemiBold16.textColor(
                                        appColor(context).primary))),
                            const HSpace(Sizes.s15),
                            Expanded(
                                child: ButtonCommon(
                                  title: appFonts.yes,
                                  color: appColor(context).primary,
                                  onTap: (){
                                    userModel =null;
                                    setPrimaryAddress = null;
                                    userPrimaryAddress = null;
                                    final dash = Provider.of<DashboardProvider>(context, listen: false);
                                    dash.selectIndex =0;
                                    dash.notifyListeners();
                                    preferences!.remove(session.user);
                                    preferences!.remove(session.accessToken);
                                    preferences!.remove(session.isContinueAsGuest);
                                    preferences!.remove(session.isLogin);
                                    preferences!.remove(session.cart);
                                    preferences!.remove(session.recentSearch);


                                    final auth = FirebaseAuth.instance.currentUser;
                                    if(auth != null){
                                      FirebaseAuth.instance.signOut();
                                      GoogleSignIn().disconnect();
                                    }
                                    notifyListeners();
                                    route.pop(context);
                                    route.pushAndRemoveUntil(context);

                                  },
                                  style: appCss.dmDenseSemiBold16.textColor(
                                      appColor(context).whiteColor),))
                          ])
                        ]).padding(
                            horizontal: Insets.i20,
                            top: Insets.i60,
                            bottom: Insets.i20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Title
                              Text(language(context, appFonts.logOut).replaceAll(" ", ""),
                                  style: appCss.dmDenseExtraBold18.textColor(
                                      appColor(context).darkText)),
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

  onTapSettingTap(context) {
    route
        .pushNamed(context, routeName.appSetting)
        .then((val) => notifyListeners());
  }

  //delete account
  deleteAccount(context) async {
    route.pop(context);
    try {
      await apiServices
          .getApi(api.deleteAccount, [], isToken: true)
          .then((value) {
        if (value.isSuccess!) {
          final dash = Provider.of<DashboardProvider>(context, listen: false);
          dash.selectIndex =0;
          dash.notifyListeners();
          preferences!.remove(session.user);
          preferences!.remove(session.accessToken);
          preferences!.remove(session.isContinueAsGuest);
          preferences!.remove(session.isLogin);
          preferences!.remove(session.cart);
          preferences!.remove(session.recentSearch);

          preferences!.clear();
          notifyListeners();
          route.pushAndRemoveUntil(context);
        }
      });
    } catch (e) {
      notifyListeners();
    }
  }
}
