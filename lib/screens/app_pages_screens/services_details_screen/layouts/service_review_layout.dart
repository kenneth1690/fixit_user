
import '../../../../config.dart';

class ServiceReviewLayout extends StatelessWidget {
  final Reviews? data;
  final List? list;
  final int? index;

  const ServiceReviewLayout({super.key, this.data, this.index, this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: data!.media != null && data!.media!.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: data!.media![0].originalUrl!,
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
                              image: AssetImage(eImageAssets.noImageFound1),fit: BoxFit.cover))))
              : Container(
                  height: Sizes.s40,
                  width: Sizes.s40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(eImageAssets.noImageFound1),fit: BoxFit.contain))),

          title: Text(data!.consumer!.name!,
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText)),
          subtitle:data!.createdAt != null ? Text( getTime(DateTime.parse(data!.createdAt!)),
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).lightText)):Container(),
          trailing: Row(mainAxisSize: MainAxisSize.min, children: [
            SvgPicture.asset(eSvgAssets.star),
            const HSpace(Sizes.s4),
            Text(data!.rating.toString(),
                style: appCss.dmDenseMedium12
                    .textColor(appColor(context).darkText))
          ])),
      const VSpace(Sizes.s5),
      Text(data!.description ?? "",
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).darkText))
          .paddingOnly(bottom: Insets.i15)
    ]))
        .paddingSymmetric(horizontal: Insets.i15)
        .boxBorderExtension(context)
        .paddingOnly(bottom: index != list!.length - 1 ? Insets.i10 : 0);
  }
}

