import '../../../../config.dart';

class AuthButtonCommon extends StatelessWidget {
  final String? logo,title;
  final GestureTapCallback? onTap;
  const AuthButtonCommon({super.key,this.onTap,this.title,this.logo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
          child: IntrinsicHeight(
            child: Row(
                children: [
                  Image.asset(logo!,height: Sizes.s35,width: Sizes.s35),
                  VerticalDivider(color: appColor(context).stroke,width: 1,thickness: 1,indent: 7,endIndent: 7).paddingSymmetric(horizontal: Insets.i10),
                  SizedBox(
                      width: Sizes.s60,
                      child: Text(language(context, title!),overflow: TextOverflow.ellipsis,style: appCss.dmDenseMedium14.textColor(appColor(context).darkText)))
                ]
            ).paddingAll(Insets.i15),
          )).decorated(color: appColor(context).fieldCardBg,borderRadius: BorderRadius.circular(AppRadius.r12)).inkWell(onTap: onTap),
    );
  }
}
