import '../../../../config.dart';

class TopDownButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? image;
  const TopDownButton({super.key,this.onTap,this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: SizedBox(
            height: 23,
            width: 80,
            child: SvgPicture.asset(image!)
        )
    );
  }
}
