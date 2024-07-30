

import '../config.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? systemReserve;
  String? served;
  String? phone;
  String? code;
  String? providerId;
  String? status;
  String? isFeatured;
  String? isVerified;
  String? type;
  String? emailVerifiedAt;
  String? fcmToken;
  String? experienceInterval;
  String? experienceDuration;
  String? description;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? companyId;
  Role? role;
  PrimaryAddress? primaryAddress;
  List<Media>? media;
  WalletModel? wallet;
  List<KnownLanguageModel>? knownLanguages;
  List<ExpertiseModel>? expertise;

  String? companyName;
  String? companyEmail;
  String? companyPhone;
  String? companyCode;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.systemReserve,
        this.served,
        this.phone,
        this.code,
        this.providerId,
        this.status,
        this.isFeatured,
        this.isVerified,
        this.type,
        this.emailVerifiedAt,
        this.fcmToken,
        this.experienceInterval,
        this.experienceDuration,
        this.description,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.companyId,
        this.role,
        this.primaryAddress,
        this.media,
        this.wallet,
        this.knownLanguages,
        this.expertise,this.companyCode,this.companyEmail,this.companyName,this.companyPhone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    systemReserve = json['system_reserve'];
    served = json['served'];
    phone = json['phone'];
    code = json['code'];
    providerId = json['provider_id'];
    status = json['status'];
    isFeatured = json['is_featured'];
    isVerified = json['is_verified'];
    type = json['type'];
    emailVerifiedAt = json['email_verified_at'];
    fcmToken = json['fcm_token'];
    experienceInterval = json['experience_interval'];
    experienceDuration = json['experience_duration'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    companyCode = json['company_code'];
    description = json['description'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    companyId = json['company_id'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;

    primaryAddress = json['primary_address'] != null
        ? PrimaryAddress.fromJson(json['primary_address'])
        : null;

    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }

    wallet =  json['wallet'] != null ? WalletModel.fromJson(json['wallet']):null;

    if (json['known_languages'] != null) {
      knownLanguages = <KnownLanguageModel>[];
      json['known_languages'].forEach((v) {
        knownLanguages!.add(KnownLanguageModel.fromJson(v));
      });
    }
    if (json['expertise'] != null) {
      expertise = <ExpertiseModel>[];
      json['expertise'].forEach((v) {
        expertise!.add(ExpertiseModel.fromJson(v));
      });
    }



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['system_reserve'] = systemReserve;
    data['served'] = served;
    data['phone'] = phone;
    data['code'] = code;
    data['provider_id'] = providerId;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['is_verified'] = isVerified;
    data['type'] = type;
    data['email_verified_at'] = emailVerifiedAt;
    data['fcm_token'] = fcmToken;
    data['experience_interval'] = experienceInterval;
    data['experience_duration'] = experienceDuration;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    data['company_phone'] = companyPhone;
    data['company_code'] = companyCode;
    data['description'] = description;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['company_id'] = companyId;
    if (role != null) {
      data['role'] = role!.toJson();
    }

    if (primaryAddress != null) {
      data['primary_address'] = primaryAddress!.toJson();
    }

    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    data['wallet'] = wallet;

    if (knownLanguages != null) {
      data['known_languages'] =
          knownLanguages!.map((v) => v.toJson()).toList();
    }
    if (expertise != null) {
      data['expertise'] = expertise!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}


class Role {
  int? id;
  String? name;
  String? guardName;
  String? systemReserve;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Role(
      {this.id,
        this.name,
        this.guardName,
        this.systemReserve,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardName = json['guard_name'];
    systemReserve = json['system_reserve'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['guard_name'] = guardName;
    data['system_reserve'] = systemReserve;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}