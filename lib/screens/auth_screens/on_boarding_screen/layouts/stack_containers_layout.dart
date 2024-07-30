import '../../../../config.dart';

class StackContainerCommon extends StatelessWidget {
  final BoxShape? shape;

  const StackContainerCommon({super.key, this.shape});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 355,
        width: 385,
        decoration: BoxDecoration(
            border: Border.all(
                color: appColor(context).whiteBg, width: 15),
            shape: shape!));
  }
}
