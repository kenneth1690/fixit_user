import '../../../../config.dart';

class ServicemanLayout extends StatelessWidget {
  final String? image, title, rate, exp,expYear;
  final Color? color;
  final GestureTapCallback? editTap, tileTap;

  const ServicemanLayout(
      {super.key,
      this.title,
      this.image,
      this.rate,
      this.exp,
      this.editTap,
      this.tileTap,this.color,this.expYear});

  @override
  Widget build(BuildContext context) {
    return /*ListTile(
            onTap:
                tileTap *//*route.pushNamed(context, routeName.servicemanDetailScreen)*//*,
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: image != null
                ? CachedNetworkImage(
                imageUrl: image!,
                imageBuilder: (context, imageProvider) => Container(
                    height: Sizes.s40,
                    width: Sizes.s40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: imageProvider))),
                errorWidget: (context, url, error) => Container(
                    height: Sizes.s40,
                    width: Sizes.s40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(eImageAssets.noImageFound1)))))
                : Container(
                height: Sizes.s40,
                width: Sizes.s40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(eImageAssets.noImageFound1)))),
            title: IntrinsicHeight(
                child: Row(children: [
              Text(title!,
                  style: appCss.dmDenseMedium14
                      .textColor(appColor(context).darkText)),
              VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: appColor(context).stroke,
                      indent: 6,
                      endIndent: 6)
                  .paddingSymmetric(horizontal: Insets.i6),
              Row(children: [
                SvgPicture.asset(eSvgAssets.star),
                const HSpace(Sizes.s4),
                Text(rate!,
                    style: appCss.dmDenseMedium13
                        .textColor(appColor(context).darkText))
              ])
            ])),
            subtitle: Text(language(context, "${exp!} $expYear ${language(context, appFonts.of)} ${language(context, appFonts.experience)}"),
                style: appCss.dmDenseMedium12
                    .textColor( color ?? appColor(context).darkText)),
            trailing: SvgPicture.asset(eSvgAssets.edit, height: Sizes.s24,)
                .inkWell(
                    onTap:
                        editTap *//*route.pushNamed(context, routeName.servicemanListScreen)*//*))*/

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Row(
        children: [
          image != null
              ? CachedNetworkImage(
              imageUrl: image!,
              imageBuilder: (context, imageProvider) => Container(
                  height: Sizes.s40,
                  width: Sizes.s40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider))),
              errorWidget: (context, url, error) => Container(
                  height: Sizes.s40,
                  width: Sizes.s40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound1)))))
              : Container(
              height: Sizes.s40,
              width: Sizes.s40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(eImageAssets.noImageFound1)))),
          const HSpace(Sizes.s12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                  child: Row(children: [
                    Text(title!,
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).darkText)),
                    VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: appColor(context).stroke,
                        indent: 6,
                        endIndent: 6)
                        .paddingSymmetric(horizontal: Insets.i6),
                    Row(children: [
                      SvgPicture.asset(eSvgAssets.star),
                      const HSpace(Sizes.s4),
                      Text(rate!,
                          style: appCss.dmDenseMedium13
                              .textColor(appColor(context).darkText))
                    ])
                  ])),
              Text(language(context, "${exp!} ${expYear != null ? capitalizeFirstLetter(expYear): "Years"} ${appFonts.of} ${language(context, appFonts.experience)}"),
                  style: appCss.dmDenseMedium12
                      .textColor( color ?? appColor(context).darkText))
            ],
          )
        ],
      ),
      SvgPicture.asset(eSvgAssets.edit, height: Sizes.s24,)
        .inkWell(
    onTap:
    editTap)
    ],)
        .paddingSymmetric(horizontal: Insets.i15,vertical: Insets.i15)
        .boxBorderExtension(context,
            color: appColor(context).fieldCardBg);
  }
}
