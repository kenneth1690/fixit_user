import '../../../../config.dart';

class CompletedStatusLayout extends StatelessWidget {
  const CompletedStatusLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(language(context, "${appFonts.status}:"),
                style: appCss.dmDenseMedium14
                    .textColor(appColor(context).red)),
            const HSpace(Sizes.s10),
            Expanded(
                child: Text(language(context, appFonts.statusHasNotBeen),
                    overflow: TextOverflow.fade,
                    style: appCss.dmDenseRegular14.textColor(
                        appColor(context).red)))
          ]).paddingAll(Insets.i15),
    ).boxShapeExtension(
        color:
        appColor(context).red.withOpacity(0.1));
  }
}
