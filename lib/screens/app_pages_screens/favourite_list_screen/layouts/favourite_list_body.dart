
import '../../../../config.dart';

class FavouriteListBody extends StatelessWidget {
  final int? index;

  const FavouriteListBody({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteListProvider>(builder: (context1, value, child) {

      return Column(
          children: index == 0
              ? [
                if(value.providerFavList.isEmpty)
                  const CommonEmpty(),
                if(value.providerFavList.isNotEmpty)
               ... value.providerFavList
                  .asMap()
                  .entries
                  .map((e) => FavouriteListLayout(
                        data: e.value,onTap: ()=> route.pushNamed(context, routeName.providerDetailsScreen,arg: {'provider':e.value.provider}),
                        heartTap: () => value.deleteToFav(
                            context, e.value.providerId, 'provider'),
                      ))
                  ]
              : [
                if(value.serviceFavList.isEmpty)
                  const CommonEmpty(),
                if(value.serviceFavList.isNotEmpty)
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: value.serviceFavList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: Sizes.s240,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: Sizes.s15),
                      itemBuilder: (context2, index) {
                        return ServiceListLayout(
                            isFav: true,
                            favTap: (p0) {
                              if (!p0) {
                                value.deleteToFav(
                                    context,
                                    value.serviceFavList[index].serviceId,
                                    'service');
                              }
                            },
                            onTap: () => value.onFeatured(context,
                                value.serviceFavList[index].service, index),
                            data: value.serviceFavList[index].service!).inkWell(onTap: ()=>route.pushNamed(context, routeName.servicesDetailsScreen,arg: {'services':value.serviceFavList[index].service}));
                      })
                ]);
    });
  }
}
