

import '../../../../config.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: AnimatedContainer(
                    alignment: Alignment.center,
                    height: Sizes.s10,
                    width:  Sizes.s10,
                    duration: const Duration(seconds: 1),
                    child: null
                ).decorated(
                    color: const Color(0xff0277fa),
                    borderRadius: const BorderRadius.all(Radius.circular(AppRadius.r14)))
            ),
          ],
        ),
      ),
    );
  }
}
