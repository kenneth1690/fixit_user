import '../../../config.dart';

class BulletLayout extends StatelessWidget {
  final CurrencyModel? data;
  final GestureTapCallback? onTap;
  final String? currency;
  final int? selectedIndex, index;

  const BulletLayout(
      {super.key,
      this.data,
      this.onTap,
      this.currency,
      this.index,
      this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(vertical: -1),
            dense: true,
            leading:
       data!.media != null && data!.media!.isNotEmpty ?
                CachedNetworkImage(
              imageUrl: data!.media![0].originalUrl!,
              imageBuilder: (context, imageProvider) => Image(
                  image: imageProvider,
                  alignment: Alignment.center,
                  height: Sizes.s24),
              placeholder: (context, url) => Image.asset(
                  eImageAssets.noImageFound1,
                  alignment: Alignment.center,
                  height: Sizes.s24),
              errorWidget: (context, url, error) => Image.asset(
                  eImageAssets.noImageFound1,
                  alignment: Alignment.center,
                  height: Sizes.s24),
            ):Image.asset(eImageAssets.noImageFound1,alignment: Alignment.center,height: Sizes.s24),
            title: IntrinsicHeight(
                child: Row(children: [
              VerticalDivider(
                  color: appColor(context).stroke,
                  width: 1,
                  indent: 3,
                  endIndent: 3),
              const HSpace(Sizes.s12),
              Text(
                language(context, data!.code.toString()),
                style: appCss.dmDenseLight14
                    .textColor(appColor(context).darkText),
              )
            ])),
            trailing: InkWell(
                onTap: onTap,
                child: selectedIndex == index
                    ? Container(
                        width: Sizes.s22,
                        height: Sizes.s22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appColor(context)

                                .primary
                                .withOpacity(0.12)),
                        child: Icon(Icons.circle,
                            color: appColor(context).primary,
                            size: Sizes.s13))
                    : Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: appColor(context).stroke)))))
        .paddingSymmetric(horizontal: Insets.i15)
        .decorated(
            color: appColor(context).whiteBg,
            border: Border.all(color: appColor(context).fieldCardBg),
            borderRadius: BorderRadius.circular(AppRadius.r12),
            boxShadow: [
          BoxShadow(
              color: appColor(context).fieldCardBg,
              spreadRadius: 1,
              blurRadius: 3)
        ]).paddingOnly(bottom: Insets.i12, right: Insets.i20, left: Insets.i20);
  }
}
