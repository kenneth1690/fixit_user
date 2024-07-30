import 'dart:developer';

import 'package:fixit_user/config.dart';

class OnBoardingProvider with ChangeNotifier {
  int selectIndex = 0;
  PageController? pageController;
  Animation<Offset>? animation;
  AnimationController? animationController;
  Animation<double>? animation1, cloud, cloud1, animation2;
  bool isOpacity = false;

  AnimationController? animationController1,
      cloudController,
      cloudController1,
      animationController2;

  bool sizeA = false;
  bool sizeB = false;
  bool isDisplay = false;

  double width = 0;
  double height = 0;

  double window2Width = 0;
  double window2height = 0;

  double window3Width = 0;
  double window3Height = 0;

  AnimationController? lampController;
  Animation<Offset>? lampOffset;

  AnimationController? potController;
  Animation<Offset>? potOffset;

  Animation<Offset>? animationThree, frameAnimation;
  Animation<double>? animationThree1;
  AnimationController? animationControllerThree,
      animationControllerThree1,
      frameController;
  bool val = false;

  onSkip(context)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    route.pushReplacementNamed(context, routeName.login);
    pref.setBool(session.isIntro, true);
  }

  onAnimation(TickerProvider sync) {
    log("READU");
    animationControllerThree =
        AnimationController(vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
    animationThree =
        Tween<Offset>(begin: const Offset(-0.2, 1), end: const Offset(0, 1))
            .animate(CurvedAnimation(
                parent: animationControllerThree!, curve: Curves.elasticOut));

    animationControllerThree1 =
        AnimationController(duration: const Duration(seconds: 2), vsync: sync)
          ..forward();

    animationThree1 = CurvedAnimation(
        parent: animationControllerThree1!, curve: Curves.easeIn);

    frameController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
    frameAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 10))
        .animate(CurvedAnimation(
            parent: frameController!, curve: Curves.easeOutExpo));

    notifyListeners();

    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      val = true;

      notifyListeners();
    });
    log("frameAnimation : $val");
    newImageSmall();
  }

  newImageSmall() async {
    Future.delayed(const Duration(milliseconds: 20)).then((value) {
      sizeA = true;
      sizeB = true;

      notifyListeners();
    });
  }

  onReady(TickerProvider hello) async {
    animationController1 = AnimationController(
        vsync: hello, duration: const Duration(milliseconds: 4000))
      ..forward();
    animation1 =
        Tween<double>(begin: 0, end: -128).animate(animationController1!)
          ..addListener(() {
            notifyListeners();
          });
    animationController2 = AnimationController(
        vsync: hello, duration: const Duration(milliseconds: 3000))
      ..forward();
    animation2 =
        Tween<double>(begin: 0, end: -128).animate(animationController2!)
          ..addListener(() {
            notifyListeners();
          });

    cloudController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: hello,
    )..repeat(reverse: true);
    cloud = CurvedAnimation(parent: cloudController!, curve: Curves.easeIn);

    cloudController1 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: hello,
    )..repeat(reverse: true);
    cloud1 = CurvedAnimation(parent: cloudController1!, curve: Curves.easeIn);

    opacityChange();

    pageController = PageController(initialPage: 0);
    notifyListeners();
    if (pageController!.hasClients) {
      pageController!.animateToPage(selectIndex,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      notifyListeners();
    }
  }

  opacityChange() async {
    await Future.delayed(const Duration(milliseconds: 500)).then((value) {
      isOpacity = true;
    });
    notifyListeners();
  }

  onPageSlide(context, TickerProvider hello) async {
    if(selectIndex == 3){
      selectIndex = -1;
    }


    pageController!.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    await Future.delayed(const Duration(milliseconds: 100));

    isDisplay =false;
    notifyListeners();
    log("KJGF $selectIndex");
    if (selectIndex == 1) {
      animationController = AnimationController(
          vsync: hello, duration: const Duration(seconds: 3))
        ..forward();
      animation = Tween<Offset>(begin: const Offset(0, 1.5), end: const Offset(0, 1))
          .animate(CurvedAnimation(
              parent: animationController!, curve: Curves.elasticOut));
      notifyListeners();
    } else if (selectIndex == 2) {
      isDisplay =false;
      log("KJGF");
      onAnimation(hello);
      notifyListeners();
    } else if (selectIndex == 3) {

      onAnimate(hello);
      notifyListeners();
    } else if (selectIndex == -1) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      route.pushReplacementNamed(context, routeName.login);
      pref.setBool(session.isIntro, true);
    }
    log("ON BOARD ${selectIndex == appArray.onBoardingList.length - 1}");
  }

  onAnimate(TickerProvider sync) {
    log("JGFFHJ}");
    lampController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 1));
    lampOffset = Tween<Offset>(begin: const Offset(-0.2, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: lampController!, curve: Curves.easeOutBack));
    lampController!.forward();

    notifyListeners();
    potController =
        AnimationController(vsync: sync, duration: const Duration(seconds: 1));
    potOffset = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: potController!, curve: Curves.easeOutBack));
    potController!.forward();
    notifyListeners();
    changeSize();
    isDisplay =true;
    notifyListeners();
  }

  changeSize() async {
    await Future.delayed(const Duration(milliseconds: 500));
    height = 20;
    width = 24;
    window2height = 14;
    window2Width = 21;
    window3Height = 28;
    window3Width = 22;
    notifyListeners();
  }

  onPageBack() {
    isDisplay =false;
    selectIndex--;
    pageController!.previousPage(
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
    notifyListeners();

    if (selectIndex != 2) {
      sizeA = false;
      sizeB = false;
      val = false;
      notifyListeners();
    }
    if (selectIndex != 3) {
      height = 0;
      width = 0;
      window2height = 0;
      window2Width = 0;
      window3Height = 0;
      window3Width = 0;
      notifyListeners();
    }
  }


  onDispose() {
    pageController!.dispose();
    cloudController!.dispose();
    animationController1!.dispose();
    animationController2!.dispose();
    cloudController1!.dispose();
  }

  onPageChange(index) {
    selectIndex = index;

    notifyListeners();
    log("dfjgh : $selectIndex");
  }

  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }
}
