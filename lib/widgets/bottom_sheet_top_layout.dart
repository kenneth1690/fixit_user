import 'package:flutter/cupertino.dart';

import '../config.dart';

class BottomSheetTopLayout extends StatelessWidget {
  const BottomSheetTopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language(context, appFonts.bookYourService),
              style: appCss.dmDenseSemiBold18.textColor(
                  appColor(context).darkText)),
          const Icon(CupertinoIcons.multiply)
              .inkWell(onTap: () => route.pop(context))
        ]).paddingSymmetric(horizontal: Insets.i20);
  }
}
