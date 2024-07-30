import '../../../config.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context1, value, child) {
      return WillPopScope(
        onWillPop: () async{
          value.animationController!.dispose();
          return true;

        },
        child: StatefulWrapper(
            onInit: () => Future.delayed(
                const Duration(milliseconds: 100), () => value.onAnimate(this)),
            child: Scaffold(
                appBar: AppBarCommon(title: appFonts.location,onTap: (){
                  value.animationController!.dispose();
                  route.pop(context);
                },),
                body: EmptyLayout(
                    title: appFonts.noSaveLocation,
                    subtitle: appFonts.thereAreNo,
                    buttonText: appFonts.addNewLocation,
                    inkText: appFonts.useMyCurrent,
                    bTap: ()=> route.pushNamed(context, routeName.currentLocation),
                    isInk: true,
                    inkOnTap: ()async{

                      await value.getUserCurrentLocation(context);
                      route.pop(context);
                    },
                    widget: Stack(children: [
                      Image.asset(eImageAssets.notiGirl, height: Sizes.s346),
                      if (value.animationController != null)
                        Positioned(
                            top: MediaQuery.of(context).size.height * 0.035,
                            left: MediaQuery.of(context).size.height * 0.052,
                            child: Column(children: [
                              RotationTransition(
                                  turns: Tween(begin: 0.05, end: -.01)
                                      .chain(
                                          CurveTween(curve: Curves.elasticInOut))
                                      .animate(value.animationController!),
                                  child: Image.asset(eImageAssets.noLocation,
                                      height: Sizes.s40, width: Sizes.s40)),
                              Image.asset(eImageAssets.shadow,
                                  height: Sizes.s5, width: Sizes.s30)
                            ]))
                    ])))),
      );
    });
  }
}
