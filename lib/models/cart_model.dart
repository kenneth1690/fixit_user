import 'dart:developer';

import '../config.dart';

class CartModel {
  bool? isPackage;
 /* String? image;
  String? name, date, time;
  String? price;
  String? rating;
  String? service;
  String? discount;*/
  List<ServicemanList>? servicemanList;

  Services? serviceList;
  ServicePackageModel? servicePackageList;

  CartModel(
      {this.isPackage,
     /* this.image,
      this.name,
      this.date,
      this.time,
      this.price,
      this.rating,
      this.service,
      this.discount,*/
      this.servicemanList,  this.servicePackageList,this.serviceList});

  CartModel.fromJson(Map<String, dynamic> json) {
    log("SSSS: $json");
    isPackage = json['isPackage'];
    /*image = json['image'];
    name = json['name'];
    price = json['price'];
    time = json['time'];
    date = json['date'];
    rating = json['rating'];
    service = json['service'];
    discount = json['discount'];*/
    if (json['servicemanList'] != null) {
      servicemanList = <ServicemanList>[];
      json['servicemanList'].forEach((v) {
        servicemanList!.add(ServicemanList.fromJson(v));
      });
    }
    json['serviceList'] != null ? Services.fromJson(json['serviceList']) : null;
    json['servicePackageList'] != null ? ServicePackageModel.fromJson(json['servicePackageList']) : null;
  log("ABC : ${json['servicePackageList']}");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isPackage'] = isPackage;
 /*   data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['date'] = date;
    data['time'] = time;
    data['rating'] = rating;
    data['service'] = service;
    data['discount'] = discount;*/
    if (servicemanList != null) {
      data['servicemanList'] = servicemanList!.map((v) => v.toJson()).toList();
    }
    if (serviceList != null) {
      data['serviceList'] = serviceList!.toJson();
    }
    if (servicePackageList != null) {
      data['servicePackageList'] = servicePackageList!.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toMap(CartModel music) => {
    'isPackage': music.isPackage,
    'serviceList': music.serviceList,
    'servicePackageList': music.servicePackageList,
  };

}

class ServicemanList {
  String? image;
  String? name;
  String? rating;

  ServicemanList({this.image, this.name, this.rating});

  ServicemanList.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['rating'] = rating;
    return data;
  }
}
