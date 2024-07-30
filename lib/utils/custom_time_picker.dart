import '../config.dart';

class CustomTimePicker extends StatelessWidget {
  final String title;
  final Function(int) onScroll;
  final CarouselController carouselController;
  final List<String> itemList;

  const CustomTimePicker(
      {super.key,
        required this.title,
        required this.onScroll,
        required this.carouselController,
        required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Sizes.s78,
        width: Sizes.s90,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(eImageAssets.timeBg),fit: BoxFit.contain)
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Sizes.s90,
                height: Sizes.s65,
                  child: CarouselSlider.builder(
                      carouselController: carouselController,
                      itemCount: itemList.length,
                      itemBuilder: (context, index, realIndex) {
                        return Text(
                            textAlign: TextAlign.center,
                            itemList[index],
                            style: appCss.dmDenseMedium22.textColor(appColor(context).primary)).paddingOnly(right:  Insets.i20);
                      },
                      options: CarouselOptions(
                          onPageChanged: (index, reason) =>
                              onScroll(index),
                          autoPlay: false,
                          scrollDirection: Axis.vertical))),
            ]));
  }
}
