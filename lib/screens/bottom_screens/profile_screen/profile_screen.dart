import '../../../config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  // defining the Animation Controller
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this)
        ..repeat(reverse: true);

  // defining the Offset of the animation
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
          begin: Offset.zero, end: const Offset(1, 0.0))
      .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));

  late final AnimationController dustController;

  @override
  void initState() {
    dustController = AnimationController(
      vsync: this,
    );

    dustController.duration = const Duration(seconds: 1);
    dustController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dustController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    dustController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
          onInit: () =>
              Future.delayed(DurationClass.ms50).then((_) => value.onAnimate()),
          child: Scaffold(
              appBar: AppBar(
                  title: Text(language(context, appFonts.profileSetting),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  automaticallyImplyLeading: false,
                  actions: [
                    CommonArrow(
                            arrow: eSvgAssets.setting,
                            svgColor: appColor(context).darkText,
                            onTap: () => value.onTapSettingTap(context))
                        .paddingSymmetric(horizontal: Insets.i20)
                  ]),
              body: SingleChildScrollView(
                  child: Column(children: [
                const VSpace(Sizes.s15),
                // Profile Pic Layout

                  ProfileLayout(
                    offsetAnimation: _offsetAnimation,

                    onTap: () {
                      route
                          .pushNamed(context, routeName.profileDetail)
                          .then((e) {
                        value.getUserDetail();
                      });
                    },
                  ),
                const VSpace(Sizes.s10),
                // Profile options layout
                ProfileOptionsLayout(
                  controller: dustController,
                  sync: this,
                )
              ]).padding(horizontal: Insets.i20, bottom: Insets.i110))));
    });
  }
}
