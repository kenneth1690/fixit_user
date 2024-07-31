import 'dart:convert';

import '../../../config.dart';

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({super.key});

  @override
  State<WalletBalanceScreen> createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen>
    with TickerProviderStateMixin {
  // defining the Animation Controller
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true);

  // defining the Offset of the animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
          begin: Offset.zero, end: const Offset(1, 0.0))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((_) => value.getUserDetail(context)),
        child: LoadingComponent(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  centerTitle: true,
                  title: Text(language(context, appFonts.walletBalance),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => route.pop(context)).paddingAll(Insets.i8),
                  actions: [
                    CommonArrow(
                            arrow: eSvgAssets.add,
                            onTap: () => value.onAddMoney(context))
                        .paddingOnly(
                            right: rtl(context) ? 0 : Insets.i20,
                            left: rtl(context) ? Insets.i20 : 0)
                  ]),
              body: RefreshIndicator(
                onRefresh: () async {
                  return value.getWalletList(context);
                },
                child: ListView(children: [
                  const VSpace(Sizes.s20),
                  BalanceLayout(
                    isGuest: value.isGuest,
                          offsetAnimation: _offsetAnimation,
                          totalBalance : value.balance.toString(),
                          isTap: false)
                      .paddingSymmetric(horizontal: Insets.i20),
                  const VSpace(Sizes.s30),
                  if (value.walletList.isEmpty)
                    const CommonEmpty()
                        .height(MediaQuery.of(context).size.height / 1.5),
                  if (value.walletList.isNotEmpty)
                    Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(language(context, appFonts.history),
                              style: appCss.dmDenseBold16
                                  .textColor(appColor(context).darkText)),
                          const VSpace(Sizes.s15),
                          ...value.walletList
                              .asMap()
                              .entries
                              .map((e) => HistoryLayout(data: e.value)),
                          const VSpace(Sizes.s15)
                        ])
                        .width(MediaQuery.of(context).size.width)
                        .padding(top: Insets.i15, horizontal: Insets.i20)
                        .decorated(
                            color: appColor(context).fieldCardBg,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppRadius.r15),
                                topRight: Radius.circular(AppRadius.r15)))
                ]),
              )),
        ),
      );
    });
  }
}
