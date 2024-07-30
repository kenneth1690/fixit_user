import '../../../../config.dart';

class FavouriteListLayout extends StatelessWidget {
  final FavouriteModel? data;
  final GestureTapCallback? onTap,heartTap;

  const FavouriteListLayout({super.key, this.onTap, this.data, this.heartTap});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            data!.provider!.media != null && data!.provider!.media!.isNotEmpty?  CachedNetworkImage(
              imageUrl: data!.provider!.media![0].originalUrl!,
              imageBuilder: (context, imageProvider) =>
                  Image(image: imageProvider, height: Sizes.s72).decorated(
                      borderRadius: BorderRadius.circular(AppRadius.r6)),
              errorWidget: (context, url, error) => Image.asset(
                  eImageAssets.noImageFound1, height: Sizes.s72)
                  .decorated(
                  borderRadius: BorderRadius.circular(AppRadius.r6))):Image.asset(
                eImageAssets.noImageFound1, height: Sizes.s72)
                .decorated(
                borderRadius: BorderRadius.circular(AppRadius.r6)),
            const HSpace(Sizes.s12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(language(context, data!.provider!.name),
                  style: appCss.dmDenseMedium15
                      .textColor(appColor(context).darkText)),
              if( data!.provider!.description != null)
                SizedBox(
                    width: Sizes.s180,
                    child: Text(language(context, data!.provider!.description),
                        overflow: TextOverflow.ellipsis,
                        style: appCss.dmDenseMedium12
                            .textColor(appColor(context).lightText))),
              const VSpace(Sizes.s10),
              Row(children: [
                SvgPicture.asset(eSvgAssets.star),
                const HSpace(Sizes.s4),
                Text(data!.provider!.reviewRatings != null ? data!.provider!
                    .reviewRatings.toString() : "0.0",
                    style: appCss.dmDenseMedium13
                        .textColor(appColor(context).darkText))
              ])
            ])
          ]),
          SvgPicture.asset(eSvgAssets.heart).inkWell(onTap:heartTap )
        ]).paddingAll(Insets.i15).boxBorderExtension(context).inkWell(onTap: onTap).paddingOnly(
        bottom: Insets.i15);
  }
}
