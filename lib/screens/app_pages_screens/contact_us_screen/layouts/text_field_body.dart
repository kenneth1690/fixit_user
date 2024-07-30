import '../../../../config.dart';

class TextFieldBody extends StatelessWidget {
  const TextFieldBody({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ContactUsProvider>(context, listen: true);
    return Form(
      key: value.contactKey,
      child: Column(children: [
        ContainerWithTextLayout(title: language(context, appFonts.name)),
        const VSpace(Sizes.s8),
        TextFieldCommon(
                hintText: language(context, appFonts.enterName),
                controller: value.nameController,
                focusNode: value.nameFocus,
                prefixIcon: eSvgAssets.user,
                validator: (value) => validation.nameValidation(context, value),
                onFieldSubmitted: (values) => validation.fieldFocusChange(
                    context, value.nameFocus, value.emailFocus))
            .paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s15),
        ContainerWithTextLayout(title: language(context, appFonts.email)),
        const VSpace(Sizes.s8),
        TextFieldCommon(
                hintText: language(context, appFonts.enterEmail),
                controller: value.emailController,
                focusNode: value.emailFocus,
                prefixIcon: eSvgAssets.email,
                validator: (value) => validation.emailValidation(context, value),
                onFieldSubmitted: (values) => validation.fieldFocusChange(
                    context, value.emailFocus, value.nameFocus))
            .paddingSymmetric(horizontal: Insets.i20),
        const VSpace(Sizes.s15),
        ContainerWithTextLayout(title: language(context, appFonts.selectError)),
        const VSpace(Sizes.s8),
        Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 10,
            children: appArray.selectErrorList
                .asMap()
                .entries
                .map((e) => SelectErrorLayout(
                    data: e.value,
                    index: e.key,
                    selectedIndex: value.selectIndex,
                    onTap: () => value.onSelectError(e.key)))
                .toList()),
        const VSpace(Sizes.s15),
        ContainerWithTextLayout(title: language(context, appFonts.message)),
        TextFieldCommon(
                hintText: appFonts.writeHere,
                minLines: 5,
                maxLines: 5,
                focusNode: value.messageFocus,
                validator:(val) =>  validation.commonValidation(context, val),
                isNumber: true,
                controller: value.messageController)
            .paddingSymmetric(horizontal: Insets.i20)
      ]).paddingSymmetric(vertical: Insets.i20),
    );
  }
}
