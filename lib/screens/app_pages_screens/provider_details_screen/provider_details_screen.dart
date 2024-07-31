import 'package:fixit_user/common_tap.dart';

import '../../../config.dart';

class ProviderDetailsScreen extends StatelessWidget {
  final String? id;

  const ProviderDetailsScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context1, favCtrl, child) {
      return Consumer<ProviderDetailsProvider>(
          builder: (context, value, child) {
        return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            value.onBack(context, false);
            if(didPop) return;
          },
          child: StatefulWrapper(
            onInit: () => Future.delayed(DurationClass.ms50)
                .then((s) => value.onReady(context)),
            child: RefreshIndicator(
              onRefresh: () {
                return value.onRefresh(context);
              },
              child: LoadingComponent(
                child: value.widget1Opacity == 0.0
                    ? const Scaffold(body: ProviderDetailShimmer())
                    : AnimatedOpacity(
                        duration: const Duration(milliseconds: 1200),
                        opacity: value.widget1Opacity,
                        child: Scaffold(
                            appBar: AppBar(
                                leadingWidth: 80,
                                title: Text(
                                    language(context, appFonts.providerDetails),
                                    style: appCss.dmDenseBold18
                                        .textColor(appColor(context).darkText)),
                                centerTitle: true,
                                leading: CommonArrow(
                                        arrow: eSvgAssets.arrowLeft,
                                        onTap: () => value.onBack(context, true))
                                    .paddingAll(Insets.i8),
                                actions: [
                                  value.provider != null
                                      ? favCtrl.providerFavList
                                              .where((element) =>
                                                  element.providerId ==
                                                  value.provider!.id.toString())
                                              .isNotEmpty
                                          ? CommonArrow(
                                                  arrow: eSvgAssets.redHeart,
                                                  svgColor: appColor(context).red,
                                                  color: appColor(context)
                                                      .red
                                                      .withOpacity(0.1),
                                                  onTap: () => favCtrl.deleteToFav(context, value.provider!.id, "provider"))
                                              .paddingOnly(right: Insets.i20)
                                          : CommonArrow(
                                              arrow: eSvgAssets.like,
                                              svgColor:
                                                  appColor(context).darkText,
                                              color:
                                                  appColor(context).fieldCardBg,
                                              onTap: () => favCtrl.addToFav(
                                                  context,
                                                  value.provider!.id,
                                                  "provider")).paddingOnly(right: Insets.i20)
                                      : Container()
                                ]),
                            body: Consumer<CartProvider>(
                                builder: (context2, cart, child) {
                              return SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  const ProviderTopLayout(),
                                  if (value.categoryList.isNotEmpty)
                                    Text(
                                            language(
                                                context, appFonts.provideServiceIn),
                                            style: appCss.dmDenseSemiBold16
                                                .textColor(
                                                    appColor(context).darkText))
                                        .paddingOnly(top: Insets.i25),
                                  SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                              children: value.categoryList
                                                  .asMap()
                                                  .entries
                                                  .map((e) => TopCategoriesLayout(
                                                      index: e.key,
                                                      data: e.value,
                                                      isExapnded: false,
                                                      selectedIndex:
                                                          value.selectIndex,
                                                      rPadding: Insets.i20,
                                                      onTap: () =>
                                                          value.onSelectService(
                                                              context, e.key)).marginOnly(right: rtl(context)? 0:Sizes.s10,left: rtl(context)?Sizes.s10:0 ))
                                                  .toList())
                                          .padding(vertical: Insets.i15)),
                                  ...value.serviceList.asMap().entries.map((e) =>
                                      FeaturedServicesLayout(
                                          data: e.value,
                                          isProvider: true,
                                          inCart: isInCart(context, e.value.id),
                                          addTap: ()
                                          {
                                            final providerDetail = Provider.of<ProviderDetailsProvider>(context, listen: false);
                                            providerDetail.selectProviderIndex = 0;
                                            providerDetail.notifyListeners();
                                                onBook(context, e.value,
                                                        provider: e.value.user,
                                                        addTap: () =>
                                                            value.onAdd(e.key),
                                                        minusTap: () =>
                                                            value.onRemoveService(
                                                                context, e.key))
                                                    .then((e) {
                                                  value.serviceList[e.key]
                                                          .selectedRequiredServiceMan =
                                                      value.serviceList[e.key]
                                                          .requiredServicemen;
                                                  value.notifyListeners();
                                                });
                                              }))
                                ]).paddingAll(Insets.i20),
                              );
                            })),
                      ),
              ),
            ),
          ),
        );
      });
    });
  }
}
