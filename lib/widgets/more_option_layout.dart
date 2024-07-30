import 'package:fixit_user/widgets/popup_menu_item_common.dart';

import '../config.dart';

class MoreOptionLayout extends StatelessWidget {
  final String? icon;
  final double? size;
  final Color? color,iconColor;
  final PopupMenuItemSelected? onSelected;
  final bool? isIcon;
  final List list;
  const MoreOptionLayout({super.key,  this.onSelected, required this.list, this.icon, this.size, this.color, this.iconColor, this.isIcon = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? Sizes.s40,
      width: size ?? Sizes.s40,
      child: PopupMenuButton(
        onSelected:onSelected,

        color: appColor(context).whiteBg,
        constraints:  BoxConstraints(minWidth: isIcon == true ? Sizes.s180 : Sizes.s87 ,maxWidth: isIcon == true ? Sizes.s180 : Sizes.s87),
        position: PopupMenuPosition.under,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(AppRadius.r8)
            )
        ),

        padding: const EdgeInsets.all(0),
        iconSize: Sizes.s20,
        offset: const Offset(5, 20),
        icon: SvgPicture.asset(icon ?? eSvgAssets.more,
            height: Sizes.s20,colorFilter: ColorFilter.mode(iconColor ?? appColor(context).darkText, BlendMode.srcIn)),
        itemBuilder: (context)=> [
          ...list.asMap().entries.map((e) => buildPopupMenuItems(
        context,
        list,
        position: e.key,
        data: e.value,
        index: e.key,


      ))
        ],).decorated(
          color: color ?? appColor(context).fieldCardBg,
          shape: BoxShape.circle
      ),
    );
  }
}
