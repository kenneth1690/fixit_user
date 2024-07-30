import '../config.dart';

PopupMenuItem buildPopupMenuItem({list}) {
  return PopupMenuItem(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.i12, vertical: Insets.i10),
      height: 20,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: list!,
      ));
}


PopupMenuItem buildPopupMenuItems(context, list,
    {position, bool icon = false, data, index}) {
  return PopupMenuItem(
    value: position,
    onTap: () {
      if (icon) {
      } else {
        if (data == appFonts.call) {}
      }
    },
    padding:
    const EdgeInsets.symmetric(horizontal: Insets.i12, vertical: Insets.i2),
    height: 20,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == true
              ? Row(
            children: [
              SizedBox(
                  height: Sizes.s13,
                  width: Sizes.s13,
                  child: SvgPicture.asset(data["image"]))
                  .paddingAll(Insets.i4)
                  .decorated(
                  color: appColor(context).fieldCardBg,
                  shape: BoxShape.circle),
              const HSpace(Sizes.s12),
              Text(language(context, data["title"]),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: appCss.dmDenseMedium12
                      .textColor(appColor(context).darkText)),
            ],
          )
              : Text(language(context, data),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: appCss.dmDenseMedium12
                  .textColor(appColor(context).darkText)),
          if (index != list.length - 1)
            Divider(
                height: 1,
                color: appColor(context).stroke,
                thickness: 1)
                .paddingSymmetric(vertical: Insets.i10)
        ]),
  );
}
