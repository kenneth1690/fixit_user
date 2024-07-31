import 'package:intl/intl.dart';

import '../../../../config.dart';

class ServiceSelectUserStepTwo extends StatelessWidget {
  const ServiceSelectUserStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceSelectProvider>(builder: (context1, value, child) {
      return Consumer<LocationProvider>(builder: (context2, loc, child) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(language(context, appFonts.billDetails).toUpperCase(),
                        style: appCss.dmDenseSemiBold16
                            .textColor(appColor(context).primary)),
                    const VSpace(Sizes.s15),
                    Text(language(context, appFonts.selectedServicemen),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    loc.addressList.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                SvgPicture.asset(eSvgAssets.about,
                                    fit: BoxFit.scaleDown),
                                const HSpace(Sizes.s10),
                                Expanded(
                                    child: Column(children: [
                                  Text(
                                      language(
                                          context, appFonts.asYouPreviously),
                                      overflow: TextOverflow.fade,
                                      style: appCss.dmDenseRegular14.textColor(
                                          appColor(context).darkText))
                                ]))
                              ]).paddingAll(Insets.i15).boxShapeExtension(
                            color: appColor(context).fieldCardBg)
                        : Column(
                            children: value.servicesCart!.selectedServiceMan!
                                .asMap()
                                .entries
                                .map((e) => ServicemanLayout(
                                    image: e.value.media != null &&
                                            e.value.media!.isNotEmpty
                                        ? e.value.media![0].originalUrl!
                                        : null,
                                    title: e.value.name,
                                    rate: e.value.reviewRatings != null
                                        ? e.value.reviewRatings.toString()
                                        : "0",
                                    exp: e.value.experienceDuration != null ? e.value.experienceDuration.toString():"0",
                                    expYear:
                                        e.value.experienceInterval ?? "Year",
                                    editTap: () => route.pushNamed(context,
                                            routeName.servicemanListScreen,
                                            arg: {
                                              "providerId":
                                                  value.servicesCart!.userId,
                                              "requiredServiceman": value
                                                  .servicesCart!
                                                  .selectedRequiredServiceMan,
                                              "selectedServiceMan": value
                                                  .servicesCart!
                                                  .selectedServiceMan
                                            }).then((val) {
                                          if (val != null) {
                                            value.servicesCart!
                                                .selectedServiceMan = val;
                                            value.notifyListeners();
                                          } else {
                                            value.servicesCart!
                                                .selectedServiceMan = null;
                                          }
                                        }),
                                    tileTap: () {
                                      route.pushNamed(context,
                                          routeName.servicemanDetailScreen,
                                          arg: e.value.id);
                                    }).paddingOnly(top: Insets.i10))
                                .toList()),
                    const VSpace(Sizes.s25),
                    Text(language(context, appFonts.bookedDateTime),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    const VSpace(Sizes.s10),
                    BookedDateTimeLayout(
                        onTap: () => value.onTapDate(context),
                        date: DateFormat('dd MMMM, yyyy')
                            .format(value.servicesCart!.serviceDate!),
                        time:
                            "${language(context, appFonts.at)} ${DateFormat('hh:mm').format(value.servicesCart!.serviceDate!)} ${value.servicesCart!.selectedDateTimeFormat ?? DateFormat('aa').format(value.servicesCart!.serviceDate!)}"),
                    const VSpace(Sizes.s25),
                    BillSummaryLayout(
                        balance:
                            "${getSymbol(context)}${(currency(context).currencyVal * (userModel!.wallet != null ? userModel!.wallet!.balance! : 0.0)).toStringAsFixed(1)}"),
                    const VSpace(Sizes.s10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(isDark(context) ? eImageAssets.pendingBillBgDark:  eImageAssets.pendingBillBg),
                                fit: BoxFit.fill)),
                        child: Column(children: [
                          Column(children: [
                            BillRowCommon(
                                title: appFonts.perServiceCharge,
                                price:
                                    "${getSymbol(context)}${(currency(context).currencyVal * (value.servicesCart!.serviceRate!).floorToDouble())}"),
                            BillRowCommon(
                                    title:
                                        "\$${value.servicesCart!.selectedRequiredServiceMan} servicemen (${getSymbol(context)}${(currency(context).currencyVal * (value.servicesCart!.serviceRate!).floorToDouble()) * (value.servicesCart!.selectedRequiredServiceMan!)})",
                                    price:
                                        "${getSymbol(context)}${(currency(context).currencyVal * (value.servicesCart!.serviceRate!).floorToDouble())}")
                                .paddingSymmetric(vertical: Insets.i20),
                            BillRowCommon(
                                title: appFonts.tax,
                                price:
                                    language(context, appFonts.costAtCheckout))
                          ]).paddingSymmetric(
                            vertical: Insets.i20,
                          ),

                          VSpace((value.servicesCart!
                                      .selectedRequiredServiceMan!) >
                                  1
                              ? Sizes.s25
                              : Sizes.s8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(language(context, appFonts.totalAmount),
                                    style: appCss.dmDenseMedium14.textColor(
                                        appColor(context).darkText)),
                                Text(
                                    "${getSymbol(context)}${(currency(context).currencyVal * (value.servicesCart!.serviceRate!).floorToDouble()) * (value.servicesCart!.selectedRequiredServiceMan!)}",
                                    style: appCss.dmDenseBold16.textColor(
                                        appColor(context).primary))
                              ]).paddingSymmetric(
                              vertical: Insets.i20, horizontal: Insets.i15)
                        ])),
                    const DottedLines().paddingSymmetric(vertical: Insets.i20),
                    /*const CancellationPolicyLayout(),
                    const DisclaimerLayout(),*/
                    const VSpace(Sizes.s100),
                  ]).paddingSymmetric(horizontal: Insets.i20),
            ),
            ButtonCommon(
              title: appFonts.confirmBooking,
              onTap: () => value.addToCart(context),
              margin: Insets.i20,
            )
                .marginOnly(bottom: Insets.i20)
                .decorated(color: appColor(context).whiteBg)
                .alignment(Alignment.bottomCenter)
          ],
        );
      });
    });
  }
}
