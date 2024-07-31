





import '../config.dart';

class BannerModel {
  int? id;
  String? type;
  String? relatedId;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Media>? media;

  BannerModel(
      {this.id,
        this.type,
        this.relatedId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.media});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
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
    data['type'] = type;
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
