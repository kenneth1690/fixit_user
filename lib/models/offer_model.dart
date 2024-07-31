import '../config.dart';

class OfferModel {
  int? id;
  String? title;
  String? type;
  int? isOffer;
  String? relatedId;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  OfferModel(
      {this.id,
        this.title,
        this.type,
        this.isOffer,
        this.relatedId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.media});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    isOffer = json['is_offer'];
    relatedId = json['related_id']?.toString();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['is_offer'] = isOffer;
    data['related_id'] = relatedId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

