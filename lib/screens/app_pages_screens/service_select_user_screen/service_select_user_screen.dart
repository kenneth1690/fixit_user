import '../../../config.dart';

class ServiceSelectedUserScreen extends StatelessWidget {
  const ServiceSelectedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceSelectProvider>(
        builder: (context1, value, child) {
          return StatefulWrapper(
              onInit: () => Future.delayed(
                  const Duration(milliseconds: 100), () => value.onInit(context)),
              child: LoadingComponent(
                child: Scaffold(
                    appBar: AppBarCommon(
                        title: "${language(context, appFonts.step)} ${value.isStep2 == false
                            ? "1"
                            : "2" }"),
                    body: value.isStep2 == false ?
                    const ServiceSelectUserStepOne()
                        : const ServiceSelectUserStepTwo()
                ),
              )
          );
        }
    );
  }
}
