/*
import '../config.dart';

class TextFieldCommon extends StatelessWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon, prefixIcon;
  final Color? fillColor;
  final bool obscureText;
  final double? vertical,radius;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength,minLines,maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText;
  final TextStyle? hintStyle;

  const TextFieldCommon(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.maxLength,this.minLines, this.maxLines,this.counterText,this.hintStyle});

  @override
  Widget build(BuildContext context) {
    // Text field common
    return TextFormField(
      maxLines: maxLines ?? 1,
      style: appCss.dmDenseMedium14.textColor(appColor(context).darkText),
      focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        onChanged: onChanged,
        minLines: minLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          counterText: counterText,
            fillColor: fillColor ?? appColor(context).whiteBg,
            filled: true,
            isDense: true,
            disabledBorder:  OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular( radius ?? AppRadius.r8)),
                borderSide: BorderSide.none
            ),
            focusedBorder:  OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular( radius ?? AppRadius.r8)),
                borderSide: BorderSide.none
            ),
            enabledBorder:  OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular( radius ?? AppRadius.r8)),
                borderSide: BorderSide.none
            ),
            border:
                  OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular( radius ?? AppRadius.r8)),
                    borderSide: BorderSide.none),
            contentPadding:  EdgeInsets.symmetric(
                horizontal: Insets.i15, vertical: vertical ?? Insets.i15),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintStyle: hintStyle ?? appCss.dmDenseMedium14.textColor(appColor(context).lightText),
            hintText: language(context, hintText)));
  }
}
*/

import '../config.dart';

class TextFieldCommon extends StatefulWidget {
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final int? maxLength, minLines, maxLines;
  final ValueChanged<String>? onFieldSubmitted;
  final String? counterText, prefixIcon;
  final TextStyle? hintStyle;
  final bool? isNumber;
  final GestureTapCallback? onTap;

  const TextFieldCommon(
      {super.key,
      required this.hintText,
      this.validator,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.obscureText = false,
      this.fillColor,
      this.vertical,
      this.keyboardType,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.radius,
      this.isNumber = false,
      this.maxLength,
      this.minLines,
      this.maxLines,
      this.counterText,
      this.hintStyle,
      this.hPadding,
      this.isMaxLine = false,
      this.onTap});

  @override
  State<TextFieldCommon> createState() => _TextFieldCommonState();
}

class _TextFieldCommonState extends State<TextFieldCommon> {
  bool isFocus = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      widget.focusNode!.addListener(() {
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: appColor(context).whiteBg
      ),
      child: TextFormField(
          maxLines: widget.maxLines ?? 1,
          style: appCss.dmDenseMedium14
              .textColor(appColor(context).darkText),
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          obscureText: widget.obscureText,
          onTap: widget.onTap,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          controller: widget.controller,
          onChanged: widget.onChanged,
          minLines: widget.minLines,
          cursorColor: appColor(context).darkText,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
              counterText: widget.counterText,
              fillColor: widget.fillColor ?? appColor(context).whiteBg,
              filled: true,
              isDense: true,
              disabledBorder: widget.border?? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r8)),
                  borderSide: BorderSide.none),
              focusedBorder: widget.border??OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r8)),
                  borderSide: BorderSide.none),
              enabledBorder:widget.border?? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r8)),
                  borderSide: BorderSide.none),
              border:widget.border?? OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r8)),
                  borderSide: BorderSide.none),
              contentPadding: widget.isMaxLine
                  ? const EdgeInsets.only(
                      left: Sizes.s45,
                      right: Insets.i15,
                      top: Insets.i15,
                      bottom: Insets.i15)
                  : EdgeInsets.symmetric(
                      horizontal: widget.hPadding ?? Insets.i15,
                      vertical: widget.vertical ?? Insets.i15),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.isNumber == true
                  ? null
                  : SvgPicture.asset(widget.prefixIcon!,
      fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              !widget.focusNode!.hasFocus
                                  ? widget.controller!.text.isNotEmpty
                                      ? appColor(context).darkText
                                      : appColor(context).lightText
                                  : appColor(context).darkText,
                              BlendMode.srcIn))
                     ,
              hintStyle: widget.hintStyle ??
                  appCss.dmDenseMedium14
                      .textColor(appColor(context).lightText),
              hintText: language(context, widget.hintText),
              errorMaxLines: 2)),
    );
  }
}
