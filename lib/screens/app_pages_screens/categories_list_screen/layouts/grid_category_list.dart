import '../../../../config.dart';

class GridCategoryList extends StatelessWidget {
  const GridCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer2<CategoriesListProvider,DashboardProvider>(builder: (context1, value,dash, child) {
        return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: value.categoryList.length,
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
                  data: value.categoryList[index],
                  onTap: () => route.pushNamed(
                      context, routeName.categoriesDetailsScreen,
                      arg: value.categoryList[index]));
            });
      }
    );
  }
}
