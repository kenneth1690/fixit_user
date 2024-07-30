import 'package:fixit_user/providers/auth_providers/change_password_provider.dart';

import '../../../../config.dart';

class ChangePasswordLayout extends StatelessWidget {
  const ChangePasswordLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordProvider>(
        builder: (context1, resetPass, child) {
      return StatefulWrapper(
        onInit: () => Future.delayed(DurationClass.ms50)
            .then((value) => resetPass.getArg(context)),
        child: Stack(clipBehavior: Clip.none, children: [
          const FieldsBackground(),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWithTextLayout(
                    title: language(context, appFonts.currentPassword)),
                const VSpace(Sizes.s8),
                TextFieldCommon(
                    hintText: language(context, appFonts.enterCurrentPassword),
                    obscureText: resetPass.isOldPassword,
                    controller: resetPass.txtOldPassword,
                    focusNode: resetPass.oldPasswordFocus,
                    prefixIcon: eSvgAssets.lock,
                    validator: (value) =>
                        validation.passValidation(context, value),
                    onFieldSubmitted: (value) =>
                        validation.fieldFocusChange(
                            context,
                            resetPass.oldPasswordFocus,
                            resetPass.passwordFocus),
                    suffixIcon: SvgPicture.asset(
                        resetPass.isOldPassword
                            ? eSvgAssets.hide
                            : eSvgAssets.eye,
                        fit: BoxFit.scaleDown)
                        .inkWell(
                        onTap: () => resetPass.oldPasswordSeenTap()))
                    .paddingSymmetric(horizontal: Insets.i20),
                const VSpace(Sizes.s15),
                ContainerWithTextLayout(
                    title: language(context, appFonts.newPassword)),
                const VSpace(Sizes.s8),
                TextFieldCommon(
                        hintText: language(context, appFonts.enterNewPassword),
                        obscureText: resetPass.isNewPassword,
                        controller: resetPass.txtNewPassword,
                        focusNode: resetPass.passwordFocus,
                        prefixIcon: eSvgAssets.lock,
                        validator: (value) =>
                            validation.passValidation(context, value),
                        onFieldSubmitted: (value) =>
                            validation.fieldFocusChange(
                                context,
                                resetPass.passwordFocus,
                                resetPass.confirmPasswordFocus),
                        suffixIcon: SvgPicture.asset(
                                resetPass.isNewPassword
                                    ? eSvgAssets.hide
                                    : eSvgAssets.eye,
                                fit: BoxFit.scaleDown)
                            .inkWell(
                                onTap: () => resetPass.newPasswordSeenTap()))
                    .paddingSymmetric(horizontal: Insets.i20),
                const VSpace(Sizes.s15),
                ContainerWithTextLayout(
                    title: language(context, appFonts.confirmPassword)),
                const VSpace(Sizes.s8),
                TextFieldCommon(
                        hintText:
                            language(context, appFonts.enterConfirmPassword),
                        controller: resetPass.txtConfirmPassword,
                        obscureText: resetPass.isConfirmPassword,focusNode: resetPass.confirmPasswordFocus,
                        validator: (value) => validation.confirmPassValidation(
                            context, value, resetPass.txtNewPassword.text),
                        suffixIcon: SvgPicture.asset(
                                resetPass.isConfirmPassword
                                    ? eSvgAssets.hide
                                    : eSvgAssets.eye,
                                fit: BoxFit.scaleDown)
                            .inkWell(
                                onTap: () =>
                                    resetPass.confirmPasswordSeenTap()),
                        prefixIcon: eSvgAssets.lock)
                    .paddingSymmetric(horizontal: Insets.i20),
                const VSpace(Sizes.s40),
                ButtonCommon(
                  title: appFonts.updatePassword,
                  onTap: () => resetPass.updatePassword(context),
                ).paddingSymmetric(horizontal: Insets.i20),
              ]).paddingSymmetric(vertical: Insets.i20)
        ]),
      );
    });
  }
}
