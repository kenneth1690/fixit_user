import 'dart:developer';

import '../config.dart';

class FavouriteModel {
  int? id;
  int? consumerId;
  int? providerId;
  int? serviceId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  ProviderModel? provider;
  Services? service;

  FavouriteModel(
      {this.id,
        this.consumerId,
        this.providerId,
        this.serviceId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.provider,
        this.service});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consumerId = json['consumer_id'];
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    provider = json['provider'] != null
        ? ProviderModel.fromJson(json['provider'])
        : null;
    service = json['service'] != null
        ? Services.fromJson(json['service'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consumer_id'] = consumerId;
    data['provider_id'] = providerId;
    data['service_id'] = serviceId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (provider != null) {
      data['provider'] = provider!.toJson();
    }
    if (service != null) {
      data['service'] = service!.toJson();
    }

    return data;
  }
}





