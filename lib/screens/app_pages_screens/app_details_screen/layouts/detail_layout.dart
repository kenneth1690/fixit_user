import '../../../../config.dart';

class AppDetailsLayout extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;
  final List? list;
  final int? index;

  const AppDetailsLayout(
      {super.key, this.onTap, this.data, this.list, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          CommonArrow(arrow: data["icon"]),
          const HSpace(Sizes.s15),
          Text(language(context, data["title"]),
              style: appCss.dmDenseMedium14
                  .textColor(appColor(context).darkText))
        ]),
        if (index != list!.length - 1)
          Divider(height: 1, color: appColor(context).fieldCardBg)
              .paddingSymmetric(vertical: Insets.i12)
      ],
    ).inkWell(onTap: onTap);
  }
}
