import 'dart:developer';

import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../models/message_model.dart';

class ChatLayout extends StatelessWidget {
  final MessageModel? document;
  final AlignmentGeometry? alignment;
  final bool? isSentByMe;

  const ChatLayout({super.key, this.document, this.alignment, this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    log("message ::${document!.type}");
    return Row(
      mainAxisAlignment:
      isSentByMe == true ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(document!.type == MessageType.text.name)
          Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Insets.i15, vertical: Insets.i15),
              decoration: BoxDecoration(
                  color: isSentByMe == true
                      ? appColor(context).primary
                      : appColor(context).fieldCardBg,
                  borderRadius: rtl(context)
                      ? BorderRadius.only(
                      topRight: const Radius.circular(Insets.i20),
                      topLeft: const Radius.circular(Insets.i20),
                      bottomRight: Radius.circular(
                          isSentByMe == true ? Insets.i20 : 0),
                      bottomLeft: Radius.circular(
                          isSentByMe == true ? 0 : Insets.i20))
                      : BorderRadius.only(
                      topRight: const Radius.circular(Insets.i20),
                      topLeft: const Radius.circular(Insets.i20),
                      bottomRight: Radius.circular(
                          isSentByMe == true ? 0 : Insets.i20),
                      bottomLeft: Radius.circular(
                          isSentByMe == true ? Insets.i20 : 0))),
              child: Column(
                  crossAxisAlignment: isSentByMe == true
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(document!.content.toString(),
                        style: appCss.dmDenseMedium14.textColor(
                            isSentByMe == true
                                ? appColor(context).whiteColor
                                : appColor(context).darkText)),
                    Row(children: [
                      if (document!.isSeen == true)
                        SvgPicture.asset(eSvgAssets.doubleTick)
                            .paddingOnly(right: Insets.i5),
                      Text(DateFormat('hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(document!.timestamp!))),
                          style: appCss.dmDenseRegular13.textColor(
                              isSentByMe == true
                                  ? appColor(context).whiteColor
                                  : appColor(context).lightText))
                    ])
                  ]))
              .paddingSymmetric(horizontal: Insets.i20, vertical: Insets.i15),
        if(document!.type == MessageType.image.name)
          Material(elevation: 1,
            borderRadius: SmoothBorderRadius(cornerRadius: 15,cornerSmoothing: 1),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              placeholder: (context, url) => Container(
                  width: Sizes.s160,

                  decoration: ShapeDecoration(
                    color: appColor(context).primary,shadows: [
                    BoxShadow(
                        color: appColor(context).darkText.withOpacity(0.06),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: const Offset(0,2)
                    )
                  ],
                    shape:  SmoothRectangleBorder(
                        borderRadius:SmoothBorderRadius(cornerRadius: 10,cornerSmoothing: 1)),
                  ),
                  child: Container()),
              imageUrl: document!.content!,
              width: Sizes.s160,

              fit: BoxFit.fill,
            ),
          ).padding(horizontal:Insets.i20,top: Insets.i10,vertical: Insets.i10)
      ],
    );
  }
}
