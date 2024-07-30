class PagesModel {
  int? id;
  String? title;
  String? content;
  String? metaTitle;
  String? metaDescription;
  String? status;
  String? createdById;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  PagesModel(
      {this.id,
        this.title,
        this.content,
        this.metaTitle,
        this.metaDescription,
        this.status,
        this.createdById,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  PagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    status = json['status'];
    createdById = json['created_by_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['status'] = status;
    data['created_by_id'] = createdById;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}