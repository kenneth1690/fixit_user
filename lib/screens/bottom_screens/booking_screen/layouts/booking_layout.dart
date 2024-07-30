import 'package:intl/intl.dart';

import '../../../../config.dart';

class BookingLayout extends StatefulWidget {
  final BookingModel? data;
  final GestureTapCallback? onTap, editLocationTap, editDateTimeTap;
  final int? index;

  const BookingLayout(
      {super.key,
      this.data,
      this.onTap,
      this.index,
      this.editLocationTap,
      this.editDateTimeTap});

  @override
  State<BookingLayout> createState() => _BookingLayoutState();
}

class _BookingLayoutState extends State<BookingLayout> {
  @override
  Widget build(BuildContext context) {

    return Consumer<BookingProvider>(builder: (context1, value, child) {
      return Stack(alignment: Alignment.bottomCenter,
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      Text(widget.data!.bookingNumber!,
                          style: appCss.dmDenseMedium14
                              .textColor(appColor(context).primary)),
                      const HSpace(Sizes.s5),
                      if (widget.data!.servicePackageId != null)
                        BookingStatusLayout(title: appFonts.package)
                    ]),
                    const VSpace(Sizes.s8),
                    Text(language(context, widget.data!.service!.title!),
                        style: appCss.dmDenseMedium16
                            .textColor(appColor(context).darkText)),
                    Row(children: [
                      Text(
                          language(context,
                              "${getSymbol(context)}${(currency(context).currencyVal * widget.data!.subtotal!).ceilToDouble().toStringAsFixed(2)}"),
                          style: appCss.dmDenseBold18
                              .textColor(appColor(context).darkText)),
                      const HSpace(Sizes.s8),
                      if (widget.data!.service!.discount != null)
                        Text(
                            language(context,
                                "(${double.parse(widget.data!.service!.discount!).round()}% ${language(context, appFonts.off)})"),
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).red))
                    ])
                  ])),
              widget.data!.service!.media != null && widget.data!.service!.media!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: widget.data!.service!.media![0].originalUrl!,
                      imageBuilder: (context, imageProvider) => Container(
                          height: Sizes.s84,
                          width: Sizes.s84,
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              shape: const SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius.all(SmoothRadius(
                                      cornerRadius: AppRadius.r10,
                                      cornerSmoothing: 1))))),
                      placeholder: (context, url) => Container(
                          height: Sizes.s84,
                          width: Sizes.s84,
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                  image: AssetImage(eImageAssets.noImageFound1),
                                  fit: BoxFit.cover),
                              shape: const SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius.all(SmoothRadius(
                                      cornerRadius: AppRadius.r10,
                                      cornerSmoothing: 1))))),
                      errorWidget: (context, url, error) => Container(
                          height: Sizes.s84,
                          width: Sizes.s84,
                          decoration: ShapeDecoration(image: DecorationImage(image: AssetImage(eImageAssets.noImageFound1), fit: BoxFit.cover), shape: const SmoothRectangleBorder(borderRadius: SmoothBorderRadius.all(SmoothRadius(cornerRadius: AppRadius.r10, cornerSmoothing: 1))))))
                  : Container(height: Sizes.s84, width: Sizes.s84, decoration: ShapeDecoration(image: DecorationImage(image: AssetImage(eImageAssets.noImageFound1), fit: BoxFit.cover), shape: const SmoothRectangleBorder(borderRadius: SmoothBorderRadius.all(SmoothRadius(cornerRadius: AppRadius.r10, cornerSmoothing: 1)))))
            ]),
            Image.asset(eImageAssets.bulletDotted)
                .paddingSymmetric(vertical: Insets.i12),
            StatusRow(
              title: appFonts.bookingStatus,
              statusText: widget.data!.bookingStatus!.name,
              statusId: widget.data!.bookingStatusId,
            ),
            if (widget.data!.bookingStatus!.slug !=
                appFonts.cancelled)
              StatusRow(
                  statusText: widget.data!.bookingStatus!.name,
                  statusId: widget.data!.bookingStatusId,
                  title: appFonts.selectServicemen,
                  title2:
                      "${(int.parse(widget.data!.requiredServicemen! )+ (widget.data!.totalExtraServicemen != null ? int.parse(widget.data!.totalExtraServicemen!): 0))} ${capitalizeFirstLetter(language(context, appFonts.serviceman))}",
                  style:
                      appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
            StatusRow(
                statusText: widget.data!.bookingStatus!.name,
                statusId: widget.data!.bookingStatusId,
                title: appFonts.dateTime,
                onTap: widget.editDateTimeTap!,
                title2: DateFormat("dd-MM-yyyy, hh:mm aa")
                    .format(DateTime.parse(widget.data!.dateTime!)),
                isDateLocation: widget.data!.bookingStatus!.slug ==
                        appFonts.pending
                    ? true
                    : false,
                style:
                    appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
            StatusRow(
                statusText: widget.data!.bookingStatus!.name,
                statusId: widget.data!.bookingStatusId,
                title: appFonts.location,
                onTap: widget.editLocationTap,
                title2: widget.data!.consumer != null
                    ? widget.data!.address == null
                        ? "${widget.data!.address!.address}-${widget.data!.address!.area ?? widget.data!.address!.state!.name}"
                        : "${widget.data!.address!.address}-${widget.data!.address!.area ?? widget.data!.address!.state!.name}"
                    : "",
                isDateLocation: (widget.data!.bookingStatus!.slug ==
                        appFonts.pending &&
                    widget.data!.bookingStatus!.slug !=
                        appFonts.cancelled),
                style:
                    appCss.dmDenseMedium12.textColor(appColor(context).darkText)),
            if (widget.data!.bookingStatus!.slug !=
                appFonts.cancelled)
              StatusRow(
                  statusText: widget.data!.bookingStatus!.name,
                  statusId: widget.data!.bookingStatusId,
                  title: appFonts.payment,
                  title2: widget.data!.paymentStatus != null ?widget.data!.paymentMethod == "cash"? widget.data!.paymentStatus!.toLowerCase() == "completed" ? widget.data!.paymentStatus!: language(context, appFonts.notPaid).toUpperCase() : widget.data!.paymentStatus!:  widget.data!.bookingStatus!.slug == appFonts.completed
                      ? widget.data!.paymentStatus == "COMPLETED"
                      ? language(context, appFonts.paid)
                      : language(context, appFonts.notPaid)
                      : widget.data!.paymentMethod == "cash"
                      ? language(context, appFonts.notPaid)
                      : language(context, appFonts.paid),
                  style:
                      appCss.dmDenseMedium12.textColor(appColor(context).online)),
            StatusRow(
                title: appFonts.paymentMode,
                title2: widget.data!.paymentMethod == "on_hand" ||
                        widget.data!.paymentMethod == "cash"
                    ? language(context, appFonts.cash)
                    : capitalizeFirstLetter(widget.data!.paymentMethod),
                style: appCss.dmDenseMedium12.textColor(appColor(context).online)),
            const VSpace(Sizes.s15),
            if (widget.data!.isExpand!)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.data!.provider != null)
                    ServiceProviderLayout(
                            title: language(context, appFonts.provider),
                            image: widget.data!.provider!.media != null &&
                                    widget.data!.provider!.media!.isNotEmpty
                                ? widget.data!.provider!.media![0].originalUrl!
                                : null,
                            name: widget.data!.provider!.name,
                            rate: widget.data!.provider!.reviewRatings != null
                                ? widget.data!.provider!.reviewRatings.toString()
                                : "0",
                            index: 0,
                            list: const [])
                        .paddingSymmetric(horizontal: Insets.i12)
                        .boxShapeExtension(
                            color: appColor(context).fieldCardBg,
                            radius: AppRadius.r15),
                  if (widget.data!.servicemen != null &&
                      widget.data!.servicemen!.isNotEmpty)
                    Image.asset(eImageAssets.bulletDotted)
                        .paddingSymmetric(vertical: Insets.i12),
                  Stack(alignment: Alignment.bottomCenter, children: [
                    Column(children: [
                      if (widget.data!.servicemen!.isNotEmpty)
                        Column(
                            children:
                                widget.data!.servicemen!.asMap().entries.map((s) {
                          return ServiceProviderLayout(
                              isProvider: false,
                              title: language(context, appFonts.serviceman)
                                  .capitalizeFirst(),
                              image: s.value.media != null
                                  ? s.value.media![0].originalUrl!
                                  : null,
                              name: s.value.name,
                              rate: s.value.reviewRatings ?? "0",
                              index: s.key,
                              list: widget.data!.servicemen!);
                        }).toList())
                    ])
                        .paddingSymmetric(horizontal: Insets.i12)
                        .boxShapeExtension(
                            color: appColor(context).fieldCardBg,
                            radius: AppRadius.r15)
                        .paddingOnly(
                            bottom: widget.data!.servicemen!.length > 1
                                ? Insets.i15
                                : 0),
                  ])
                ],
              ),
          ])
              .paddingSymmetric(vertical: Insets.i20, horizontal: Insets.i20)
              .decorated(
                  color: appColor(context).whiteBg,
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                  boxShadow: [
                    BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.06),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: const Offset(0, 2)),
                  ],
                  border: Border.all(color: appColor(context).stroke))
              .paddingOnly(bottom: Insets.i15, left: 20, right: 20)

              .inkWell(onTap: widget.onTap),
          CommonArrow(
              arrow: widget.data!.isExpand == true
                  ? eSvgAssets.upDoubleArrow
                  : eSvgAssets.downDoubleArrow,
              isThirteen: true,
              onTap: () => value.onExpand(widget.data, widget.index!),
              color: appColor(context).fieldCardBg)
        ],
      ).paddingOnly(bottom: Sizes.s15);
    });
  }
}
