import 'package:flutter/cupertino.dart';

import '../../../../config.dart';

class ServiceLayout extends StatelessWidget {
  final String? price,title,image;
  final TextStyle? style;
  final bool isPackage;
  const ServiceLayout({super.key,this.title,this.price,this.style, this.isPackage =false, this.image});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
   image != null?   CachedNetworkImage(imageUrl: image!,imageBuilder: (context, imageProvider) => Container(
          height: Sizes.s68,
          width: Sizes.s68,
          decoration: ShapeDecoration(

              image: DecorationImage(
                  image: imageProvider,fit: BoxFit.cover),
              shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(
                          cornerRadius: AppRadius.r8,
                          cornerSmoothing: 1))))),placeholder: (context, url) => Container(
          height: Sizes.s68,
          width: Sizes.s68,
          decoration: ShapeDecoration(
              image: DecorationImage(
                  image: AssetImage(eImageAssets.es1)),
              shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(
                          cornerRadius: AppRadius.r8,
                          cornerSmoothing: 1))))),errorWidget: (context, url, error) => Container(
          height: Sizes.s68,
          width: Sizes.s68,
          decoration: ShapeDecoration(
              image: DecorationImage(
                  image: AssetImage(eImageAssets.noImageFound1)),
              shape: const SmoothRectangleBorder(
                  borderRadius: SmoothBorderRadius.all(
                      SmoothRadius(
                          cornerRadius: AppRadius.r8,
                          cornerSmoothing: 1)))))):Container(
       height: Sizes.s68,
       width: Sizes.s68,
       decoration: ShapeDecoration(
           image: DecorationImage(
               image: AssetImage(eImageAssets.noImageFound1)),
           shape: const SmoothRectangleBorder(
               borderRadius: SmoothBorderRadius.all(
                   SmoothRadius(
                       cornerRadius: AppRadius.r8,
                       cornerSmoothing: 1))))),
      const HSpace(Sizes.s12),
      Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title!,
                  style: appCss.dmDenseMedium14.textColor(
                      appColor(context)

                          .darkText)),
        
              Text( isPackage ?language(context, appFonts.priceDefine)  :"${getSymbol(context)}${(currency(context).currencyVal * double.parse(price!)).toStringAsFixed(1)}",
                  style: isPackage ? appCss.dmDenseMedium14
                      .textColor( appColor(context).lightText) : appCss.dmDenseSemiBold18
                      .textColor( isPackage? appColor(context).lightText: appColor(context).primary))
            ]),
      )
    ]).paddingAll(Insets.i12).boxShapeExtension(
        color: appColor(context).fieldCardBg);
  }
}
