
import '../../../config.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);

    return Consumer<CategoriesListProvider>(builder: (context1, value, child) {
      return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          value.onBack(context, false);
          if(didPop) return;
        },
        child: StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((vaj) => value.onReady(context, dash)),
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, appFonts.categories),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(
                      arrow: rtl(context)
                          ? eSvgAssets.arrowRight
                          : eSvgAssets.arrowLeft,
                      onTap: () => value.onBack(context, true)).paddingAll(Insets.i8),
                  actions: [
                    CommonArrow(
                        arrow: value.isGrid ? eSvgAssets.list : eSvgAssets.grid,
                        onTap: () =>
                            value.onGrid()).paddingOnly(
                        left: rtl(context) ? Insets.i20 : 0,
                        right: rtl(context) ? 0 : Insets.i20)
                  ]),
              body: SingleChildScrollView(
                  child: Column(children: [
                SearchTextFieldCommon(
                  controller: value.searchCtrl,
                  focusNode: value.searchFocus,
                  suffixIcon: value.searchCtrl.text.isNotEmpty?  Icon(Icons.cancel,color: appColor(context).darkText,).inkWell(onTap: (){
                    value.searchCtrl.text = "";

                    value.searchCategory(context);
                    value.notifyListeners();
                  }):null,
                  onChanged: (v){
                    if(v.isEmpty){
                      value.searchCategory(context);
                    }else if(v.length >3){
                      value.searchCategory(context);
                    }
                    value.notifyListeners();
                  },
                  onFieldSubmitted: (v) => value.searchCategory(context),
                  color: value.searchCtrl.text.isEmpty
                      ? appColor(context).lightText
                      : appColor(context).darkText,
                ),
                const VSpace(Sizes.s20),
                if(value.searchCtrl.text.isNotEmpty)
                  value.categoryList.isNotEmpty?  value.isGrid
                      ? const GridCategoryList()
                      : Column(
                      children: value.categoryList
                          .asMap()
                          .entries
                          .map((e) => CategoriesListLayout(
                          data: e.value,
                          onTap: () => route.pushNamed(
                              context, routeName.categoriesDetailsScreen,
                              arg: e.value)))
                          .toList()): EmptyLayout(
                      title: appFonts.noMatching,
                      subtitle: appFonts.attemptYourSearch,
                      buttonText: appFonts.searchAgain,
                      bTap: () {
                        value.searchCtrl.text = "";
                        value.notifyListeners();
                        value.searchCategory(context);
                      },
                      widget: Stack(children: [
                        Image.asset(eImageAssets.noSearch,
                            height: Sizes.s240)
                            .paddingOnly(top: Insets.i40),

                          Positioned(
                              left: -10,
                              top: 30,
                              child: Image.asset(
                                  eImageAssets.mGlass,
                                  height: Sizes.s80,
                                  width: Sizes.s178))
                      ])),
if(value.searchCtrl.text.isEmpty)
                if(value.categoryList.isNotEmpty)
                value.isGrid
                    ? const GridCategoryList()
                    : Column(
                        children: value.categoryList
                            .asMap()
                            .entries
                            .map((e) => CategoriesListLayout(
                                data: e.value,
                                onTap: () => route.pushNamed(
                                    context, routeName.categoriesDetailsScreen,
                                    arg: e.value)))
                            .toList())
              ]).paddingAll(Insets.i20))),
        ),
      );
    });
  }
}
