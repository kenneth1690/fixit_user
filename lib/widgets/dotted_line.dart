import '../config.dart';


class DottedLines extends StatelessWidget {
  final Color? color;
  final double? width;
  final Axis? direction;
  const DottedLines({super.key,this.color,this.width,this.direction});

  @override
  Widget build(BuildContext context) {
    return DottedLine(

        direction: direction ?? Axis.horizontal,
        lineLength: width ?? double.infinity,
        lineThickness: 1.5,
        dashLength: 3,
        dashColor:color ?? appColor(context).stroke);
  }
}
