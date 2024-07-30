
import 'package:fixit_user/widgets/common_cached_image.dart';
import 'package:fixit_user/widgets/common_image_layout.dart';

import '../../../../config.dart';

class ExpertServiceLayout extends StatelessWidget {
  final ProviderModel? data;
  final GestureTapCallback? onTap;
final bool isHome;
  const ExpertServiceLayout({super.key, this.data, this.onTap, this.isHome =false});

  @override
  Widget build(BuildContext context) {

    return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Row(
            children: [
              data != null && data!.media!.isNotEmpty
                  ?
              CommonImageLayout(
                height: Sizes.s72,
                width: Sizes.s72,radius: 8,image:  data!.media![0].originalUrl!,assetImage:eImageAssets.noImageFound3 ,
              ).boxShapeExtension()
                  : CommonCachedImage(
                image: eImageAssets.noImageFound3,
                  assetImage: eImageAssets.noImageFound3,
                  height: Sizes.s72,
                  width: Sizes.s72
              ).boxShapeExtension(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(capitalizeFirstLetter(data != null ? data!.name! : "Provider"),
                    style: appCss.dmDenseSemiBold15
                        .textColor(appColor(context).darkText)),
                SizedBox(
                    width: Sizes.s160,
                    child: Text(data!.categories != null && data!.categories!.isNotEmpty?  data!.categories![0].title!: data!.expertise != null  && data!.expertise!.isNotEmpty ? data!.expertise![0].title! :"Services",
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseSemiBold12
                            .textColor(appColor(context).darkText))),
                const VSpace(Sizes.s15),

                  Row(children: [
                    SvgPicture.asset(eSvgAssets.locationOut,height: Sizes.s20),
                    const HSpace(Sizes.s5),
                    SizedBox(
                        width: Sizes.s140,
                        child: Text(
                            data != null && data!.primaryAddress != null
                                ? "${data!.primaryAddress!.address!}${data!.primaryAddress!.area != null ? ", ${data!.primaryAddress!.area}" : ""}, ${data!.primaryAddress!.city}"
                                : "Address Not Provided",
                            overflow: TextOverflow.ellipsis,
                            style: appCss.dmDenseSemiBold12.textColor(
                                appColor(context).lightText)))
                  ])
              ]).paddingOnly(left: Insets.i10),
            ],
          ),
          Row(children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s3),
            Text(
                data!.reviewRatings != null
                    ? data!.reviewRatings.toString()
                    : "0",
                style: appCss.dmDenseSemiBold13
                    .textColor(appColor(context).darkText))
          ])
        ])
        .paddingAll(Insets.i15)
        .boxBorderExtension(context,isShadow: isHome)
        .inkWell(onTap: onTap)
        .paddingOnly(bottom: Insets.i15);
  }
}
