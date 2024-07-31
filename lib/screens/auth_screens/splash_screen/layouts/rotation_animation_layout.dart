import '../../../../config.dart';

class RotationAnimationLayout extends StatelessWidget {
  const RotationAnimationLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context,splash,child) {

        return Roulette(
            animate: false,
            spins:2,
            duration: const Duration(seconds: 5),
            child: AnimatedContainer(
                alignment: Alignment.center,
                height: splash.controller!.isCompleted
                    ? Sizes.s45
                    : splash.size,
                width: splash.controller!.isCompleted
                    ? Sizes.s45
                    : splash.size,
                duration: const Duration(seconds: 1),
                decoration: ShapeDecoration(
                  color: splash.controller!.isCompleted
                      ? appColor(context).whiteBg
                      : appColor(context).primary,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: splash.controller!.isCompleted ? AppRadius.r8 : AppRadius.r14,
                      cornerSmoothing: 1
                    )
                  )
                ),
                child: Text("ft",
                    style: splash.controller!.isCompleted
                        ? appCss.righteousSemiBold23.textColor(
                        appColor(context)

                            .darkText)
                        : appCss.dmDenseExtraBold70.textColor(
                        appColor(context)

                            .whiteBg)))
            );
      }
    );
  }
}
