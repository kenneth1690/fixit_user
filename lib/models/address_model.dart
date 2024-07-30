

import '../config.dart';

class PrimaryAddress {
  int? id;
  String? userId;
  String? serviceId;
  String? isPrimary;
  String? latitude;
  String? longitude;
  String? area;
  String? postalCode;
  String? countryId;
  String? stateId;
  String? city;
  String? address;
  String? type;
  String? alternativeName;
  String? alternativePhone;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Country? country;
  Country? state;

  PrimaryAddress(
      {this.id,
        this.userId,
        this.serviceId,
        this.isPrimary,
        this.latitude,
        this.longitude,
        this.area,
        this.postalCode,
        this.countryId,
        this.stateId,
        this.city,
        this.address,
        this.type,
        this.alternativeName,
        this.alternativePhone,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.country,
        this.state});

  PrimaryAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    serviceId = json['service_id'];
    isPrimary = json['is_primary'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    area = json['area'];
    postalCode = json['postal_code'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    city = json['city'];
    address = json['address'];
    type = json['type'];
    alternativeName = json['alternative_name'];
    alternativePhone = json['alternative_phone'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
    state = json['state'] != null ? Country.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['service_id'] = serviceId;
    data['is_primary'] = isPrimary;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['area'] = area;
    data['postal_code'] = postalCode;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city'] = city;
    data['address'] = address;
    data['type'] = type;
    data['alternative_name'] = alternativeName;
    data['alternative_phone'] = alternativePhone;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}