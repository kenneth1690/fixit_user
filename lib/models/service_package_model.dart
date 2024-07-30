
import '../config.dart';

class ServicePackageModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? discount;
  String? status;
  String? hexaCode;
  String? isFeatured;
  String? slug;
  String? metaTitle;
  String? metaDescription;
  String? providerId;
  String? createdById;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  List<Services>? services;
  List<Media>? media;
  ProviderModel? user;

  ServicePackageModel(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.discount,
        this.status,
        this.hexaCode,
        this.isFeatured,
        this.slug,
        this.metaTitle,
        this.metaDescription,
        this.providerId,
        this.createdById,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.services,
        this.media,this.user});

  ServicePackageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    discount = json['discount'];
    status = json['status'];
    hexaCode = json['hexa_code'];
    isFeatured = json['is_featured'];
    slug = json['slug'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    providerId = json['provider_id'];
    createdById = json['created_by_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    user = json['user'] != null ? ProviderModel.fromJson(json['user']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['discount'] = discount;
    data['status'] = status;
    data['hexa_code'] = hexaCode;
    data['is_featured'] = isFeatured;
    data['slug'] = slug;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['provider_id'] = providerId;
    data['created_by_id'] = createdById;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }

    if (user != null) {
      data['user'] = user;
    }
    return data;
  }
}
