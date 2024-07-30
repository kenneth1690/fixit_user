class DateTimeChip {
  String? time;
  List<MessageModel>? message;

  DateTimeChip({
    this.time,
    this.message,
  });

  DateTimeChip.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    if (json['message'] != null) {
      message = <MessageModel>[];
      json['message'].forEach((v) {
        message!.add(MessageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    if (message != null) {
      data['message'] = message!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MessageModel {
  String? senderId,
      senderName,
      receiverId,
      content,
      timestamp,
      type,
      receiverName,
      messageType,
      chatId,
      senderImage,
      receiverImage,
      docId,role,bookingId;
  bool? isSeen;

  MessageModel(
      {this.senderId,
      this.senderName,
      this.content,
      this.timestamp,
      this.type,
      this.chatId,
      this.messageType,
      this.isSeen = false,
      this.docId,
      this.receiverId,
      this.receiverImage,
      this.receiverName,
      this.senderImage,this.role,this.bookingId});

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json["senderId"].toString();
    senderName = json['senderName'] ?? '';
    receiverId = json['receiverId'].toString();
    content = json['content'] ?? '';
    timestamp = json['timestamp'];
    docId = json['docId'];
    type = json['type'] ?? '';
    chatId = json['chatId'] ?? '';
    messageType = json['messageType'] ?? "";
    receiverName = json['receiverName'] ?? "";
    role = json['role'] ?? "";
    receiverImage = json['receiverImage'] ?? "";
    senderImage = json['senderImage'] ?? "";
    bookingId = json['bookingId'] ?? "";

    isSeen = json['isSeen'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['senderName'] = senderName;
    data['receiverId'] = receiverId;
    data['content'] = content;
    data['timestamp'] = timestamp;
    data['docId'] = docId;
    data['type'] = type;
    data['chatId'] = chatId;
    data['messageType'] = messageType;
    data['senderImage'] = senderImage;
    data['receiverImage'] = receiverImage;
    data['receiverName'] = receiverName;
    data['role'] = role;
    data['bookingId'] = bookingId;

    data['isSeen'] = isSeen;

    return data;
  }
}
