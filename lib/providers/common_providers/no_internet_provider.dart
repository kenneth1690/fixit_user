import 'package:fixit_user/config.dart';

class NoInternetProvider with ChangeNotifier {
  AnimationController? animationController;
  Position? position;

  onAnimate(TickerProvider sync) async {
    animationController = AnimationController(
        vsync: sync, duration: const Duration(milliseconds: 1200));
    _runAnimation();
    notifyListeners();
  }

  void _runAnimation() async {
    for (int i = 0; i < 300; i++) {
      await animationController!.forward();
      await animationController!.reverse();
    }
  }

  isAvailable() async {
    bool isAvailable = await isNetworkConnection();notifyListeners();
    return isAvailable;
  }
}
