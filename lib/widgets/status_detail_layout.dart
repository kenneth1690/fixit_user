import 'dart:developer';
import 'dart:ffi';

import 'package:fixit_user/common_tap.dart';
import 'package:fixit_user/widgets/common_image_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../config.dart';

class StatusDetailLayout extends StatelessWidget {
  final BookingModel? data;
  final GestureTapCallback? onTapSocial, onTapStatus;
  final bool isLayout;
  final Function(int)? rateTap;

  const StatusDetailLayout(
      {super.key,
      this.data,
      this.onTapSocial,
      this.onTapStatus,
      this.isLayout = false,
      this.rateTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      data!.service!.media != null && data!.service!.media!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: data!.service!.media![0].originalUrl!,
              imageBuilder: (context, imageProvider) => Container(
                  height: Sizes.s140,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      shape: const SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.all(SmoothRadius(
                              cornerRadius: AppRadius.r10,
                              cornerSmoothing: 1))))),
              placeholder: (context, url) => Container(
                  height: Sizes.s140,
                  decoration: ShapeDecoration(
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound1),
                          fit: BoxFit.cover),
                      shape: const SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius.all(SmoothRadius(
                              cornerRadius: AppRadius.r10,
                              cornerSmoothing: 1))))),
            )
          : Container(
              height: Sizes.s140,
              decoration: ShapeDecoration(
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound1),
                      fit: BoxFit.cover),
                  shape: const SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius.all(SmoothRadius(
                          cornerRadius: AppRadius.r10, cornerSmoothing: 1))))),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(data!.bookingNumber!,
            style: appCss.dmDenseMedium16.textColor(appColor(context).primary)),
        Row(children: [
          Text(language(context, appFonts.viewStatus),
              style:
                  appCss.dmDenseMedium12.textColor(appColor(context).primary)),
          const HSpace(Sizes.s5),
          SvgPicture.asset(eSvgAssets.anchorArrowRight,
              colorFilter:
                  ColorFilter.mode(appColor(context).primary, BlendMode.srcIn))
        ])
            .paddingSymmetric(horizontal: Insets.i12, vertical: Insets.i8)
            .boxShapeExtension(
                radius: AppRadius.r4,
                color: appColor(context).primary.withOpacity(0.1))
            .inkWell(onTap: onTapStatus)
      ]).paddingSymmetric(vertical: Insets.i15),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Text(data!.service!.title!,
              style:
                  appCss.dmDenseMedium16.textColor(appColor(context).darkText)),
        ),
        data!.service!.ratingCount != null
            ? Row(children: [
                SvgPicture.asset(eSvgAssets.star),
                const HSpace(Sizes.s4),
                Text(
                    data!.service!.ratingCount != null
                        ? data!.service!.ratingCount.toString()
                        : "0",
                    style: appCss.dmDenseMedium13
                        .textColor(appColor(context).darkText))
              ])
            : Container()
      ]),
      const VSpace(Sizes.s5),
      Text("\u2022 ${data!.service!.categories![0].title}",
              style: appCss.dmDenseRegular13
                  .textColor(appColor(context).lightText))
          .paddingSymmetric(horizontal: Insets.i5),
      const VSpace(Sizes.s15),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(
            child: DescriptionLayout(
                icon: eSvgAssets.calendar,
                title: DateFormat("dd MMM, yyyy")
                    .format(DateTime.parse(data!.dateTime!)),
                subtitle: appFonts.date,
                padding: 0),
          ),
          Container(
                  height: Sizes.s78, width: 2, color: appColor(context).stroke)
              .paddingSymmetric(horizontal: Insets.i20),
          Expanded(
            child: DescriptionLayout(
                icon: eSvgAssets.clock,
                title: DateFormat("hh:mm aa")
                    .format(DateTime.parse(data!.dateTime!)),
                subtitle: appFonts.time),
          )
        ]).paddingSymmetric(horizontal: Insets.i10),
        if (data!.bookingStatus!.slug != appFonts.cancel ||
            data!.bookingStatus!.slug != appFonts.cancelled)
          Divider(color: appColor(context).stroke, thickness: 1, height: 1),
        if (data!.bookingStatus!.slug != appFonts.cancel ||
            data!.bookingStatus!.slug != appFonts.cancelled)
          const VSpace(Sizes.s17),
        if (data!.bookingStatus!.slug != appFonts.cancel ||
            data!.bookingStatus!.slug != appFonts.cancelled)
          IntrinsicHeight(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                SvgPicture.asset(
                  eSvgAssets.locationOut1,
                  height: Sizes.s20,
                  width: Sizes.s20,
                  colorFilter: ColorFilter.mode(
                      appColor(context).darkText, BlendMode.srcIn),
                ),
                VerticalDivider(
                        thickness: 1,
                        indent: 2,
                        endIndent: 20,
                        width: 1,
                        color: appColor(context).stroke)
                    .paddingSymmetric(horizontal: Insets.i9),
                Expanded(
                    child: Text(
                        data!.consumer != null
                            ? "${data!.address!.area != null ? "${data!.address!.area}, " : ""}${data!.address!.address}, ${data!.address!.country!.name}, ${data!.address!.state!.name}, ${data!.address!.postalCode}"
                            : "",
                        overflow: TextOverflow.fade,
                        style: appCss.dmDenseRegular14
                            .textColor(appColor(context).darkText)))
              ])).padding(horizontal: Insets.i10, bottom: Insets.i15),
      ]).boxBorderExtension(context),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (data!.service!.description != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(language(context, appFonts.description),
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).lightText)),
              const VSpace(Sizes.s6),
              ReadMoreLayout(text: data!.service!.description!),
              const VSpace(Sizes.s20),
            ],
          ),
        if (data!.bookingStatus!.slug == appFonts.pending ||
            data!.bookingStatus!.slug == appFonts.accepted)
          const BookingServiceStatusLayout()
              .width(MediaQuery.of(context).size.width),
        if (data!.bookingStatus!.slug == appFonts.cancel ||
            data!.bookingStatus!.slug == appFonts.cancelled)
          BookingServiceStatusLayout(
              status: appFonts.reason,
              title: bookingReasons(data!.bookingReasons!)),
      ]).paddingSymmetric(vertical: Insets.i15),
      SizedBox(
              child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(language(context, appFonts.providerDetails),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText)),
          Row(children: [
            Text(language(context, appFonts.view),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).primary)),
            const HSpace(Sizes.s4),
            SvgPicture.asset(eSvgAssets.anchorArrowRight,
                colorFilter: ColorFilter.mode(
                    appColor(context).primary, BlendMode.srcIn))
          ]).inkWell(
              onTap: () => route.pushNamed(
                  context, routeName.providerDetailsScreen,
                  arg: {'provider': data!.provider}))
        ]),
        Divider(height: 1, color: appColor(context).stroke)
            .paddingSymmetric(vertical: Insets.i15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            CommonImageLayout(
              height: Sizes.s40,
              width: Sizes.s40,
              isCircle: true,
              assetImage: eImageAssets.noImageFound3,
              image: data!.provider!.media != null &&
                      data!.provider!.media!.isNotEmpty
                  ? data!.provider!.media![0].originalUrl!
                  : "",
            ),
            const HSpace(Sizes.s12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(capitalizeFirstLetter(data!.provider!.name!),
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText)),
              Text(
                  "${data!.provider!.experienceDuration ?? 0} ${ data!.provider!.experienceInterval !=null? (capitalizeFirstLetter(data!.provider!.experienceInterval)):"Years"} ${appFonts.of} ${language(context, appFonts.experience)}",
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).darkText))
            ])
          ]),
          data!.provider!.reviewRatings != null
              ? Row(children: [
                  RatingLayout(
                      initialRating: data!.provider!.reviewRatings != null
                          ? double.parse(
                              data!.provider!.reviewRatings.toString())
                          : 0.0,
                      color: appColor(context).rateColor),
                  const HSpace(Sizes.s4),
                  Text(
                      data!.provider!.reviewRatings != null
                          ? data!.provider!.reviewRatings.toString()
                          : "0",
                      style: appCss.dmDenseMedium12
                          .textColor(appColor(context).darkText))
                ])
              : Container()
        ]),
        if (data!.bookingStatus!.slug == appFonts.completed ||
            data!.bookingStatus!.slug == appFonts.accepted)
          const VSpace(Sizes.s15),
        if (data!.bookingStatus!.slug == appFonts.completed ||
            data!.bookingStatus!.slug == appFonts.accepted)
          Column(children: [
            ContactDetailRowCommon(
                    image: eSvgAssets.mail, title: data!.provider!.email!)
                .inkWell(onTap: () => mailTap(context, data!.provider!.email!)),
            ContactDetailRowCommon(
                    image: eSvgAssets.phone, title: data!.provider!.phone!)
                .inkWell(
                    onTap: () => launchCall(context, data!.provider!.phone!))
                .paddingSymmetric(vertical: Insets.i15),
            ContactDetailRowCommon(
                    image: eSvgAssets.locationOut1,
                    title:
                        "${data!.provider!.primaryAddress!.address}, ${data!.provider!.primaryAddress!.country!.name}, ${data!.provider!.primaryAddress!.state!.name}")
                .inkWell(
                    onTap: () => launchMap(context,
                        "${data!.provider!.primaryAddress!.latitude},${data!.provider!.primaryAddress!.longitude}"))
          ])
              .paddingAll(Insets.i15)
              .boxShapeExtension(color: appColor(context).whiteBg)
      ]))
          .paddingAll(Insets.i15)
          .boxShapeExtension(color: appColor(context).fieldCardBg),
      if (data!.servicemen != null && data!.servicemen!.isNotEmpty)
        const VSpace(Sizes.s15),
      if (data!.bookingStatus!.slug != appFonts.cancel ||
          data!.bookingStatus!.slug != appFonts.cancelled)
        if (data!.servicemen != null)
          ...data!.servicemen!.asMap().entries.map((s) {
            log("SER REV : ${s.value.servicemanReviews!.length}");
            return SizedBox(
                    child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.servicemanDetail),
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText)),
                Row(children: [
                  Text(language(context, appFonts.view),
                      style: appCss.dmDenseMedium12
                          .textColor(appColor(context).primary)),
                  const HSpace(Sizes.s4),
                  SvgPicture.asset(eSvgAssets.anchorArrowRight,
                      colorFilter: ColorFilter.mode(
                          appColor(context).primary, BlendMode.srcIn))
                ]).inkWell(onTap: () {
                  if (s.value.roles != null) {
                    if (s.value.roles![0].name == "provider") {
                      route.pushNamed(context, routeName.providerDetailsScreen,
                          arg: {'provider': s.value});
                    } else {
                      route.pushNamed(context, routeName.servicemanDetailScreen,
                          arg: s.value.id);
                    }
                  } else {
                    route.pushNamed(context, routeName.servicemanDetailScreen,
                        arg: s.value.id);
                  }
                })
              ])
                  .paddingSymmetric(horizontal: Insets.i15)
                  .paddingOnly(top: Insets.i15),
              Divider(height: 1, color: appColor(context).stroke)
                  .paddingSymmetric(vertical: Insets.i15),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Container(
                      height: Sizes.s40,
                      width: Sizes.s40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(eImageAssets.profile)))),
                  const HSpace(Sizes.s12),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.value.name!,
                            style: appCss.dmDenseMedium14
                                .textColor(appColor(context).darkText)),
                        Text(
                            s.value.experienceDuration == null
                                ? language(context, appFonts.fresher)
                                : "${s.value.experienceDuration ?? 0} ${ s.value.experienceInterval !=null? (capitalizeFirstLetter(s.value.experienceInterval)):"Years"} ${appFonts.of} ${language(context, appFonts.experience)}",
                            style: appCss.dmDenseMedium12
                                .textColor(appColor(context).darkText))
                      ])
                ]),
                s.value.reviewRatings != null && s.value.reviewRatings != "null"
                    ? Row(children: [
                        RatingLayout(
                          color: appColor(context).rateColor,
                          initialRating: s.value.reviewRatings != null &&
                                  s.value.reviewRatings != "null"
                              ? double.parse(s.value.reviewRatings!)
                              : 0.0,
                        ),
                        const HSpace(Sizes.s4),
                        Text(
                            s.value.reviewRatings != null &&
                                    s.value.reviewRatings != "null"
                                ? s.value.reviewRatings!
                                : "0",
                            style: appCss.dmDenseMedium12
                                .textColor(appColor(context).darkText))
                      ])
                    : Container()
              ])
                  .paddingSymmetric(horizontal: Insets.i15)
                  .paddingOnly(bottom: Insets.i5),
              if (data!.bookingStatus!.slug != appFonts.pending)
                const VSpace(Sizes.s20),
              if (data!.bookingStatus!.slug != appFonts.pending)
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: appArray.socialList
                            .asMap()
                            .entries
                            .map((e) => SocialButtonCommon(
                                data: e.value,
                                onTap: () {
                                  if (e.value["title"] == appFonts.call) {
                                    launchCall(context, s.value.phone);
                                  } else if (e.value["title"] ==
                                      appFonts.chat) {
                                    route.pushNamed(
                                        context, routeName.chatScreen,
                                        arg: {
                                          "image": s.value.media != null &&
                                                  s.value.media!.isNotEmpty
                                              ? s.value.media![0].originalUrl!
                                              : "",
                                          "name": s.value.name,
                                          "role": "serviceman",
                                          "userId": s.value.id,
                                          "token": s.value.fcmToken,
                                          "phone": s.value.phone,
                                          "code": s.value.code,
                                          "bookingId": data!.id
                                        });
                                  } else if (e.value["title"] == appFonts.wp) {
                                    wpTap(context,
                                        "${s.value.code}${s.value.phone}");
                                  }
                                }))
                            .toList())
                    .paddingSymmetric(horizontal: Insets.i15),
              const VSpace(Sizes.s15),
              if (isLayout && !isServiceRate(s.value.servicemanReviews!))
                Column(
                  children: [
                    const DottedLines(),
                    Container(
                        padding: const EdgeInsets.all(Insets.i15),
                        decoration: ShapeDecoration(
                            color: appColor(context).stroke,
                            shape: const SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius.only(
                                    bottomLeft: SmoothRadius(
                                        cornerRadius: 10, cornerSmoothing: 1),
                                    bottomRight: SmoothRadius(
                                        cornerRadius: 10,
                                        cornerSmoothing: 1)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                                    language(
                                        context, appFonts.giveAppreciation),
                                    style: appCss.dmDenseMedium13.textColor(
                                        appColor(context).darkText))),
                            Row(
                              children: [
                                Text(
                                    language(context,
                                        appFonts.rateNow.toUpperCase()),
                                    style: appCss.dmDenseMedium12
                                        .textColor(appColor(context).primary)
                                        .underline),
                                const HSpace(Sizes.s6),
                                SvgPicture.asset(
                                  eSvgAssets.anchorArrowRight,
                                  colorFilter: ColorFilter.mode(
                                      appColor(context).primary,
                                      BlendMode.srcIn),
                                )
                              ],
                            ).inkWell(onTap: () => rateTap!(s.value.id!))
                          ],
                        )),
                  ],
                )
            ]))
                .boxShapeExtension(
                    radius: 10, color: appColor(context).fieldCardBg)
                .marginOnly(
                    bottom:
                        data!.servicemen!.length - 1 != s.key ? Insets.i15 : 0);
          }),
    ]).paddingAll(Insets.i15).boxBorderExtension(context,
            isShadow: true, color: appColor(context).whiteBg));
  }
}
