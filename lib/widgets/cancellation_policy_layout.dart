import '../config.dart';

class CancellationPolicyLayout extends StatelessWidget {
  const CancellationPolicyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${language(
              context, appFonts.cancellationPolicyStar).replaceAll("*", "")} & ${language(context, appFonts.disclaimer).replaceAll("*","")}",
              style: appCss.dmDenseSemiBold12.textColor(
                  appColor(context).red)),
          const VSpace(Sizes.s6),
          Text(language(context, appFonts.onceYouClick),
              style: appCss.dmDenseMedium12.textColor(
                  appColor(context).red)),
        ]
    ).paddingAll(Insets.i12).boxShapeExtension(
        color: appColor(context).red
            .withOpacity(0.1));
  }
}
