import '../../../../config.dart';
import '../../../../utils/general_utils.dart';

class StatusRow extends StatelessWidget {
  final String? title, title2, statusText;
  final bool? isDateLocation;
  final int? statusId;
  final TextStyle? style;
  final GestureTapCallback? onTap;

  const StatusRow(
      {super.key,
      this.title,
      this.isDateLocation = false,
      this.style,
      this.title2,
      this.statusText,
      this.statusId,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
          children: [
        textCommon.dmSensMediumLight12(context, text: title),
        if (isDateLocation == true)
          SvgPicture.asset(eSvgAssets.edit,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                      appColor(context).primary, BlendMode.srcIn))
              .inkWell(onTap: onTap)
              .paddingSymmetric(horizontal: Insets.i6)
      ]),
      title == appFonts.bookingStatus
          ?           BookingStatusLayout(title: capitalizeFirstLetter(statusText.toString()),color: colorCondition(statusText!.toLowerCase().toString(),context))
          : Text(title2!, style: style,overflow: TextOverflow.ellipsis,textAlign: TextAlign.end,).width(Sizes.s160)
    ]).paddingOnly(bottom: Insets.i12);
  }
}
