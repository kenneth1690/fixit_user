import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';

class ChatHistoryProvider with ChangeNotifier {
  List chatHistory = [];

  onReady(context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    userModel =
        UserModel.fromJson(json.decode(preferences.getString(session.user)!));
    await FirebaseFirestore.instance
        .collection(collectionName.users)
        .doc(userModel!.id.toString())
        .collection(collectionName.chats)
        .get()
        .then((value) {
      chatHistory = [];
      if (value.docs.isNotEmpty) {
        chatHistory = value.docs;
      }

      notifyListeners();
    });
  }

  onClearChat(context, sync) {
    final value = Provider.of<DeleteDialogProvider>(context, listen: false);
    value.onDeleteDialog(sync, context, eImageAssets.clearChat,
        appFonts.clearChat, appFonts.areYouClearChat, () async {
      showLoading(context);
      notifyListeners();
      try {
        await FirebaseFirestore.instance
            .collection(collectionName.users)
            .doc(userModel!.id.toString())
            .collection(collectionName.chats)
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
           value.docs.asMap().entries.forEach((element) {

             FirebaseFirestore.instance
                 .collection(collectionName.users)
                 .doc(userModel!.id.toString())
                 .collection(collectionName.chatWith)
                 .doc(userModel!.id.toString() == element.value['senderId'].toString() ?element.value['receiverId'].toString() :element.value['senderId'].toString()  )
                 .collection(collectionName.booking)
                 .doc(element.value['bookingId'].toString() )
                 .collection(collectionName.chat)
                 .get()
                 .then((v) {
               for (var d in v.docs) {
                 FirebaseFirestore.instance
                     .collection(collectionName.users)
                     .doc(userModel!.id.toString())
                     .collection(collectionName.chatWith)
                     .doc(userModel!.id.toString() == element.value['senderId'].toString() ?element.value['receiverId'].toString() :element.value['senderId'].toString()  )
                     .collection(collectionName.booking)
                     .doc(element.value['bookingId'].toString() )
                     .collection(collectionName.chat)
                     .doc(d.id)
                     .delete();
               }
             }).then((a) {
               FirebaseFirestore.instance
                   .collection(collectionName.users)
                   .doc(userModel!.id.toString())
                   .collection(collectionName.chats)
                   .doc(value.docs[0].id)
                   .delete();
             }).then((value) {
               chatHistory = [];
               hideLoading(context);
             });
           });
          }
          hideLoading(context);
          notifyListeners();
        });
      } catch (e) {
        hideLoading(context);
        notifyListeners();
      }
      onReady(context);
      route.pop(context);
      notifyListeners();
      value.onResetPass(context, language(context, appFonts.hurrayChatDelete),
          language(context, appFonts.okay), () => route.pop(context));
    });
    value.notifyListeners();
  }

  onTapOption(index, context, sync) {
    if (index == 1) {
      onClearChat(context, sync);
      notifyListeners();
    } else {
      onReady(context);
      Fluttertoast.showToast(msg: "${language(context, appFonts.refresh)}...");
      //scaffoldMessage(context,"${language(context, appFonts.refresh)}...");
    }
  }

  onRefresh(context) {
    onReady(context);
    Fluttertoast.showToast(msg: "${language(context, appFonts.refresh)}...");
  }

  //click on particular chat redirect to chat detail page
  onChatClick(context, data) {
    route.pushNamed(context, routeName.chatScreen, arg: {
      "image": data['receiverImage'],
      "name": data['receiverName'],
      "role": data['role'],
      "userId": data['senderId'].toString() == userModel!.id.toString()
          ? data["receiverId"]
          : data['senderId'],
      "token": data['senderId'].toString() == userModel!.id.toString()
          ? data["receiverToken"]
          : data['senderToken'],
      "bookingId": data['bookingId'],
      "phone": data['senderId'].toString() == userModel!.id.toString()
          ? data.data().containsKey('receiverPhone')
              ? data["receiverPhone"]
              : ""
          : data.data().containsKey('senderPhone')
              ? data['senderPhone']
              : ""
    }).then((e) => onReady(context));
  }
}
