import '../config.dart';

class DividerCommon extends StatelessWidget {
  const DividerCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: appColor(context).stroke,
        thickness: 1,
        height: 1,
        endIndent: 6,
        indent: 6);
  }
}
