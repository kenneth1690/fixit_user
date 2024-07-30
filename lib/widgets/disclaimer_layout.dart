import '../config.dart';

class DisclaimerLayout extends StatelessWidget {
  final String? title;
  final Color? color;
  const DisclaimerLayout({super.key,this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(language(context, appFonts.disclaimer),
            style: appCss.dmDenseSemiBold12.textColor(
                appColor(context).darkText))
            .paddingOnly(
            top: Insets.i15, bottom: Insets.i8),
        Text( language(context, title ?? language(context, appFonts.onceYouClick)),
            style: appCss.dmDenseMedium12.textColor(
              color ??  appColor(context).lightText)),
      ],
    );
  }
}
