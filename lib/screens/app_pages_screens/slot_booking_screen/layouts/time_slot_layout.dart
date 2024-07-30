import '../../../../config.dart';

class TimeSlotLayout extends StatelessWidget {
  final String? title;
  final int? index, selectedIndex;
  final GestureTapCallback? onTap;

  const TimeSlotLayout(
      {super.key, this.selectedIndex, this.index, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title!,textAlign: TextAlign.center,
            style: appCss.dmDenseMedium14.textColor(selectedIndex == index
                ? appColor(context).whiteColor
                : appColor(context).lightText)).alignment(Alignment.center).width(Sizes.s67).height(Sizes.s34)
        .boxShapeExtension(
            color: selectedIndex == index
                ? appColor(context).primary
                : appColor(context).whiteColor)
        .inkWell(onTap: onTap);
  }
}
