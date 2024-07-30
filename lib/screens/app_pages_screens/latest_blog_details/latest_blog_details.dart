import 'package:fixit_user/screens/app_pages_screens/latest_blog_details/blog_detail_shimmer/blog_detail_shimmer.dart';

import '../../../config.dart';

class LatestBlogDetailsScreen extends StatelessWidget {
  const LatestBlogDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LatestBLogDetailsProvider>(
        builder: (context, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 50),() => value.onReady(context)),
          child: PopScope(
            canPop: true,
            onPopInvoked: (didPop) {
              value.onBack(context, false);
              if(didPop) return;
            },
            child:value.widget1Opacity == 0.0 ? const BlogDetailShimmer() : LoadingComponent(
              child: Scaffold(
                  appBar: AppBarCommon(title: appFonts.latestBlog,onTap: ()=>value.onBack(context, true)),
                  body: SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: value.data != null
                                ? const BlogDetailsLayout()
                                : Container())
                        .decorated(
                            color: appColor(context).whiteBg,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                  color: appColor(context)

                                      .darkText
                                      .withOpacity(0.06))
                            ],
                            borderRadius: BorderRadius.circular(AppRadius.r8),
                            border: Border.all(
                                color: appColor(context).stroke))
                        .padding(vertical: Insets.i15, horizontal: Insets.i20)
                  ]))),
            ),
          ));
    });
  }
}
