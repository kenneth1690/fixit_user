import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit_user/screens/app_pages_screens/chat_history_screen/layouts/chat_history_layout.dart';

import '../../../config.dart';
import '../../../widgets/more_option_layout.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChatHistoryProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: AppBar(
              title: Text(language(context, appFonts.chatHistory),
                  style: appCss.dmDenseBold18
                      .textColor(appColor(context).darkText)),
              centerTitle: true,
              actions: [
                if(value.chatHistory.isNotEmpty)
                 MoreOptionLayout(
                  onSelected: (index) => value.onTapOption(index, context, this),
                  list: appArray.chatHistoryOptionList,
                ).paddingSymmetric(horizontal: Insets.i20)
              ],
              leading: CommonArrow(
                  arrow: eSvgAssets.arrowLeft,
                  onTap: () => route.pop(context)).paddingAll(Insets.i8)),
          /*body: SingleChildScrollView(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection(collectionName.users)
                    .doc(userModel!.id.toString())
                    .collection(collectionName.chats)
                    .where("bookingId", isNotEqualTo: null)
                    .snapshots(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    if (snap.data!.docs.isNotEmpty) {
                      return Column(children: [
                        Column(
                                children: snap.data!.docs
                                    .asMap()
                                    .entries
                                    .map((e) => ChatHistoryLayout(
                                        onTap: () => route.pushNamed(context,
                                                routeName.chatScreen, arg: {
                                              "image":
                                                  e.value['receiverImage'] ??
                                                      null,
                                              "name": e.value['receiverName'],
                                              "role": e.value['role'],
                                              "userId": e.value['receiverId'],
                                              "bookingId": e.value['bookingId']
                                            }),
                                        data: e.value.data(),
                                        index: e.key,
                                        list: snap.data!.docs))
                                    .toList())
                            .paddingAll(Insets.i15)
                            .boxShapeExtension(
                                color: appColor(context).fieldCardBg)
                      ]).paddingSymmetric(
                          horizontal: Insets.i20, vertical: Sizes.s15);
                    } else {
                      return const CommonEmpty().height(MediaQuery.of(context).size.height);
                    }
                  } else {
                    return const CommonEmpty().height(MediaQuery.of(context).size.height);
                  }
                }),
          )*/
      body:RefreshIndicator(
        onRefresh: ()async{
          return value.onReady(context);
        },
        child: value.chatHistory.isEmpty
            ? CommonEmpty(isButtonShow:true,bTap:() => value.onTapOption(0,context,this),)
            :  SingleChildScrollView(
            child: Column(children: [
              Column(
                  children: value.chatHistory
                      .asMap()
                      .entries
                      .map((e) => ChatHistoryLayout(
                      onTap: () =>value.onChatClick(context, e.value),
                      data: e.value.data(),
                      index: e.key,
                      list: value.chatHistory))
                      .toList())
                  .paddingAll(Insets.i15)
                  .boxShapeExtension(
                  color: appColor(context).fieldCardBg)
            ]).paddingSymmetric(
                horizontal: Insets.i20, vertical: Sizes.s15)),
      ));
    });
  }
}
