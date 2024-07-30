class WalletModel {
  int? id;
  int? consumerId;
  double? balance;

  WalletModel({this.id, this.consumerId, this.balance});

  WalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consumerId = json['consumer_id'];
    balance = double.parse(json['balance'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consumer_id'] = consumerId;
    data['balance'] = balance;
    return data;
  }
}

class WalletList {
  int? id;
  int? walletId;
  String? bookingId;
  double? amount;
  String? type;
  String? detail;
  int? from;
  String? createdAt;

  WalletList(
      {this.id,
      this.walletId,
      this.bookingId,
      this.amount,
      this.type,
      this.detail,
      this.from,
      this.createdAt});

  WalletList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    walletId = json['wallet_id'];
    bookingId = json['booking_id'];
    amount = double.parse(json['amount'].toString());
    type = json['type'];
    detail = json['detail'];
    from = json['from'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['wallet_id'] = walletId;
    data['booking_id'] = bookingId;
    data['amount'] = amount;
    data['type'] = type;
    data['detail'] = detail;
    data['from'] = from;
    data['created_at'] = createdAt;
    return data;
  }
}
