
import '../config.dart';

class SearchTextFieldCommon extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged, onFieldSubmitted;
  final FocusNode? focusNode;
  final Color? color;
  final GestureTapCallback? onTap;
  final String? hinText;

  const SearchTextFieldCommon(
      {super.key,
      this.controller,
      this.suffixIcon,
      this.onChanged,
      this.color,
      this.focusNode,
      this.onFieldSubmitted, this.onTap, this.hinText});

  @override
  Widget build(BuildContext context) {
    return TextFieldCommon(
        hintStyle: appCss.dmDenseRegular13
            .textColor(appColor(context).lightText),
        radius: AppRadius.r23,
        hintText: hinText?? appFonts.searchHere,
        controller: controller,onTap:onTap ,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        fillColor: appColor(context).fieldCardBg,
        suffixIcon: suffixIcon,
        onChanged: onChanged,


        prefixIcon: eSvgAssets.search);
  }
}
