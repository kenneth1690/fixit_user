import '../../../config.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyReviewProvider>(builder: (context1, value, child) {

      return Scaffold(
          appBar: AppBar(
              leadingWidth: 80,
              title: Text(language(context, appFonts.review),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              leading: CommonArrow(
                  arrow: rtl(context)
                      ? eSvgAssets.arrowRight
                      : eSvgAssets.arrowLeft,
                  onTap: () => route.pop(context)).paddingAll(Insets.i8)),
          body: RefreshIndicator(
            onRefresh: () async {
              value.getMyReview(context);
            },
            child:ListView(
                    children:[
                      if(value.reviews.isEmpty)
                      const CommonEmpty().paddingOnly(top: MediaQuery.of(context).size.height /8),
                      if(value.reviews.isNotEmpty)
                      ...value.reviews
                          .asMap()
                          .entries
                          .map((e) => ReviewLayout(
                          data: e.value,deleteTap: ()=>value.deleteAccountConfirmation(context, this, e.value.id),
                          editTap: () => route.pushNamed(
                              context, routeName.editReview,
                              arg: e.value).then((e){
                            value.getMyReview(context);
                          })))
                    ]
                        ).height(MediaQuery.of(context).size.height)
                .paddingAll(Insets.i20),
          ));
    });
  }
}
