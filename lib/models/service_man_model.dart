
import '../config.dart';

class ServicemanModel {
  int? id;
  String? name;
  String? email;
  String? systemReserve;
  String? phone;
  String? code;
  String? providerId;
  String? fcmToken;
  String? description;
  String? status;
  String? isFeatured;
  String? isVerified;
  String? type;
  String? emailVerifiedAt;
  String? experienceInterval;
  String? experienceDuration;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? reviewRatings;
  PrimaryAddress? primaryAddress;
  List<Media>? media;
  WalletModel? wallet;
  List<KnownLanguageModel>? knownLanguages;
  List<ExpertiseModel>? expertise;
  List<PrimaryAddress>? addresses;
  List<Reviews>? reviews;
  List<Reviews>? servicemanReviews;
  List<Roles>? roles;

  ServicemanModel(
      {this.id,
        this.name,
        this.email,
        this.systemReserve,
        this.phone,
        this.code,
        this.providerId,
        this.description,
        this.status,
        this.isFeatured,
        this.isVerified,
        this.fcmToken,
        this.type,
        this.emailVerifiedAt,
        this.experienceInterval,
        this.experienceDuration,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.reviewRatings,
        this.primaryAddress,
        this.media,
        this.wallet,
        this.knownLanguages,
        this.expertise,
        this.addresses,
        this.reviews,this.servicemanReviews});

  ServicemanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    systemReserve = json['system_reserve'];
    phone = json['phone'];
    code = json['code'];
    fcmToken = json['fcm_token'];
    providerId = json['provider_id'];
    description = json['description'];
    status = json['status'];
    isFeatured = json['is_featured'];
    isVerified = json['is_verified'];
    type = json['type'];
    emailVerifiedAt = json['email_verified_at'];
    experienceInterval = json['experience_interval'];
    experienceDuration = json['experience_duration'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    reviewRatings = json['review_ratings'].toString();
    primaryAddress = json['primary_address'] != null
        ? PrimaryAddress.fromJson(json['primary_address'])
        : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    wallet = json['wallet'] != null
        ? WalletModel.fromJson(json['wallet'])
        : null;
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
    if (json['addresses'] != null) {
      addresses = <PrimaryAddress>[];
      json['addresses'].forEach((v) {
        addresses!.add(PrimaryAddress.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['servicemanreviews'] != null) {
      servicemanReviews = <Reviews>[];
      json['servicemanreviews'].forEach((v) {
        servicemanReviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['system_reserve'] = systemReserve;
    data['phone'] = phone;
    data['code'] = code;
    data['fcm_token'] = fcmToken;
    data['provider_id'] = providerId;
    data['description'] = description;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    data['is_verified'] = isVerified;
    data['type'] = type;
    data['email_verified_at'] = emailVerifiedAt;
    data['experience_interval'] = experienceInterval;
    data['experience_duration'] = experienceDuration;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['review_ratings'] = reviewRatings;
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
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    } if (servicemanReviews != null) {
      data['servicemanreviews'] = servicemanReviews!.map((v) => v.toJson()).toList();
    }
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? systemReserve;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
        this.name,
        this.guardName,
        this.systemReserve,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
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