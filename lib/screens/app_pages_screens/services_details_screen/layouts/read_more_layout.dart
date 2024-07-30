import '../../../../config.dart';

class ReadMoreLayout extends StatelessWidget {
  final String? text;
  const ReadMoreLayout({super.key,this.text});

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(text!,
        trimLines: 2,
        style: TextStyle(
            color: appColor(context).darkText,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            fontWeight: FontWeight.w500),
        colorClickableText: appColor(context).darkText,
        trimMode: TrimMode.Line,
        lessStyle: TextStyle(
            color: appColor(context).darkText,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            fontWeight: FontWeight.w700) ,
        moreStyle: TextStyle(
            color: appColor(context).darkText,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            fontWeight: FontWeight.w700),
        trimCollapsedText: language(context, appFonts.readMore),
        trimExpandedText: ' ${language(context, appFonts.readLess)}');
  }
}
