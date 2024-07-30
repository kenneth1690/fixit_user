import '../../../../config.dart';

class ContinueWithContainer extends StatelessWidget {
  const ContinueWithContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        width: Sizes.s22,
        color: appColor(context).lightText
    );
  }
}
