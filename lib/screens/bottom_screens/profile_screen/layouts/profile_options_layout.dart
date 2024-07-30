import '../../../../config.dart';

class ProfileOptionsLayout extends StatelessWidget {
  final AnimationController controller;
  final TickerProvider? sync;

  const ProfileOptionsLayout({super.key, required this.controller, this.sync});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProfileProvider>(context, listen: true);

    return Column(
        children: value.profileLists
            .asMap()
            .entries
            .map((e) =>
            e.key == 3 &&  value.isGuest ? Container():    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (e.key != 2)
                   e.key == 3 ?Container(padding: const EdgeInsets.symmetric(vertical: Insets.i15)):  Text(
                            language(context, e.value.title)
                                .toString()
                                .toUpperCase(),
                            style: appCss.dmDenseBold14.textColor(e.key == 3
                                ? appColor(context).red
                                : appColor(context).primary))
                        .paddingSymmetric(vertical: Insets.i15),
                  if (e.value.data != null)
                    Container(
                        decoration: ShapeDecoration(
                            color:e.key == 3? appColor(context).red.withOpacity(0.10): appColor(context).whiteBg,
                            shadows: [
                              BoxShadow(
                                  color: e.key == 3
                                      ? appColor(context)
                                          
                                          .red
                                          .withOpacity(0.06)
                                      : appColor(context)
                                          
                                          .darkText
                                          .withOpacity(0.06),
                                  spreadRadius: 1,
                                  blurRadius: 2)
                            ],
                            shape: SmoothRectangleBorder(
                                side: BorderSide(
                                    color:  appColor(context)
                                            
                                            .fieldCardBg),
                                borderRadius: SmoothBorderRadius(
                                    cornerRadius: AppRadius.r12,
                                    cornerSmoothing: 1))),
                        child: Column(children: [
                          ...e.value.data!.asMap().entries.map((s) =>
                              ProfileOptionLayout(
                                  data: s.value,
                                  index: s.key,
                                  mainIndex: e.key,
                                  list: e.value.data,
                                  onTap: () => value.onTapOption(
                                      s.value, context, controller, sync))),
                        ]).paddingAll(Insets.i15)),
                  if (e.key == 2) const BecomeProviderLayout()
                ]))
            .toList());
  }
}
