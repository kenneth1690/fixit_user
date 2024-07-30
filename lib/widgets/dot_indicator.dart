import '../config.dart';

class DotIndicator extends StatelessWidget {
  final List? list;
  final int? selectedIndex;

  const DotIndicator({super.key, this.list, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            list!.length,
            (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 6,
                    width: index == selectedIndex ? 15 : 6,
                    decoration: BoxDecoration(
                        color: index == selectedIndex
                            ? appColor(context).primary
                            : appColor(context).stroke,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(AppRadius.r12))))
                .paddingOnly(right: Insets.i4)));
  }
}
