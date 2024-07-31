import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/alert_message_common.dart';

class MyReviewProvider extends ChangeNotifier {
  List<Reviews> reviews = [];
  bool isPositionedRight = false;
  bool isAnimateOver = false;
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;

  getMyReview(context) async {
    try {
      showLoading(context);
      notifyListeners();
      await apiServices.getApi(api.review, [], isToken: true).then((value) {
        hideLoading(context);
        notifyListeners();
        if (value.isSuccess!) {
          List list = value.data;
          reviews = [];
          for (var data in value.data) {

            if(!reviews.contains(Reviews.fromJson(data))) {
              reviews.add(Reviews.fromJson(data));
            }
            notifyListeners();
          }
log("reviews :${reviews.length}");
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("getMyReview :$e");
      notifyListeners();
    }
  }

  deleteAccountConfirmation(context, sync, id, {isBack = false}) {
    animateDesign(sync);
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<MyReviewProvider>(
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
                                                            .reviewTrash)))),
                                        Image.asset(eImageAssets.dustbin,
                                            height: Sizes.s88, width: Sizes.s88).paddingOnly(bottom: Insets.i24)
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
                          Text(language(context, appFonts.deleteReviewSuccessfully),
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
                                    style: appCss.dmDenseSemiBold16.textColor(
                                        appColor(context).primary))),
                            const HSpace(Sizes.s15),
                            Expanded(
                                child: ButtonCommon(
                                  title: appFonts.yes,
                                  color: appColor(context).primary,
                                  onTap: ()=>deleteReview(context, id),
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
                              Text(language(context, appFonts.deleteReview),
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


  //delete review
  deleteReview(context, id, {isBack = false}) async {
    showLoading(context);
    route.pop(context);

    try {
      await apiServices
          .deleteApi("${api.review}/$id", {}, isToken: true)
          .then((value) {
        hideLoading(context);
        log("VVVV : ${value.isSuccess}");
        notifyListeners();
        if (value.isSuccess!) {
          completeSuccess(context,isBack);
          getMyReview(context);


        } else {
          snackBarMessengers(context,
              color: appColor(context).red, message: value.message);
        }
      });
    } catch (e) {
      hideLoading(context);
      notifyListeners();
      log("CATCH deleteReview: $e");
    }
  }

  completeSuccess(context,isBack){
    showCupertinoDialog(
      context: context,
      builder: (context1) {
        return AlertDialogCommon(
          title: appFonts.successfullyDelete,
          height: Sizes.s140,
          image: eGifAssets.successGif,
          subtext: language(context, appFonts.reviewDeletedSuccessfully),
          bText1: language(context, appFonts.okay),
          b1OnTap: () {
            route.pop(context);
          },
        );
      },
    );
  }
}
