import 'dart:developer';

import 'package:fixit_user/widgets/common_image_layout.dart';
import 'package:intl/intl.dart';

import '../../../../config.dart';

class ChatHistoryLayout extends StatelessWidget {
  final dynamic data;
  final List? list;
  final int? index;
  final GestureTapCallback? onTap;

  const ChatHistoryLayout(
      {super.key, this.data, this.list, this.index, this.onTap});

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CommonImageLayout(isCircle: true,image: data['receiverImage'],assetImage: eImageAssets.noImageFound3,    height: Sizes.s45,
                width: Sizes.s45),
             /* Container(
                  height: Sizes.s45,
                  width: Sizes.s45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(data['receiverImage']),
                          fit: BoxFit.cover))),*/
              const HSpace(Sizes.s10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("#${data['bookingId']}",
                    style: appCss.dmDenseMedium14
                        .textColor(appColor(context).darkText)),
                const VSpace(Sizes.s2),
                Text(  data['senderId'].toString() == userModel!.id.toString()?  data["receiverName"]:data['senderName'],
                    style: appCss.dmDenseMedium12
                        .textColor(appColor(context).lightText))
              ])
            ]),
            Text(
                DateFormat('dd MMM yyyy').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.parse(data["updateStamp"].toString()))),
                style: appCss.dmDenseRegular12
                    .textColor(appColor(context).lightText))
          ]).inkWell(onTap: onTap),
      if (index != list!.length - 1)
        const DividerCommon().paddingSymmetric(vertical: Insets.i15)
    ]);
  }
}
