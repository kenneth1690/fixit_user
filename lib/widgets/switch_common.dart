import '../config.dart';

class SwitchCommon extends StatelessWidget {
  final bool? val;
  final ValueChanged<bool>? onToggle;
  const SwitchCommon({super.key,this.val,this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(useMaterial3: false),
        child: FlutterSwitch(
            width: Sizes.s45,
            height: Sizes.s28,
            toggleSize: Sizes.s18,
            value: val!,
            borderRadius: 15,
            padding: 5,
            toggleColor: appColor(context).whiteBg,
            inactiveToggleColor:
            appColor(context).lightText,
            activeColor: appColor(context).primary,
            inactiveColor:
            appColor(context).stroke,
            onToggle: onToggle!));
  }
}
