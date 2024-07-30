import 'package:fixit_user/config.dart';

class CurrencyModel {
  int? id;
  String? code;
  String? symbol;
  String? noOfDecimal;
  String? exchangeRate;
  String? thousandsSeparator;
  String? decimalSeparator;
  String? systemReserve;
  String? status;
  String? createdById;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<Media>? media;

  CurrencyModel(
      {this.id,
        this.code,
        this.symbol,
        this.noOfDecimal,
        this.exchangeRate,
        this.thousandsSeparator,
        this.decimalSeparator,
        this.systemReserve,
        this.status,
        this.createdById,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,this.media});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    symbol = json['symbol'];
    noOfDecimal = json['no_of_decimal'];
    exchangeRate = json['exchange_rate'];
    thousandsSeparator = json['thousands_separator'];
    decimalSeparator = json['decimal_separator'];
    systemReserve = json['system_reserve'];
    status = json['status'];
    createdById = json['created_by_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['symbol'] = symbol;
    data['no_of_decimal'] = noOfDecimal;
    data['exchange_rate'] = exchangeRate;
    data['thousands_separator'] = thousandsSeparator;
    data['decimal_separator'] = decimalSeparator;
    data['system_reserve'] = systemReserve;
    data['status'] = status;
    data['created_by_id'] = createdById;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}