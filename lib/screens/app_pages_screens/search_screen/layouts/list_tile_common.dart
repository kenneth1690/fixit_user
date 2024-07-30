import 'package:cached_network_image/cached_network_image.dart';

import '../../../../config.dart';

class ListTileLayout extends StatelessWidget {
  final CategoryModel? data;
  final bool? isBooking;
  final int? index;
  final GestureTapCallback? onTap;
  final List? selectedCategory;

  const ListTileLayout(
      {super.key, this.data, this.onTap, this.selectedCategory,this.isBooking = false,this.index});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IntrinsicHeight(
          child: Row(children: [

        data!.media != null && data!.media!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: data!.media![0].originalUrl!,
                imageBuilder: (context, imageProvider) => Container(
                      height: Sizes.s20,
                      width: Sizes.s20,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider)),
                    ),
                errorWidget: (context, url, error) => Image.asset(
                    eImageAssets.appLogo,
                    height: Sizes.s20,
                    width: Sizes.s20))
            : Image.asset(eImageAssets.appLogo,
                height: Sizes.s20, width: Sizes.s20),
        VerticalDivider(
                indent: 4,
                endIndent: 4,
                width: 1,
                color: appColor(context).stroke)
            .paddingSymmetric(horizontal: Insets.i12),
           Text(language(context, data!.title),
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).darkText))
      ])),
      CheckBoxCommon(
          isCheck: selectedCategory!.contains(data!.id), onTap: onTap)
    ])
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context, isShadow: true,bColor: Color(0xFFF5F6F7))
        .padding(horizontal: Insets.i20, bottom: Insets.i12);
  }
}
