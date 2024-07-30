import '../../../config.dart';

class ServicePackagesScreen extends StatefulWidget {
  const ServicePackagesScreen({super.key});

  @override
  State<ServicePackagesScreen> createState() => _ServicePackagesScreenState();
}

class _ServicePackagesScreenState extends State<ServicePackagesScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final dash = Provider.of<DashboardProvider>(context, listen: true);
    return Consumer<ServicePackageAllListProvider>(
        builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(DurationClass.ms50)
              .then((_) => value.onAnimate(this)),
          child: WillPopScope(
            onWillPop: () async {
              value.animationController!.dispose();
              return true;
            },
            child: Scaffold(
                appBar: AppBarCommon(
                    title: appFonts.servicePackage,
                    onTap: () {
                      value.animationController!.dispose();
                      route.pop(context);
                    }),
                body: ListView(
                  padding: EdgeInsets.only(right:  rtl(context)?0: Sizes.s5,left: rtl(context)?Sizes.s5:0),
                    children: [
                  FutureBuilder(
                      future: value.fetchData(context),
                      initialData: dash.servicePackagesList,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting &&
                            snapshot.data!.isEmpty) {
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,                                  mainAxisExtent: Sizes.s150,
                                      mainAxisSpacing: Sizes.s20),
                              itemBuilder: (context, index) =>
                                  const PackageShimmer(isFullWidth: true,));
                        } else {
                          if (snapshot.error != null) {
                            return GridView.builder(
                                shrinkWrap: true,
                                itemCount: 8,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Sizes.s20,
                                  mainAxisExtent: Sizes.s150
                                ),
                                itemBuilder: (context, index) =>
                                    const PackageShimmer(isFullWidth: true,));
                          } else {
                            return GridView.builder(
                                shrinkWrap: true,
                                itemCount: dash.servicePackagesList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: Sizes.s20,
                                ),
                                itemBuilder: (context, index) =>
                                    ServicePackageList(
                                        rotationAnimation:
                                            value.rotationAnimation,
                                        data: dash.servicePackagesList[index],
                                        isViewAll: true,
                                        onTap: () => route.pushNamed(context,
                                                routeName.packageDetailsScreen,
                                                arg: {
                                                  "services":
                                                      dash.servicePackagesList[
                                                          index]
                                                })));
                          }
                        }
                      })

                ]).paddingOnly(left: Insets.i20)),
          ));
    });
  }
}
