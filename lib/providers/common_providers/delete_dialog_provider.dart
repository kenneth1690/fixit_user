import 'package:fixit_user/config.dart';
import 'package:fixit_user/widgets/on_delete_dialog.dart';


class DeleteDialogProvider with ChangeNotifier {
  AnimationController? controller;
  Animation<Offset>? offsetAnimation;
  bool isPositionedRight = false;
  bool isAnimateOver = false;

  double height = 6;
  double width = 6;

  //alert dialog open animation start
  onAnimate() {
    height = 6;
    width = 6;
    Future.delayed(const Duration(milliseconds: 500), () {
      height = 120;
      width = 120;

      notifyListeners();
      Future.delayed(const Duration(milliseconds: 800), () {
        height = 50;
        width = 50;
        notifyListeners();
      });
    });
    notifyListeners();
  }

  //on rest password dialog
  onResetPass(context, subtext, buttonText, onTap, {title}) {
    onAnimate();
    showDialog(
        context: context,
        builder: (context1) {
          return Consumer<DeleteDialogProvider>(
              builder: (context, value, child) {
            return AlertDialogCommon(
                isBooked: true,
                title: title ?? appFonts.deleteSuccessfully,
                widget: Stack(alignment: Alignment.center, children: [
                  SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            eGifAssets.successGif,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ))
                      .paddingSymmetric(vertical: Insets.i8)
                      .decorated(
                          color: appColor(context).fieldCardBg,
                          borderRadius: BorderRadius.circular(AppRadius.r10)),
                /*  AnimatedContainer(
                      height: height,
                      width: width,
                      curve: Curves.easeInToLinear,
                      duration: const Duration(milliseconds: 800),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(eImageAssets.su))))*/
                ]),
                subtext: subtext,
                bText1: buttonText,
                height: Sizes.s145,
                b1OnTap: onTap);
          });
        });
  }

  //animate design
  animateDesign(TickerProvider sync) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      isPositionedRight = true;
      notifyListeners();
    }).then((value) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        isAnimateOver = true;
        notifyListeners();
      }).then((value) {
        controller = AnimationController(
            vsync: sync, duration: const Duration(seconds: 2))
          ..forward();
        offsetAnimation = Tween<Offset>(
                begin: const Offset(0, 0.5), end: const Offset(0, 1.7))
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        notifyListeners();
      });
    });

    notifyListeners();
  }

  //on delete any confirmation dialog open
  onDeleteDialog(sync, context, image, title, subtitle, onDelete) {
    animateDesign(sync);
    showDialog(
        context: context,
        builder: (context1) {
          return StatefulBuilder(builder: (context2, setState) {
            return Consumer<DeleteDialogProvider>(
                builder: (context3, value, child) {
              return OnDeleteDialog(
                  image: image,
                  onDelete: onDelete,
                  subtitle: subtitle,
                  title: title);
            });
          });
        }).then((value) {
      isPositionedRight = false;
      isAnimateOver = false;
      notifyListeners();
    });
  }



  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
}
