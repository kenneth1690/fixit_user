import '../config.dart';


class LoadingComponent extends StatelessWidget {
  final Widget child;
  const LoadingComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        child,
        Consumer<LoadingProvider>(builder: (context, ctrl, child) {
          return ctrl.isLoading == true
              ? Container(
            color:isDark(context)?Colors.black.withOpacity(.3) : appColor(context).darkText.withOpacity(0.2),
            width: screenWidth,
            height: screenHeight,
            child: Center(
                child: Image.asset(eGifAssets.loader,height: Sizes.s100,)
            ),
          )
              : Container();
        },)
      ],
    );
  }
}