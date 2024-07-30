import 'package:fixit_user/models/blog_model.dart';
import 'package:fixit_user/widgets/common_image_layout.dart';
import 'package:intl/intl.dart';
import '../../../../config.dart';

class LatestBlogLayout extends StatelessWidget {
  final BlogModel? data;
  final GestureTapCallback? onTap;
  final double? rPadding;
  final bool? isView;

  const LatestBlogLayout(
      {super.key, this.onTap, this.data, this.rPadding, this.isView = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: Sizes.s257,
            child: Column(children: [
                CommonImageLayout(
                  image: data!.media != null && data!.media!.isNotEmpty? data!.media![0].originalUrl!:null,
                  assetImage:eImageAssets.noImageFound2 ,
                  height: Sizes.s155,
                  isAllBorderRadius: false,
                  tRRadius: 8,tlRadius: 8,bRRadius: 0,blRadius: 0
                ),
              //   Image.network(data!.media![0].originalUrl!),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: Sizes.s190,
                        child: Text(language(context, data!.title!),
                            overflow: TextOverflow.ellipsis,
                            style: appCss.dmDenseMedium16.textColor(
                                appColor(context).darkText))),
                    if (isView == true)
                      if (data!.tags != null && data!.tags!.isNotEmpty)
                        SizedBox(
                          width: Sizes.s70,
                          child: Text(data!.tags![0].name!,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: appCss.dmDenseMedium11.textColor(
                                      appColor(context).primary))
                              .paddingSymmetric(
                                  horizontal: Insets.i7, vertical: Insets.i5)
                              .decorated(
                                  borderRadius:
                                      BorderRadius.circular(AppRadius.r6),
                                  color: appColor(context)

                                      .primary
                                      .withOpacity(0.1)),
                        )
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Text(language(context, data!.description!),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: appCss.dmDenseRegular13
                            .textColor(appColor(context).lightText)),
                  ),
                ]),
                const VSpace(Sizes.s15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          DateFormat("dd MMM, yyyy")
                              .format(DateTime.parse(data!.createdAt!)),
                          style: appCss.dmDenseRegular13
                              .textColor(appColor(context).lightText)),
                      Row(
                        children: [
                          SvgPicture.asset(eSvgAssets.user,height: Sizes.s16),
                          const HSpace(Sizes.s5),
                          Text(
                              capitalizeFirstLetter(language(context, data!.createdBy!.name!)),
                              style: appCss.dmDenseRegular13
                                  .textColor(appColor(context).lightText)),
                        ],
                      )
                    ])
              ]).paddingAll(Insets.i12)
            ]))
        .decorated(
            color: appColor(context).whiteBg,
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                  color: appColor(context).darkText.withOpacity(0.06))
            ],
            borderRadius: BorderRadius.circular(AppRadius.r8),
            border: Border.all(color: appColor(context).stroke))
        .inkWell(
            onTap: () => route.pushNamed(context, routeName.latestBlogDetails,
                arg: data))
        .padding(right: rPadding ?? Insets.i15, vertical: Insets.i10);
  }
}
