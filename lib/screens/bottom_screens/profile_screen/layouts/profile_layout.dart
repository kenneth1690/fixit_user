import 'dart:developer';

import '../../../../config.dart';

class ProfileLayout extends StatelessWidget {
  final Animation<Offset>? offsetAnimation;
  final GestureTapCallback? onTap;

  const ProfileLayout({super.key, this.offsetAnimation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CommonApiProvider,ProfileProvider>(builder: (context1, value,profile, child) {

      return Stack(alignment: Alignment.topRight, children: [
        SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(children: [

                    ProfilePicCommon(
                        imageUrl:userModel != null&& userModel!.media != null &&
                                userModel!.media!.isNotEmpty
                            ? userModel!.media![0].originalUrl!
                            : null),
                  const VSpace(Sizes.s5),
                  if(profile.isGuest)
                    Text(
                        "Guest",
                        style: appCss.dmDenseSemiBold14
                            .textColor(appColor(context).darkText)),
                  if(!profile.isGuest)
                  userModel != null &&
                          userModel!.name != null &&
                          userModel!.email != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                userModel != null && userModel!.name != null
                                    ? capitalizeFirstLetter(userModel!.name!)
                                    : "",
                                style: appCss.dmDenseSemiBold14
                                    .textColor(appColor(context).darkText)),
                            const VSpace(Sizes.s3),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(eSvgAssets.mail),
                                  const HSpace(Sizes.s5),
                                  Text(
                                      userModel != null &&
                                              userModel!.email != null
                                          ? language(context, userModel!.email)
                                          : "",
                                      style: appCss.dmDenseMedium12.textColor(
                                          appColor(context).lightText))
                                ]),
                            const VSpace(Sizes.s3),
                            if (userModel != null && userModel!.phone != null)
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(eSvgAssets.phone),
                                    const HSpace(Sizes.s5),
                                    Text(
                                        userModel != null &&
                                                userModel!.phone != null
                                            ? "${userModel!.code} ${userModel!.phone}"
                                            : "",
                                        style: appCss.dmDenseMedium12.textColor(
                                            appColor(context).lightText))
                                  ])
                          ]
                        )
                      : userModel != null && userModel!.phone != null
                      ?
                  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              SvgPicture.asset(eSvgAssets.phone),
                              const HSpace(Sizes.s5),
                              Text(
                                  userModel != null && userModel!.phone != null
                                      ? "${userModel!.code} ${userModel!.phone}"
                                      : "",
                                  style: appCss.dmDenseMedium12
                                      .textColor(appColor(context).lightText))
                            ]):Container(),
                  const VSpace(Sizes.s16),
                  BalanceLayout(
                      isGuest: profile.isGuest,
                      offsetAnimation: offsetAnimation,
                      totalBalance:userModel != null&& userModel!.wallet != null
                          ? userModel!.wallet!.balance.toString()
                          : "0.00")
                ]).paddingSymmetric(
                    vertical: Insets.i15, horizontal: Insets.i13))
            .boxShapeExtension(
                color: appColor(context).fieldCardBg, radius: AppRadius.r12),
        SvgPicture.asset(
          eSvgAssets.edit,
          height: Sizes.s24,
          width: Sizes.s24
        ).paddingAll(Insets.i15).inkWell(onTap: onTap)
      ]);
    });
  }
}
