class PackageBookingModel {
  String? title;
  String? price;
  String? description;
  String? pImage;
  String? pName;
  String? rate;
  List<IncludedService>? includedService;

  PackageBookingModel(
      {this.title,
        this.price,
        this.description,
        this.pImage,
        this.pName,
        this.rate,
        this.includedService});

  PackageBookingModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    description = json['Description'];
    pImage = json['pImage'];
    pName = json['pName'];
    rate = json['rate'];
    if (json['includedService'] != null) {
      includedService = <IncludedService>[];
      json['includedService'].forEach((v) {
        includedService!.add(IncludedService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['price'] = price;
    data['Description'] = description;
    data['pImage'] = pImage;
    data['pName'] = pName;
    data['rate'] = rate;
    if (includedService != null) {
      data['includedService'] =
          includedService!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IncludedService {
  String? image;
  String? title;
  String? price;
  String? bookingId;
  String? status;
  String? serviceman;

  IncludedService(
      {this.image,
        this.title,
        this.price,
        this.bookingId,
        this.status,
        this.serviceman});

  IncludedService.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    price = json['price'];
    bookingId = json['bookingId'];
    status = json['status'];
    serviceman = json['serviceman'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['price'] = price;
    data['bookingId'] = bookingId;
    data['status'] = status;
    data['serviceman'] = serviceman;
    return data;
  }
}
