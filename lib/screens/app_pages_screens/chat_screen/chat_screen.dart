import 'dart:developer';

import '../../../config.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context1, value, child) {
      return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            value.onBack(context, false);
            if (didPop) return;
          },
          child: StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 50),
                  () => value.onReady(context)),
              child: LoadingComponent(
                  child: Scaffold(
                      body: Column(children: [
                ChatAppBarLayout(onSelected: (index) {
                  log("SE :$index");
                  if (index == 1) {
                    value.onClearChat(context, this);
                  } else {
                    value.onTapPhone(context);
                  }
                }),
            /*    Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: value.localMessage.length,
                          itemBuilder: (context, index) {
                            log("chatCtrl.localMessage:${value.localMessage[index]}");
                            return value.timeLayout(
                                value.localMessage[index], context);
                          }).alignment(Alignment.bottomCenter)
                    ])),*/
                        Expanded(
                            child: ListView(
                              reverse: true,
                              children: [
                                value.timeLayout(context).marginOnly(bottom: Insets.i18)
                              ],
                            )),
                if (value.booking != null)
                  if (value.booking!.bookingStatus!.slug !=
                      appFonts.completed)
                    Row(children: [
                      // Text Field
                      Expanded(
                          child: TextFormField(
                              controller: value.controller,
                              style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).darkText),
                              cursorColor: appColor(context).darkText,
                              decoration: InputDecoration(
                                  fillColor: appColor(context).whiteBg,
                                  filled: true,
                                  isDense: true,
                                  disabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(AppRadius.r8)),
                                      borderSide: BorderSide.none),
                                  focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(AppRadius.r8)),
                                      borderSide: BorderSide.none),
                                  enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(AppRadius.r8)),
                                      borderSide: BorderSide.none),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(AppRadius.r8)),
                                      borderSide: BorderSide.none),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: Insets.i15, vertical: Insets.i15),
                                  prefixIcon: SvgPicture.asset(eSvgAssets.gallery, colorFilter: ColorFilter.mode(appColor(context).lightText, BlendMode.srcIn)).paddingSymmetric(horizontal: Insets.i20).inkWell(onTap: () => value.showLayout(context)),
                                  hintStyle: appCss.dmDenseMedium14.textColor(appColor(context).lightText),
                                  hintText: language(context, appFonts.writeHere),
                                  errorMaxLines: 2))),
                      const HSpace(Sizes.s8),
                      // Send button
                      SizedBox(
                              child: SvgPicture.asset(eSvgAssets.send)
                                  .paddingAll(Insets.i8))
                          .decorated(
                              color: appColor(context).primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(AppRadius.r6)))
                          .inkWell(
                              onTap: () => value.setMessage(
                                  value.controller.text,
                                  MessageType.text,
                                  context))
                    ])
                        .paddingOnly(
                      bottom: Sizes.s10,
                            right: rtl(context) ? 0 : Insets.i20,
                            left: rtl(context) ? Insets.i20 : 0)
                        .boxBorderExtension(context, isShadow: true, radius: 0)
              ])))));
    });
  }
}
