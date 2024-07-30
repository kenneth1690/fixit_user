import '../../../config.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ContactUsProvider>(builder: (context1, value, child) {
      return StatefulWrapper(
        onInit:()=> Future.delayed(DurationClass.ms50).then((data) => value.getInit(context)),
        child: LoadingComponent(
          child: Scaffold(
              appBar: AppBar(
                  leadingWidth: 80,
                  title: Text(language(context, appFonts.contactUs),
                      style: appCss.dmDenseBold18
                          .textColor(appColor(context).darkText)),
                  centerTitle: true,
                  leading: CommonArrow(arrow: rtl(context) ? eSvgAssets.arrowRight : eSvgAssets.arrowLeft,onTap: ()=> route.pop(context))
                      .padding(vertical: Insets.i8)),
              body: SingleChildScrollView(
                child: Column(children: [
                  const Stack(children: [FieldsBackground(), TextFieldBody()]),
                  const VSpace(Sizes.s40),
                  ButtonCommon(title: appFonts.submit,onTap: ()=>value.onContactTap(context),)
                ]).paddingAll(Insets.i20),
              )),
        ),
      );
    });
  }
}
