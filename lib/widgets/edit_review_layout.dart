import '../config.dart';

class EditReviewLayout extends StatelessWidget {
  final dynamic data;
  final int? selectIndex,index;
  final GestureTapCallback? onTap;

  const EditReviewLayout({super.key, this.data,this.index,this.selectIndex,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      selectIndex == index?Image.asset(data['gif'],height: Sizes.s32,width: Sizes.s32,fit: BoxFit.scaleDown) .paddingAll(Insets.i6)
          .boxBorderExtension(context, isShadow: false,bColor: selectIndex == index ? appColor(context).primary : appColor(context).stroke ) :   SvgPicture.asset(data["icon"],height: Sizes.s32,width: Sizes.s32,fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  selectIndex == index ? appColor(context).primary : appColor(context).lightText, BlendMode.srcIn))
          .paddingAll(Insets.i6)
          .boxBorderExtension(context, isShadow: false,bColor: selectIndex == index ? appColor(context).primary : appColor(context).stroke ),
      const VSpace(Sizes.s6),
      SizedBox(

        child: Text(language(context, data["title"]),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
            style: appCss.dmDenseMedium12
                .textColor(selectIndex == index ? appColor(context).primary : appColor(context).lightText))
      )
    ]).inkWell(onTap: onTap);
  }
}
