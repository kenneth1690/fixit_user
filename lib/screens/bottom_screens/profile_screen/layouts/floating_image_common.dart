import '../../../../config.dart';

class FloatingImageCommon extends StatelessWidget {
  final double? bottom, left,imageHeight;
  final String? image;

  const FloatingImageCommon(
      {super.key,
      this.image,
      this.left,
      this.bottom,this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(seconds: 5),
        curve: Curves.bounceIn,
        bottom: bottom,
        left: left,
        child: AnimatedContainer(
            width: imageHeight,
            height: imageHeight,
            duration: const Duration(seconds: 5),
            child: Image.asset(eImageAssets.accountDel,height: imageHeight)));
  }
}
