import '../config.dart';

class ContainerWithTextLayout extends StatelessWidget {
  final String? title;
  const ContainerWithTextLayout({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SmallContainer(),
      const HSpace(Sizes.s20),
      Text(language(context, title!),
          style: appCss.dmDenseSemiBold14.textColor(
              appColor(context).darkText))
    ]);
  }
}
