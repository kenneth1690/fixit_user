
import '../../../config.dart';

class AppDetailsScreen extends StatelessWidget {
  const AppDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppDetailsProvider>(builder: (context, value, child)
    {
      return StatefulWrapper(
        onInit: ()=>Future.delayed(DurationClass.ms50).then((_) => value.getAppPages()),
        child: Scaffold(
            appBar: AppBar(
                leadingWidth: 80,
                title: Text(language(context, appFonts.appDetails),
                    style: appCss.dmDenseBold18
                        .textColor(appColor(context).darkText)),
                centerTitle: true,
                leading: CommonArrow(
                    arrow: rtl(context) ? eSvgAssets.arrowRight : eSvgAssets.arrowLeft, onTap: () => route.pop(context))
                    .padding(vertical: Insets.i8)),
            body: Column(children: [
              Column(
                  children: appArray.appDetailsList
                      .asMap()
                      .entries
                      .map((e) =>
                      AppDetailsLayout(
                          data: e.value,
                          list: appArray.appDetailsList,
                          index: e.key,
                          onTap: () => value.onTapOption(e.value, context)
                      ))
                      .toList())
                  .paddingAll(Insets.i15)
                  .boxBorderExtension(context, isShadow: true)
            ]).paddingAll(Insets.i20)),
      );
    });
  }
}
