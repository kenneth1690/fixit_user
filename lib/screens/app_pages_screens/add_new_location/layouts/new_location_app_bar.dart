import '../../../../config.dart';

class NewLocationAppBar extends StatelessWidget implements PreferredSizeWidget {

  final TickerProvider? sync;
  const NewLocationAppBar({super.key, this.sync});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<NewLocationProvider>(context, listen: true);
    return Consumer<LocationProvider>(builder: (context2, locationCtrl, child) {
        return AppBar(
            leadingWidth: 80,
            title: Text(
                language(context,
                    value.isEdit ? appFonts.editLocation : appFonts.addNewLocation),
                style: appCss.dmDenseBold18
                    .textColor(appColor(context).darkText)),
            centerTitle: true,
            actions: [
              value.isEdit
                  ? CommonArrow(
                          arrow: eSvgAssets.delete,
                          svgColor: appColor(context).red,
                          onTap: ()=> locationCtrl.deleteAccountConfirmation(context,sync, value.address!.id,isBack: true),
                          color: appColor(context).red.withOpacity(0.1))
                      .paddingOnly(right: Insets.i20)
                  : const SizedBox()
            ],
            leading: CommonArrow(
                arrow: rtl(context) ? eSvgAssets.arrowRight : eSvgAssets.arrowLeft,
                onTap: () => route.pop(context)).padding(vertical: Insets.i8));
      }
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
