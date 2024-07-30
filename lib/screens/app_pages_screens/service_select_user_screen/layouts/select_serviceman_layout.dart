import '../../../../config.dart';

class SelectServicemanLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  const SelectServicemanLayout({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(language(context, appFonts.selectServicemen),
            style: appCss.dmDenseMedium14
                .textColor(appColor(context).darkText)),
        const VSpace(Sizes.s10),
        DottedBorder(
            color: appColor(context).primary,
            borderType: BorderType.RRect,
            radius: const Radius.circular(AppRadius.r10),
            child: ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(AppRadius.r8)),
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    color: appColor(context).primary.withOpacity(0.1),
                    child: Text("+ ${language(context, appFonts.selectServicemen)}",
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).primary))
                        .paddingSymmetric(vertical: Insets.i26)))).inkWell(onTap: onTap),
      ],
    );
  }
}
