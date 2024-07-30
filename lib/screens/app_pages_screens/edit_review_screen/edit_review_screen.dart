import '../../../config.dart';

class EditReviewScreen extends StatelessWidget {
  const EditReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EditReviewProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit: ()=> Future.delayed(DurationClass.ms150).then((_) => value.getReview(context)),
        child: Scaffold(
          appBar: AppBar(
              title: Text(language(context, appFonts.yourFeedback),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              leading: CommonArrow(
                  arrow: eSvgAssets.arrowLeft,
                  onTap: () => route.pop(context)).paddingAll(Insets.i8)),
          body: ListView(
            children: [
              Column(children: [
                Text(language(context, appFonts.whatDoYouThink),
                        style: appCss.dmDenseMedium14
                            .textColor(appColor(context).lightText))
                    .paddingAll(Insets.i20),
                const DottedLines(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(language(context, appFonts.rateUs),
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s12),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: appArray.editReviewList
                            .asMap()
                            .entries
                            .map((e) => EditReviewLayout(
                            data: e.value,
                            index: e.key,
                            selectIndex: value.selectedIndex,
                            onTap: () => value.onTapEmoji(e.key)))
                            .toList(),
                      ).width(MediaQuery.of(context).size.width /1.3)),
                  const VSpace(Sizes.s25),
                  Text(language(context, appFonts.reviewUs),
                      style: appCss.dmDenseMedium14
                          .textColor(appColor(context).darkText)),
                  const VSpace(Sizes.s12),
                  TextFieldCommon(
                      hintText: appFonts.writeReview,
                      focusNode: value.reviewFocus,
                      minLines: 8,
                      maxLines: 8,isNumber: true,
                      controller: value.editReviewController)
                ]).paddingAll(Insets.i20)
              ]).boxShapeExtension(
                  color: appColor(context).fieldCardBg,
                  radius: AppRadius.r12),
              const VSpace(Sizes.s40),
              ButtonCommon(title: appFonts.update,onTap: ()=> value.rateService(context),)
            ],
          ).paddingAll(Insets.i20),
        ),
      );
    });
  }
}
