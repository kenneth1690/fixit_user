class SelectServicePackageModel {
  String? title;
  String? image;
  String? rate;
  String? time;
  String? serviceTime;
  String? date;
  List<RequiredServicemen>? requiredServicemen;

  SelectServicePackageModel(
      {this.title,
        this.image,
        this.rate,
        this.time,
        this.serviceTime,
        this.date,
        this.requiredServicemen});

  SelectServicePackageModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    rate = json['rate'];
    time = json['time'];
    serviceTime = json['serviceTime'];
    date = json['date'];
    if (json['requiredServicemen'] != null) {
      requiredServicemen = <RequiredServicemen>[];
      json['requiredServicemen'].forEach((v) {
        requiredServicemen!.add(RequiredServicemen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['rate'] = rate;
    data['time'] = time;
    data['serviceTime'] = serviceTime;
    data['date'] = date;
    if (requiredServicemen != null) {
      data['requiredServicemen'] =
          requiredServicemen!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RequiredServicemen {
  String? image;
  String? title;
  String? rate;

  RequiredServicemen({this.image, this.title, this.rate});

  RequiredServicemen.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['rate'] = rate;
    return data;
  }
}