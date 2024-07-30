import 'package:fixit_user/models/app_setting_model.dart';
import 'package:fixit_user/widgets/common_image_layout.dart';

import '../../../../config.dart';

class PaymentMethodLayout extends StatelessWidget {
  final PaymentMethods? data;

  //final dynamic? data;
  final int? index, selectIndex;
  final GestureTapCallback? onTap;

  const PaymentMethodLayout(
      {super.key, this.data, this.onTap, this.index, this.selectIndex});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<PaymentProvider>(context, listen: true);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        if(data!.slug != "cash")
        CommonImageLayout(
          height: Sizes.s45,
          boxFit: BoxFit.contain,
          width: Sizes.s70,image: data!.image,assetImage: eImageAssets.noImageFound1
        ),
        /* SvgPicture.asset(data["image"],colorFilter: ColorFilter.mode( selectIndex == index ? appColor(context).primary : appColor(context).darkText , BlendMode.srcIn),).paddingAll(Insets.i10).decorated(
              color: selectIndex == index
                  ? appColor(context).primary.withOpacity(0.1)
                  : appColor(context).fieldCardBg,
              shape: BoxShape.circle),*/
          const HSpace(Sizes.s12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(language(context, data!.name!).capitalizeFirst(),
                  style: appCss.dmDenseSemiBold16.textColor(selectIndex == index
                      ? appColor(context).primary
                      : appColor(context).darkText))
              ,
        ])
      ]),
      CommonRadio(index: index, selectedIndex: selectIndex, onTap: onTap)
    ])
        .paddingSymmetric(vertical: Insets.i12, horizontal: Insets.i15)
        .boxBorderExtension(context,
            bColor: selectIndex == index
                ? appColor(context).stroke
                : appColor(context).fieldCardBg,
            isShadow: selectIndex == index ? false : true)
        .paddingSymmetric(vertical: Insets.i10,horizontal: Sizes.s20).inkWell(onTap: onTap) ;
  }
}
