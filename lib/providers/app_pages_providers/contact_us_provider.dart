import 'package:fixit_user/config.dart';

class ContactUsProvider with ChangeNotifier {

  int rate = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> contactKey = GlobalKey<FormState>();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode messageFocus = FocusNode();

  int selectIndex = 0;

  onSelectError(index) {
    selectIndex = index;
    notifyListeners();
  }

  getInit(context) {
    dynamic data = ModalRoute
        .of(context)!
        .settings
        .arguments;
    rate = data['rate'];
    messageController.text = data['desc'];
    notifyListeners();
  }

  onContactTap(context) {
    if (contactKey.currentState!.validate()) {
      final RateAppProvider rateAppProvider = Provider.of(
          context, listen: false);
      rateAppProvider.rateApp(context, data: { "name": nameController.text,
        "email": emailController.text,
        "error_type": appArray.selectErrorList[selectIndex]});
    }
  }
}