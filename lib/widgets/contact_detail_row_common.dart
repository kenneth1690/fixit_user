import '../config.dart';

class ContactDetailRowCommon extends StatelessWidget {
  final String? image,title;
  const ContactDetailRowCommon({super.key,this.title,this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SvgPicture.asset(image!,height: Sizes.s20,width: Sizes.s20,colorFilter: ColorFilter.mode(appColor(context).primary, BlendMode.srcIn)),
          const HSpace(Sizes.s10),
          Expanded(
            child: Text(title!, style: appCss.dmDenseMedium12
                .textColor(appColor(context).darkText))
          )
        ]
    );
  }
}
