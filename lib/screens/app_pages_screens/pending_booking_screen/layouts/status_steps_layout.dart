import 'package:intl/intl.dart';

import '../../../../config.dart';

class StatusStepsLayout extends StatelessWidget {
  final BookingStatusLogs? data;
  final int? index, selectIndex,id;
  final List? list;

  const StatusStepsLayout(
      {super.key, this.data, this.index, this.selectIndex, this.list, this.id});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        selectIndex == index
            ? DottedBorder(
                color:appColor(context).primary,
                borderType: BorderType.RRect,
                strokeWidth: 1.3,
                radius: const Radius.circular(AppRadius.r30),
                child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color:appColor(context).primary,
                            shape: BoxShape.circle))
                    .paddingAll(.8))
            : Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: appColor(context).lightText,
                    shape: BoxShape.circle),
                child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: appColor(context).whiteColor,
                                width: 2),
                            color: appColor(context).lightText,
                            shape: BoxShape.circle))
                    .paddingAll(Insets.i1)),
        SvgPicture.asset(eSvgAssets.anchorStatusArrow,
            colorFilter: ColorFilter.mode(
                selectIndex == index
                    ? appColor(context).primary
                    : appColor(context).stroke,
                BlendMode.srcIn))
      ]),
      const HSpace(Sizes.s12),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IntrinsicHeight(
            child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(DateFormat("dd MM").format(DateTime.parse(data!.createdAt!)),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText)),
            Text(DateFormat("hh:mm aa").format(DateTime.parse(data!.createdAt!)),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText))
          ]),
          VerticalDivider(
                  width: 1,
                  thickness: 1,
                  endIndent: 2,
                  indent: 2,
                  color: appColor(context).stroke)
              .paddingSymmetric(horizontal: Insets.i9),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(data!.title!,
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText)),
            SizedBox(
                width: Sizes.s160,
                child: Text(data!.description!,
                    overflow: TextOverflow.ellipsis,
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText)))
          ])
        ])),
        const VSpace(Sizes.s15),
        if (index != list!.length - 1)
          const DottedLines().paddingOnly(bottom: Insets.i15)
      ]))
    ]).paddingSymmetric(horizontal: Insets.i15);
  }
}
