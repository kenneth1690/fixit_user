

import 'dart:developer';

import '../../../config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return Consumer<LocationProvider>(
            builder: (context2, locationCtrl, child) {
              log("currentAddress :${dash.firstTwoBlogList.length}");
          return StatefulWrapper(
              onInit: () => Future.delayed(const Duration(milliseconds: 100),
                  () => value.onAnimate(this)),
              child: value.isSkeleton
                  ? const HomeSkeleton()
                  : RefreshIndicator(
                onRefresh: ()async{
                  return dash.onRefresh(context);
                },
                    child: Scaffold(
                        appBar: AppBar(
                            leadingWidth: MediaQuery.of(context).size.width,
                            leading: HomeAppBar(location: street ?? "")),
                        body: !value.isEmptyLayout(context)
                            ? const CommonEmpty()
                            : ListView(children: [
                              if(dash.bannerList.isNotEmpty)
                                BannerLayout(
                                    bannerList: dash.bannerList,
                                    onPageChanged: (index, reason) =>
                                        value.onSlideBanner(index),
                                    onTap: (type, id) =>
                                        value.onBannerTap(context, type, id)),
                                if (dash.bannerList.length > 1)
                                  const VSpace(Sizes.s12),
                                if (dash.bannerList.length > 1)
                                  DotIndicator(
                                      list: dash.bannerList,
                                      selectedIndex: value.selectIndex),
                                const VSpace(Sizes.s20),
                                if (dash.couponList.isNotEmpty)
                                  HeadingRowCommon(
                                          title: appFonts.coupons,
                                          isTextSize: true,
                                          onTap: () => route.pushNamed(
                                              context, routeName.couponListScreen,
                                              arg: true))
                                      .paddingSymmetric(horizontal: Insets.i20),
                                if (dash.couponList.isNotEmpty)
                                  const VSpace(Sizes.s15),
                                if (dash.couponList.isNotEmpty)
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: dash.couponList
                                              .asMap()
                                              .entries
                                              .map((e) =>
                                                  HomeCouponLayout(data: e.value))
                                              .toList())),
                                VSpace(dash.couponList.isNotEmpty
                                    ? Sizes.s25
                                    : Sizes.s15),
                                const HomeBody(),
                                if (dash.firstTwoHighRateList.isNotEmpty ||
                                    dash.highestRateList.isNotEmpty)
                                  const VSpace(Sizes.s25),
                                if( dash.blogList.isNotEmpty)
                                HeadingRowCommon(
                                  title: appFonts.latestBlog,
                                  isTextSize: true,
                                  onTap: () => route.pushNamed(
                                      context, routeName.latestBlogViewAll),
                                ).paddingSymmetric(horizontal: Insets.i20),
                                SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: dash.firstTwoBlogList.isNotEmpty
                                        ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: dash.firstTwoBlogList
                                                    .asMap()
                                                    .entries
                                                    .map((e) => LatestBlogLayout(
                                                        data: e.value))
                                                    .toList())
                                            .paddingOnly(left: Insets.i20)
                                        : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: dash.blogList
                                                    .asMap()
                                                    .entries
                                                    .map((e) => LatestBlogLayout(
                                                        data: e.value))
                                                    .toList())
                                            .paddingOnly(left: Insets.i20)),
                                const VSpace(Sizes.s50)
                              ])),
                  ));
        });
      });
    });
  }
}
