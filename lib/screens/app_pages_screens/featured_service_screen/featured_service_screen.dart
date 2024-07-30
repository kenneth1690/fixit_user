
import '../../../config.dart';

class FeaturedServiceScreen extends StatefulWidget {
  const FeaturedServiceScreen({super.key});

  @override
  State<FeaturedServiceScreen> createState() => _FeaturedServiceScreenState();
}

class _FeaturedServiceScreenState extends State<FeaturedServiceScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    return Consumer<FeaturedServiceProvider>(builder: (context1, value, child) {
      return PopScope(
          canPop: true,
          onPopInvoked: (didPop) {
            value.onBack(context, false);
if(didPop) return;

          },
          child: StatefulWrapper(
              onInit: () => Future.delayed(DurationClass.ms50)
                  .then((_) => value.onReady(context, this)),
              child: Scaffold(
                  appBar: AppBarCommon(
                    title: appFonts.featuredService,
                    onTap: () =>value.onBack(context, true)
                  ),
                  body:
                      Consumer<CartProvider>(builder: (context2, cart, child) {
                    return RefreshIndicator(
                        onRefresh: () async {
                          dash.getFeaturedPackage(1);
                        },
                        child: SingleChildScrollView(
                            child: Column(children: [
                          SearchTextFieldCommon(
                              focusNode: value.searchFocus,
                              controller: value.txtFeaturedSearch,
                              suffixIcon: value.txtFeaturedSearch.text.isNotEmpty?  Icon(Icons.cancel,color: appColor(context).darkText,).inkWell(onTap: (){
                                value.txtFeaturedSearch.text = "";

                                value.getFeaturedPackage();
                                value.notifyListeners();
                              }):null,
                              onChanged: (v) {
                                if (v.isEmpty) {
                                  value.getFeaturedPackage();
                                } else if (v.length > 3) {
                                  value.getFeaturedPackage();
                                }
                                value.notifyListeners();
                              },
                              onFieldSubmitted: (v) =>
                                  value.getFeaturedPackage()).paddingSymmetric(horizontal: Insets.i20),
                          const VSpace(Sizes.s20),
                          value.txtFeaturedSearch.text.isEmpty
                              ? FutureBuilder(
                                  future: value.fetchData(context),
                                  initialData: dash.featuredServiceList,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                            ConnectionState.waiting &&
                                        snapshot.data!.isEmpty) {
                                      return const ServicesShimmer(count: 5);
                                    } else {
                                      if (snapshot.error != null) {
                                        return const ServicesShimmer(count: 5);
                                      } else {
                                        return Column(
                                          children: [
                                            ...snapshot.data!.asMap().entries.map(
                                                (e) => FeaturedServicesLayout(
                                                    data: e.value,
                                                    addTap: () => value.onFeatured(
                                                        context, e.value, e.key,
                                                        inCart: isInCart(
                                                            context,
                                                            e.value.id)),
                                                    inCart: isInCart(
                                                        context, e.value.id),
                                                    onTap: () => route.pushNamed(
                                                        context,
                                                        routeName.servicesDetailsScreen,
                                                        arg: {'services': e.value})))
                                          ],
                                        ).paddingSymmetric(horizontal: Insets.i20);
                                      }
                                    }
                                  })
                              : value.searchList.isNotEmpty
                                  ? Column(
                                      children: [
                                        ...value.searchList.asMap().entries.map(
                                            (e) => FeaturedServicesLayout(
                                                data: e.value,
                                                addTap: () => value.onFeatured(
                                                    context, e.value, e.key,
                                                    inCart: isInCart(
                                                        context, e.value.id),
                                                    isSearch: true),
                                                inCart: isInCart(
                                                    context, e.value.id),
                                                onTap: () => route.pushNamed(
                                                    context,
                                                    routeName
                                                        .servicesDetailsScreen,
                                                    arg: {'services': e.value})))
                                      ],
                                    ).marginSymmetric(horizontal: Sizes.s20)
                                  : Column(children: [
                                      Stack(children: [
                                        Image.asset(eImageAssets.noSearch,
                                                height: Sizes.s346)
                                            .paddingOnly(top: Insets.i40),
                                        if (value.animationController != null)
                                          Positioned(
                                              left: 40,
                                              top: 0,
                                              child: RotationTransition(
                                                  turns: Tween(
                                                          begin: 0.01,
                                                          end: -.01)
                                                      .chain(CurveTween(
                                                          curve: Curves.easeIn))
                                                      .animate(value
                                                          .animationController!),
                                                  child: Image.asset(
                                                      eImageAssets.mGlass,
                                                      height: Sizes.s190,
                                                      width: Sizes.s178)))
                                      ]),
                                      const VSpace(Sizes.s25),
                                      Text(
                                          language(
                                              context, appFonts.noMatching!),
                                          style: appCss.dmDenseBold18.textColor(
                                              appColor(context).darkText)),
                                      const VSpace(Sizes.s8),
                                      Text(
                                              language(context,
                                                  appFonts.attemptYourSearch),
                                              textAlign: TextAlign.center,
                                              style: appCss.dmDenseRegular14
                                                  .textColor(appColor(context)
                                                      .lightText))
                                          .paddingSymmetric(
                                              horizontal: Insets.i10)
                                    ]).paddingSymmetric(horizontal: Insets.i20)
                        ])));
                  }))));
    });
  }
}
