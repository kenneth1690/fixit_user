import '../../../../config.dart';

class ProfileOptionLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index,mainIndex;

  const ProfileOptionLayout(
      {super.key, this.data, this.onTap, this.list, this.index, this.mainIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                CommonArrow(
                    arrow: data.icon,
                    color: mainIndex == 3? appColor(context).whiteColor:appColor(context).fieldCardBg,
                    svgColor:mainIndex == 3? appColor(context).red: appColor(context).darkText),
                const HSpace(Sizes.s15),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(language(context, data.title),
                      style: appCss.dmDenseMedium14
                          .textColor(mainIndex == 3? appColor(context).red:appColor(context).darkText)),
                  if (data.description != null)
                    SizedBox(
                      width: 200,
                      child: Text(language(context, appFonts.aboutUs),overflow: TextOverflow.ellipsis,
                          style: appCss.dmDenseMedium12
                              .textColor(appColor(context).lightText)),
                    )
                ])
              ]),
              if(data.isArrow == true)
              SvgPicture.asset(rtl(context) ? eSvgAssets.arrowLeft : eSvgAssets.arrowRight,
                  colorFilter: ColorFilter.mode(
                      appColor(context).lightText, BlendMode.srcIn))
            ]),
            if (index != list!.length - 1)
              Divider(
                      height: 0,
                      color: appColor(context).fieldCardBg,
                      thickness: 1)
                  .paddingSymmetric(vertical: Insets.i12)
          ])
        ]).inkWell(onTap: onTap);
  }
}
