import 'dart:developer';

import 'package:fixit_user/common/languages/app_language.dart';
import 'package:fixit_user/common_tap.dart';

import '../../../../config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context3, dash, child) {
      return Consumer<HomeScreenProvider>(builder: (context1, value, child) {
        return Consumer<CartProvider>(builder: (context2, cart, child) {
          return Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if(dash.categoryList.isNotEmpty)
              HeadingRowCommon(
                      title: appFonts.topCategories,
                      isTextSize: true,
                      onTap: () => route.pushNamed(
                          context, routeName.categoriesListScreen))
                  .paddingSymmetric(horizontal: Insets.i20),
              if(dash.categoryList.isNotEmpty)
              const VSpace(Sizes.s15),
             /* Wrap(
                direction: Axis.horizontal,
                children:
                    dash.categoryList.toList().asMap().entries.map((element) {
                  return TopCategoriesLayout(
                          data: element.value,
                          selectedIndex: value.cIndex,
                          index: element.key)
                      .paddingOnly(
                          bottom: Insets.i20,
                          right: MediaQuery.of(context).size.width / 20)
                      .inkWell(onTap: () {
                    log("DATA PASS : ${element.value}");
                    route.pushNamed(context, routeName.categoriesDetailsScreen,
                        arg: element.value);
                  });
                }).toList(),
              ).width(MediaQuery.of(context).size.width).paddingOnly(
                  left: rtl(context) ? 0 : Insets.i27,
                  right: rtl(context) ? Insets.i27 : 0),*/
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
                  itemCount: dash.categoryList.toList().length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisExtent: Sizes.s110,
                      mainAxisSpacing: Sizes.s10,
                      crossAxisSpacing: Sizes.s10),
                  itemBuilder: (context, index) {
                    // Top Categories lists
                    return TopCategoriesLayout(
                        index: index,
                        selectedIndex: dash.topSelected,
                        data: dash.categoryList.toList()[index],
                        onTap: () => route.pushNamed(
                            context, routeName.categoriesDetailsScreen,
                            arg: dash.categoryList.toList()[index]));
                  }),
              if (dash.servicePackagesList.isNotEmpty)
                HeadingRowCommon(
                        title: appFonts.servicePackage,
                        isTextSize: true,
                        onTap: () => route.pushNamed(
                            context, routeName.servicePackagesScreen))
                    .paddingSymmetric(horizontal: Insets.i20),
              if(dash.servicePackagesList.isNotEmpty)
              const VSpace(Sizes.s15),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: dash.firstThreeServiceList.isNotEmpty
                      ? Row(
                              children: dash.firstThreeServiceList
                                  .asMap()
                                  .entries
                                  .map((e) => ServicePackageList(

                                        rotationAnimation:
                                            value.rotationAnimation,
                                        data: e.value,
                                        onTap: () => route.pushNamed(context,
                                            routeName.packageDetailsScreen,
                                            arg: {"services": e.value}),
                                      ))
                                  .toList())
                          .paddingSymmetric(horizontal: Insets.i20)
                      : Row(
                              children: dash.servicePackagesList
                                  .asMap()
                                  .entries
                                  .map((e) => ServicePackageList(
                                      rotationAnimation:
                                          value.rotationAnimation,
                                      data: e.value,
                                      onTap: () => route.pushNamed(context,
                                          routeName.packageDetailsScreen,
                                          arg: {"services": e.value})))
                                  .toList())
                          .paddingSymmetric(horizontal: Insets.i20)),
              if(dash.featuredServiceList.isNotEmpty)
              const VSpace(Sizes.s25),
              if(dash.featuredServiceList.isNotEmpty)
              HeadingRowCommon(
                      title: appFonts.featuredService,
                      isTextSize: true,
                      onTap: () => route.pushNamed(
                          context, routeName.featuredServiceScreen))
                  .paddingSymmetric(horizontal: Insets.i20),
              const VSpace(Sizes.s15),
              if (dash.firstTwoFeaturedServiceList.isNotEmpty)
                ...dash.firstTwoFeaturedServiceList.asMap().entries.map((e) =>
                    FeaturedServicesLayout(
                        data: e.value,
                        addTap: () => dash.onFeatured(context, e.value, e.key,
                            inCart: isInCart(context, e.value.id)),
                        inCart: isInCart(context, e.value.id),
                        onTap: () => route.pushNamed(
                                context, routeName.servicesDetailsScreen,
                                arg: {'services': e.value}).then((e) {
                              dash.getFeaturedPackage(1);
                            })).paddingSymmetric(horizontal: Insets.i20)),
              if (dash.firstTwoFeaturedServiceList.isEmpty)
                ...dash.featuredServiceList.asMap().entries.map((e) =>
                    FeaturedServicesLayout(
                        data: e.value,
                        inCart: isInCart(context, e.value.id),
                        addTap: () => dash.onFeatured(context, e.value, e.key,
                            inCart: isInCart(context, e.value.id)),
                        onTap: () => route.pushNamed(
                                context, routeName.servicesDetailsScreen, arg: {
                              'services': e.value
                            })).paddingSymmetric(horizontal: Insets.i20))
            ]).padding(bottom: Insets.i10),
            if (dash.firstTwoHighRateList.isNotEmpty ||
                dash.highestRateList.isNotEmpty)
              Column(children: [
                HeadingRowCommon(
                    title: appFonts.expertService,
                    isTextSize: true,
                    onTap: () => route.pushNamed(
                        context, routeName.expertServiceScreen)),
                const VSpace(Sizes.s15),
                if (dash.firstTwoHighRateList.isNotEmpty)
                  ...dash.firstTwoHighRateList
                      .asMap()
                      .entries
                      .map((e) => ExpertServiceLayout(
                            data: e.value,
                            onTap: () => route.pushNamed(
                                context, routeName.providerDetailsScreen,
                                arg: {'provider': e.value}),
                          )),
                if (dash.firstTwoHighRateList.isEmpty)
                  ...dash.highestRateList.asMap().entries.map((e) =>
                      ExpertServiceLayout(
                          data: e.value,
                          onTap: () => route.pushNamed(
                              context, routeName.providerDetailsScreen,
                              arg: {'provider': e.value})))
              ])
                  .paddingSymmetric(
                      horizontal: Insets.i20, vertical: Insets.i25)
                  .backgroundColor(appColor(context).fieldCardBg)
          ]);
        });
      });
    });
  }
}
