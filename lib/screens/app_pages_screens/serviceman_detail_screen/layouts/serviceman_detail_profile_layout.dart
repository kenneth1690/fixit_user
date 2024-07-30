import '../../../../config.dart';

class ServicemanDetailProfileLayout extends StatelessWidget {
  final String? image;
  const ServicemanDetailProfileLayout({super.key,this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(eImageAssets.servicemanBg,
          height: Sizes.s66,
          width: MediaQuery.of(context).size.width)
          .paddingOnly(bottom: Insets.i40),
      Container(
          alignment: Alignment.center,
          height: Sizes.s90,
          width: Sizes.s90,
          decoration: BoxDecoration(
              border: Border.all(
                  color: appColor(context).whiteColor,
                  width: 4),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(image!))))
          .paddingOnly(top: Insets.i12)
    ]);
  }
}
