import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:fixit_user/config.dart';
import 'package:dio/dio.dart' as dio;
import 'package:fixit_user/screens/app_pages_screens/profile_detail_screen/layouts/selection_option_layout.dart';
import 'package:fixit_user/widgets/alert_message_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'dart:convert';

class ProfileDetailProvider with ChangeNotifier {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  String? dialCode;
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  XFile? imageFile;
  SharedPreferences? preferences;
  UserModel? userModel;

  var selectList = [
    {"image": eSvgAssets.gallery, "title": appFonts.chooseFromGallery},
    {"image": eSvgAssets.camera, "title": appFonts.openCamera}
  ];

  changeDialCode(CountryCodeCustom country) {
    dialCode = country.dialCode!;
    notifyListeners();
  }

// GET IMAGE FROM GALLERY
  Future getImage(context, source) async {
    final ImagePicker picker = ImagePicker();
    imageFile = (await picker.pickImage(source: source))!;
    notifyListeners();
    if (imageFile != null) {
      // updateProfile(context);
      route.pop(context);
    }
  }

  showLayout(context) async {
    showDialog(
      context: context,
      builder: (context1) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: Insets.i20),
          shape: const SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius.all(SmoothRadius(
                  cornerRadius: AppRadius.r14, cornerSmoothing: 1))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(language(context, appFonts.selectOne),
                    style: appCss.dmDenseBold18
                        .textColor(appColor(context).darkText)),
                const Icon(CupertinoIcons.multiply)
              ]),
              const VSpace(Sizes.s20),
              ...appArray.selectList
                  .asMap()
                  .entries
                  .map((e) => SelectOptionLayout(
                      data: e.value,
                      index: e.key,
                      list: appArray.selectList,
                      onTap: () {
                        if (e.key == 0) {
                          getImage(context, ImageSource.gallery);
                        } else {
                          getImage(context, ImageSource.camera);
                        }
                      }))
            ],
          ),
        );
      },
    );
  }

  updateProfile(
    context,
  ) async {
    FocusScope.of(context).requestFocus(FocusNode());
    showLoading(context);
    notifyListeners();
    dynamic mimeTypeData;
    if (imageFile != null) {
      mimeTypeData = lookupMimeType(imageFile!.path, headerBytes: [0xFF, 0xD8])!
          .split('/');
    }

    var body = {
      "name": txtName.text,
      "email": txtEmail.text,
      "code": dialCode,
      "phone": txtPhone.text,
      "_method": "PUT",
      if (imageFile != null)
        'profile_image': await dio.MultipartFile.fromFile(
            imageFile!.path.toString(),
            filename: imageFile!.name.toString(),
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1])),
    };

    dio.FormData formData = dio.FormData.fromMap(body);

    try {
      await apiServices
          .postApi(api.updateProfile, formData, isToken: true)
          .then((value) async {
        hideLoading(context);

        notifyListeners();
        if (value.isSuccess!) {
          route.pop(context);

          final commonApi =
              Provider.of<CommonApiProvider>(context, listen: false);
          await commonApi.selfApi(context);
        } else {
          log("value.message :${value.message}");
          snackBarMessengers(context,
              message: value.message, color: appColor(context).red);
        }
      });
    } catch (e) {
      log("EEEE :$e");
      hideLoading(context);
      notifyListeners();
    }
  }

  onInitData(context) async {
    preferences = await SharedPreferences.getInstance();
    bool isGuest = preferences!.getBool(session.isContinueAsGuest) ?? false;

    //Map user = json.decode(preferences!.getString(session.user)!);
    if (!isGuest) {
      showLoading(context);
      notifyListeners();
      userModel = UserModel.fromJson(
          json.decode(preferences!.getString(session.user)!));
      log("userModel :${userModel}");
      txtName.text = userModel!.name ?? "";
      txtEmail.text = userModel!.email ?? "";
      txtPhone.text = userModel!.phone ?? "";
      //dialCode = userModel!.code ?? "+91";
      if (userModel!.code != null) {
        int index = countriesEnglish.indexWhere((element) =>
            element['dial_code'] ==
            "${userModel!.code!.contains("+") ? "" : "+s"}${userModel!.code!}");
        log("index :$index");
        if (index >= 0) {
          dialCode = countriesEnglish[index]['dial_code'];
          notifyListeners();
        }
        log("dialCode :$dialCode");
      } else {
        dialCode = "+91";
      }
      await Future.delayed(Durations.short3);
      hideLoading(context);
      notifyListeners();
    }

    notifyListeners();
  }
}
