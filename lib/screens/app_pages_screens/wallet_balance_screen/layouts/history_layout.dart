import 'package:intl/intl.dart';

import '../../../../config.dart';

class HistoryLayout extends StatelessWidget {
  final WalletList? data;
  const HistoryLayout({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: Text(data!.detail!,overflow: TextOverflow.ellipsis,style: appCss.dmDenseSemiBold14
                        .textColor(appColor(context).darkText))
                ),
                const VSpace(Sizes.s3),
                Text(DateFormat("dd MMM,yyyy").format(DateTime.parse(data!.createdAt!)),style: appCss.dmDenseRegular13
                    .textColor(appColor(context).lightText))
              ]
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("${currency(context).priceSymbol}${(currency(context).currencyVal * data!.amount!).ceilToDouble()}",style: appCss.dmDenseSemiBold14
                    .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s3),
                Text(data!.type!.toString().capitalizeFirst() ,style: appCss.dmDenseMedium12
                    .textColor( data!.type! == "credit" ? appColor(context).online : appColor(context).red))
              ]
          )
        ]
    ).paddingAll(Insets.i12).boxShapeExtension(color: appColor(context).whiteBg,radius: AppRadius.r8).paddingOnly(bottom: Insets.i15);
  }
}
