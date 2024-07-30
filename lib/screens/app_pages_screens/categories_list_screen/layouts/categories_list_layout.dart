import '../../../../config.dart';

class CategoriesListLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  const CategoriesListLayout({super.key,this.data,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CachedNetworkImage(
              imageUrl: data!.media![0].originalUrl!,

              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,fit: BoxFit.cover,
                height: Sizes.s20,
                width: Sizes.s20),

              errorWidget: (context, url, error) => Image.asset(
                  eImageAssets.noImageFound1,
                  fit: BoxFit.fill,
                  height: Sizes.s22,
                  width: Sizes.s22)
            ),
            const HSpace(Sizes.s15),
            Text(language(context, data!.title!),style: appCss.dmDenseMedium14.textColor(appColor(context).darkText))
          ]),
          SvgPicture.asset(rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,colorFilter: ColorFilter.mode(appColor(context).lightText, BlendMode.srcIn))
        ]
    ).paddingAll(Insets.i15).boxBorderExtension(context,isShadow: true).inkWell(onTap: onTap).paddingOnly(bottom: Insets.i12);
  }
}
