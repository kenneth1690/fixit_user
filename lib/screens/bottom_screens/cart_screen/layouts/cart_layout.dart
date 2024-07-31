import 'dart:developer';

import 'package:intl/intl.dart';

import '../../../../config.dart';

class CartLayout extends StatefulWidget {
  final CartModel? data;
  final GestureTapCallback? deleteTap, editTap;

  const CartLayout({super.key, this.data, this.deleteTap, this.editTap});

  @override
  State<CartLayout> createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {
  List<ProviderModel> provider = [];
  bool isAnyEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    log("widget.data!.isPackage :${widget.data!.isPackage}");
    if (widget.data!.isPackage == true) {
      provider = isServiceManEmpty(widget.data!.servicePackageList!.services!);
      widget.data!.servicePackageList!.services!
          .asMap()
          .entries
          .forEach((element) {
        if (element.value.selectServiceManType == "app_choose") {
          isAnyEmpty = true;
        }
      });
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IntrinsicHeight(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          CachedNetworkImage(
            imageUrl: widget.data!.isPackage!
                ? widget.data!.servicePackageList!.user!.media![0].originalUrl!
                : widget.data!.serviceList!.media![0].originalUrl!,
            imageBuilder: (context, imageProvider) => Container(
                height: Sizes.s38,
                width: Sizes.s38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider))),
            errorWidget: (context, url, error) => Container(
                height: Sizes.s38,
                width: Sizes.s38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(eImageAssets.noImageFound1)))),
          ),
          const HSpace(Sizes.s8),
          Text(
             capitalizeFirstLetter( widget.data!.isPackage!
                 ? widget.data!.servicePackageList!.user!.name!
                 : widget.data!.serviceList!.user != null
                 ? widget.data!.serviceList!.user!.name!
                 : "Provider"),
              style:
                  appCss.dmDenseMedium14.textColor(appColor(context).darkText)),
          VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: appColor(context).lightText,
                  indent: 12,
                  endIndent: 12)
              .paddingSymmetric(horizontal: Insets.i8),
          Row(children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s3),
            Text(
                widget.data!.isPackage!
                    ? widget.data!.servicePackageList!.user!.reviewRatings !=
                            null
                        ? widget.data!.servicePackageList!.user!.reviewRatings
                            .toString()
                        : "0.0"
                    : widget.data!.serviceList!.user != null
                        ? widget.data!.serviceList!.user!.reviewRatings != null
                            ? widget.data!.serviceList!.user!.reviewRatings
                                .toString()
                            : "0.0"
                        : "0.0",
                style: appCss.dmDenseMedium13
                    .textColor(appColor(context).darkText))
          ])
        ]),
        Row(children: [
          CommonArrow(
            arrow: eSvgAssets.edit,
            isThirteen: true,
            onTap: widget.editTap,
          ),
          const HSpace(Sizes.s10),
          CommonArrow(
              arrow: eSvgAssets.delete,
              isThirteen: true,
              onTap: widget.deleteTap,
              svgColor: appColor(context).red,
              color: appColor(context).red.withOpacity(0.1))
        ])
      ])).paddingAll(Insets.i15),
      Divider(height: 0, thickness: 1, color: appColor(context).stroke),
      const VSpace(Sizes.s12),
      Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      language(
                          context,
                          widget.data!.isPackage!
                              ? widget.data!.servicePackageList!.title
                              : widget.data!.serviceList!.title!),
                      style: appCss.dmDenseSemiBold16
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s4),
                  Row(children: [
                    Text(
                        language(context,
                            "${getSymbol(context)}${(currency(context).currencyVal * (widget.data!.isPackage! ? widget.data!.servicePackageList!.price! : widget.data!.serviceList!.serviceRate!)).toStringAsFixed(2)}"),
                        style: appCss.dmDenseBold18
                            .textColor(appColor(context).primary)),
                    if (widget.data!.isPackage!
                        ? widget.data!.servicePackageList!.discount != null
                        : widget.data!.serviceList!.discount != null)
                      Text(
                              language(context,
                                  "(${widget.data!.isPackage! ? widget.data!.servicePackageList!.discount : widget.data!.serviceList!.discount}% ${language(context, appFonts.off)})"),
                              style: appCss.dmDenseMedium12
                                  .textColor(appColor(context).red))
                          .paddingSymmetric(horizontal: Insets.i2)
                  ]),
                  const VSpace(Sizes.s8),
                  widget.data!.isPackage == false
                      ? IntrinsicHeight(
                          child: FittedBox(
                            child: Row(children: [
                            SvgPicture.asset(eSvgAssets.calendar,
                                height: Sizes.s16,
                                colorFilter: ColorFilter.mode(appColor(context).darkText, BlendMode.srcIn),
                                ),
                            const HSpace(Sizes.s6),
                            Text(
                                DateFormat("dd MMM, yyyy").format(
                                    widget.data!.serviceList!.serviceDate ??
                                        DateTime.now()),
                                style: appCss.dmDenseRegular13
                                    .textColor(appColor(context).darkText)),
                            VerticalDivider(
                                    width: 1,
                                    thickness: 1,
                                    color: appColor(context).stroke,
                                    indent: 3,
                                    endIndent: 3)
                                .paddingSymmetric(horizontal: Insets.i6),
                            SvgPicture.asset(eSvgAssets.clock,height: Sizes.s16,
                                colorFilter: ColorFilter.mode(
                                    appColor(context).darkText, BlendMode.srcIn),
                            ),
                            const HSpace(Sizes.s6),
                            Text(
                                "${DateFormat("hh:mm").format(widget.data!.serviceList!.serviceDate ?? DateTime.now())} ${widget.data!.serviceList!.selectedDateTimeFormat ?? "AM"}",
                                style: appCss.dmDenseRegular13
                                    .textColor(appColor(context).darkText))
                                                    ]),
                          ))
                      : /*SizedBox(
                          width: Sizes.s198,
                          child: Text(
                              language(
                                  context, "Date/time shows in package detail."),
                              overflow: TextOverflow.fade,
                              style: appCss.dmDenseRegular13.textColor(
                                  appColor(context).darkText)))*/
                      SizedBox(
                          width: Sizes.s200,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\u2022 ",
                                    style: appCss.dmDenseRegular13.textColor(
                                        appColor(context).greenColor)),
                                const HSpace(Sizes.s5),
                                Expanded(
                                    child: Text(
                                            language(
                                                context,
                                                appFonts
                                                    .dateTimeShowInPackageDetail),
                                            style: appCss.dmDenseMedium12
                                                .textColor(
                                                    appColor(context).green))
                                        .paddingOnly(right: Insets.i15))
                              ]),
                        )
                ]),
          ),
          Container(
              height: Sizes.s94,
              width: Sizes.s94,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.data!.isPackage == true
                          ? eImageAssets.package
                          : eImageAssets.fsl1),
                      fit: BoxFit.cover),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.all(
                          SmoothRadius(cornerRadius: 8, cornerSmoothing: 1)))))
        ]),
        const VSpace(Sizes.s12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                language(
                    context,
                    widget.data!.isPackage == true
                        ? appFonts.includedService
                        : appFonts.selectedServicemen),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText)),
            Text(
                "${widget.data!.isPackage == true ? widget.data!.servicePackageList!.services!.length : widget.data!.serviceList!.selectedRequiredServiceMan} ${capitalizeFirstLetter(language(context, widget.data!.isPackage == true ? appFonts.service : language(context, appFonts.serviceman)))}",
                style: appCss.dmDenseSemiBold12
                    .textColor(appColor(context).primary)),
          ],
        ),
        const DottedLines().paddingSymmetric(vertical: Insets.i12),
        widget.data!.isPackage == false
            ? Column(
                children: [
                  widget.data!.serviceList!.selectedServiceMan == null ||
                          widget.data!.serviceList!.selectedServiceMan!.isEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(language(context, appFonts.note),
                                  style: appCss.dmDenseRegular13
                                      .textColor(appColor(context).lightText)),
                              const HSpace(Sizes.s10),
                              Expanded(
                                  child: Column(children: [
                                Text(
                                    language(context, appFonts.asYouPreviously),
                                    overflow: TextOverflow.fade,
                                    style: appCss.dmDenseRegular13
                                        .textColor(appColor(context).lightText))
                              ]))
                            ])
                      : Column(
                          children: widget
                              .data!.serviceList!.selectedServiceMan!
                              .asMap()
                              .entries
                              .map(
                                (j) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                      Row(children: [
                                        Container(
                                            height: Sizes.s38,
                                            width: Sizes.s38,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(j
                                                        .value
                                                        .media![0]
                                                        .originalUrl!)))),
                                        const HSpace(Sizes.s8),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  language(context,
                                                          appFonts.serviceman)
                                                      .capitalizeFirst(),
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              .lightText)),
                                              Text(j.value.name!,
                                                  style: appCss.dmDenseMedium14
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText))
                                            ])
                                      ]),
                                      Row(children: [
                                        SvgPicture.asset(eSvgAssets.star),
                                        const HSpace(Sizes.s3),
                                        Text(
                                            j.value.reviewRatings != null
                                                ? j.value.reviewRatings
                                                    .toString()
                                                : '0.0',
                                            style: appCss.dmDenseMedium13
                                                .textColor(
                                                    appColor(context).darkText))
                                      ])
                                    ])
                                    .paddingAll(Insets.i12)
                                    .boxShapeExtension(
                                        color: appColor(context).fieldCardBg)
                                    .paddingOnly(bottom: Insets.i10),
                              )
                              .toList()),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (provider.isNotEmpty)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            language(
                                context, appFonts.totalSelectedServicemenList),
                            style: appCss.dmDenseRegular14
                                .textColor(appColor(context).darkText),
                          ),
                          const VSpace(Sizes.s10),
                          ...provider.asMap().entries.map(
                                (j) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                      Row(children: [
                                        Container(
                                            height: Sizes.s38,
                                            width: Sizes.s38,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(j
                                                        .value
                                                        .media![0]
                                                        .originalUrl!)))),
                                        const HSpace(Sizes.s8),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  language(context,
                                                          appFonts.serviceman)
                                                      .capitalizeFirst(),
                                                  style: appCss.dmDenseMedium12
                                                      .textColor(
                                                          appColor(context)
                                                              .lightText)),
                                              Text(j.value.name!,
                                                  style: appCss.dmDenseMedium14
                                                      .textColor(
                                                          appColor(context)
                                                              .darkText))
                                            ])
                                      ]),
                                      Row(children: [
                                        SvgPicture.asset(eSvgAssets.star),
                                        const HSpace(Sizes.s3),
                                        Text(
                                            j.value.reviewRatings != null
                                                ? j.value.reviewRatings
                                                    .toString()
                                                : "0",
                                            style: appCss.dmDenseMedium13
                                                .textColor(
                                                    appColor(context).darkText))
                                      ])
                                    ])
                                    .paddingAll(Insets.i12)
                                    .boxShapeExtension(
                                        color: appColor(context).fieldCardBg)
                                    .paddingOnly(bottom: Insets.i10),
                              ),
                        ]),
                  if (isAnyEmpty)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(language(context, appFonts.note),
                              style: appCss.dmDenseRegular13
                                  .textColor(appColor(context).lightText)),
                          const HSpace(Sizes.s10),
                          Expanded(
                              child: Column(children: [
                            Text(language(context, appFonts.appSelectNote),
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.start,
                                style: appCss.dmDenseRegular13
                                    .textColor(appColor(context).lightText))
                          ]))
                        ]),
                ],
              ),
        // if (data!.isPackage == true) const DottedLines(),
        /* if (data!.isPackage == true)
          Text(language(context, appFonts.thisServiceIsSelected),
                  style: appCss.dmDenseSemiBold12
                      .textColor(appColor(context).online))
              .paddingOnly(top: Insets.i12)*/
      ]).paddingSymmetric(horizontal: Insets.i15),
      const VSpace(Sizes.s15),
    ])
        .boxBorderExtension(context, isShadow: true)
        .paddingOnly(bottom: Insets.i15);
  }
}
