import '../config.dart';

class BillSummaryLayout extends StatelessWidget {
  final String? balance;
  const BillSummaryLayout({super.key,this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(language(context, appFonts.billSummary),
          style: appCss.dmDenseMedium14
              .textColor(appColor(context).darkText)),
      Text("${language(context, appFonts.wallet)}: ${"$balance"}",
          style: appCss.dmDenseMedium12
              .textColor(appColor(context).online))
    ]);
  }
}
