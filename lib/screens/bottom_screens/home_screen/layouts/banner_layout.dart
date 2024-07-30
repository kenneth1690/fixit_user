import 'dart:ffi';

import '../../../../config.dart';

class BannerLayout extends StatelessWidget {
  final List<BannerModel>? bannerList;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;
  final Function(String, String)? onTap;

  const BannerLayout(
      {super.key, this.bannerList, this.onPageChanged, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            options: CarouselOptions(
                height: Sizes.s240,
                viewportFraction: 1,
                enlargeCenterPage: false,
                reverse: false,
                onPageChanged: onPageChanged),
            items: bannerList!.map((i) {
              return Builder(builder: (BuildContext context) {
                return CachedNetworkImage(
                    imageUrl: i.media![0].originalUrl!,
                    imageBuilder: (context, imageProvider) => Container(
                        width: double.parse(i.media![0].size!),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill))),
                    placeholder: (context, url) => Container(
                        width: double.parse(i.media![0].size!),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(eImageAssets.noImageFound2)))),
                    errorWidget: (context, url, error) => Image.asset(
                        eImageAssets.noImageFound2,
                        width: MediaQuery.of(context).size.width)).inkWell(
                  onTap: () => onTap!(i.type!, i.relatedId!),
                );
              });
            }).toList())
        .paddingOnly(top: Insets.i20);
  }
}
