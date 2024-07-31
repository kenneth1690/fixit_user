
class BookingStatusModel {
  int? id;
  String? name;
  String? hexaCode;
  String? slug;
  int? sequence;
  String? description;

  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BookingStatusModel(
      {this.id,
        this.name,
        this.hexaCode,
        this.slug,
        this.sequence,
        this.description,

        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  BookingStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hexaCode = json['hexa_code'];
    slug = json['slug'];
    sequence = json['sequence'];
    description = json['description'];

    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['hexa_code'] = hexaCode;
    data['slug'] = slug;
    data['sequence'] = sequence;
    data['description'] = description;

    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}