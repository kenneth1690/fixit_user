import '../../../../config.dart';

class AppDetailsLayout extends StatelessWidget {
  final PagesModel? data;
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
          SizedBox(
            height: Sizes.s40,
            width: Sizes.s40,
            child: Image.network(
              data!.media![0].originalUrl!,
              fit: BoxFit.scaleDown,
              color: appColor(context).darkText,
              height: Sizes.s18,width: Sizes.s18
            ).paddingAll(Sizes.s10),
          )
              .decorated(
              shape: BoxShape.circle,
              color: appColor(context).fieldCardBg),
          const HSpace(Sizes.s15),
          Text(language(context, data!.title),
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
