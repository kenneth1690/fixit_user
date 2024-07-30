import '../../../../config.dart';

class PackageIncludedServiceLayout extends StatelessWidget {
  final dynamic data;
  const PackageIncludedServiceLayout({super.key,this.data});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: Sizes.s68,
                          width: Sizes.s68,
                          decoration: ShapeDecoration(
                              image: DecorationImage(
                                  image: AssetImage(data.image),fit: BoxFit.cover),
                              shape: const SmoothRectangleBorder(
                                  borderRadius: SmoothBorderRadius.all(
                                      SmoothRadius(
                                          cornerRadius: AppRadius.r8,
                                          cornerSmoothing: 1))))),
                      const HSpace(Sizes.s10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Sizes.s100,
                              child: Text(data.title,style: appCss.dmDenseMedium14
                                  .textColor(appColor(context).darkText)),
                            ),
                            Text("\$${data.price}",style: appCss.dmDenseMedium14
                                .textColor(appColor(context).darkText))
                          ]
                      )
                    ]
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(data.bookingId,style: appCss.dmDenseMedium14
                          .textColor(appColor(context).primary)),
                      const VSpace(Sizes.s6),
                      BookingStatusLayout(title: data.status,color: colorCondition(data.status,context))
                    ]
                )
              ]
          ),
          const DottedLines().paddingSymmetric(vertical: Insets.i12),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${data.serviceman} ${language(context, appFonts.servicemanSelected)}",style: appCss.dmDenseMedium12
                    .textColor(appColor(context).lightText)),
                Text(language(context, appFonts.viewMore),style: appCss.dmDenseMedium12
                    .textColor(appColor(context).primary))
              ]
          )
        ]
    ).paddingAll(Insets.i12).boxBorderExtension(context).paddingOnly(bottom: Insets.i12);
  }
}
