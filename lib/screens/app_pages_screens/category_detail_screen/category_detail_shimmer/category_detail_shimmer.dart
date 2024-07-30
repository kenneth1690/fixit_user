import 'package:fixit_user/config.dart';

class CategoryDetailShimmer extends StatelessWidget {
  const CategoryDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark(context)?Colors.black: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.s20),
        children: [
          const VSpace(Sizes.s50),
          const Row(children: [
            CommonSkeleton(height: Sizes.s40, width: Sizes.s40, isCircle: true),
            HSpace(Sizes.s48),
            CommonSkeleton(height: Sizes.s23, width: Sizes.s138, radius: 12)
          ]),
          const VSpace(Sizes.s25),
          const CommonSkeleton(
            height: Sizes.s48,
            radius: 20
          ),
          const VSpace(Sizes.s25),
          const CommonSkeleton(height: Sizes.s16, width: Sizes.s96).alignment(Alignment.centerLeft),
          const VSpace(Sizes.s20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:  List.generate(8, (index) {
                return const Column(children: [
                  CommonSkeleton(height: Sizes.s60, width: Sizes.s60, radius: 10),
                  VSpace(Sizes.s11),
                  CommonSkeleton(height: Sizes.s13, width: Sizes.s60, radius: 10)
                ]).padding( bottom: Sizes.s22,left: rtl(context) ? Sizes.s15:0,right: rtl(context) ? 0: Sizes.s15);
              }),
            ),
          ),
          const ServicesShimmer(count: 3),
        ],
      ).width(MediaQuery.of(context).size.width),
    );
  }
}
