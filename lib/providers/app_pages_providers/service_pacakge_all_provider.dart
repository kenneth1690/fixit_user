import 'dart:developer';

import 'package:fixit_user/config.dart';

class ServicePackageAllListProvider with ChangeNotifier {

  AnimationController? controller;
  Animation? animation;
  bool isShimmer =true;

  double? val;


  onAnimate(TickerProvider sync) async{
    animationController =
    AnimationController(vsync: sync, duration: const Duration(seconds: 10))
      ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);

    //notifyListeners();
await Future.delayed(DurationClass.s2);
    isShimmer = false;
    notifyListeners();
    animationController!.addListener(() {
      val = animationController!.value;
      notifyListeners();
    });
  }

  List service = appArray.servicesList.getRange(1, 3).toList();



  double turns = 0.00;
  Animation<double>? rotationAnimation;
  AnimationController? animationController;


  /* onAnimationInit(TickerProvider sync) {
    animationController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 10))
          ..repeat();
    rotationAnimation =
        Tween<double>(begin: 1, end: 0).animate(animationController!);

  }

*/


  Future<List<ServicePackageModel>> fetchData(context) async {
    final dash = Provider.of<DashboardProvider>(context, listen: false);
    return dash.servicePackagesList;
  }

@override
  void dispose() {
    // TODO: implement dispose
  animationController!.dispose();
    super.dispose();
  }

}
