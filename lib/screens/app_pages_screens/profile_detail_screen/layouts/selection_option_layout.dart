import '../../../../config.dart';

class SelectOptionLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index;
  const SelectOptionLayout({super.key,this.onTap,this.data,this.list,this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
              children: [
                SvgPicture.asset(data["image"])
                    .paddingAll(Insets.i10)
                    .decorated(
                    color: appColor(context)
                        
                        .primary
                        .withOpacity(0.1),
                    shape: BoxShape.circle),
                const HSpace(Sizes.s15),
                Text(language(context, data["title"]),style: appCss.dmDenseMedium14.textColor(appColor(context).darkText))
              ]
          ),
          if( index != list!.length - 1)
            Divider(height: 1,color: appColor(context).stroke).paddingSymmetric(vertical: Insets.i20)
        ]
    ).inkWell(onTap: onTap);
  }
}

class SelectOrderCancelOrRepayment extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index;
  const SelectOrderCancelOrRepayment({super.key,this.onTap,this.data,this.list,this.index});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(language(context, data["title"]),style: appCss.dmDenseMedium14.textColor(appColor(context).whiteBg)),

        ]
    ).paddingAll(Insets.i15).boxBorderExtension(context,color: appColor(context).primary).marginOnly(bottom: Insets.i10).inkWell(onTap: onTap);
  }
}