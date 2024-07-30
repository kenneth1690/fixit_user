class KnownLanguageModel {
  String? key;
  int? id;
  KnownLanguagePivot? pivot;

  KnownLanguageModel({this.key, this.id, this.pivot});

  KnownLanguageModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    id = json['id'];
    pivot = json['pivot'] != null ? KnownLanguagePivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['id'] = id;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class KnownLanguagePivot {
  String? userId;
  String? languageId;

  KnownLanguagePivot({this.userId, this.languageId});

  KnownLanguagePivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['language_id'] = languageId;
    return data;
  }
}
