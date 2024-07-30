import '../config.dart';

class TextCommon {
  dmSensMediumDark14(context,{text}) {
    return Text(language(context, text),
        style: appCss.dmDenseMedium14
            .textColor(appColor(context).darkText));
  }
  dmSensMediumLight12(context,{text}) {
    return Text(language(context, text),
        style: appCss.dmDenseMedium12
            .textColor(appColor(context).lightText));
  }

}