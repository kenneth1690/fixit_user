
import '../config.dart';

class Services {
  int? id;
  String? title;
  String? price;
  String? status;
  String? duration;
  String? durationUnit;
  String? serviceRate;
  String? discount;
  String? description;
  String? userId;
  String? type;
  String? isFeatured;
  String? requiredServicemen;
  String? isMultipleServiceman;
  String? metaDescription;
  String? selectServiceManType;
  DateTime? serviceDate;
  List<int>? reviewRatings;
  int? ratingCount;
  List<CategoryModel>? categories;
  List<Services>? relatedServices;
  List<Media>? media;
  ProviderModel? user;
  List<Reviews>? reviews;
  List<ProviderModel>? selectedServiceMan;
  String? selectedRequiredServiceMan;
  String? selectDateTimeOption;
  String? selectedDateTimeFormat;
  String? selectedServiceNote;
  PrimaryAddress? primaryAddress;

  Services(
      {this.id,
        this.title,
        this.price,
        this.status,
        this.duration,
        this.durationUnit,
        this.serviceRate,
        this.discount,
        this.description,
        this.userId,
        this.type,
        this.isFeatured,
        this.requiredServicemen,
        this.isMultipleServiceman,
        this.metaDescription,
        this.selectServiceManType,
        this.serviceDate,
        this.reviewRatings,
        this.ratingCount,
        this.categories,
        this.relatedServices,
        this.media,
        this.user,
        this.reviews,this.selectedRequiredServiceMan,this.primaryAddress,this.selectDateTimeOption,this.selectedDateTimeFormat,this.selectedServiceNote});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    status = json['status'];
    duration = json['duration'];
    durationUnit = json['duration_unit'];
    serviceRate = json['service_rate'];
    discount = json['discount'];
    description = json['description'];
    userId = json['user_id'];
    type = json['type'];
    isFeatured = json['is_featured'];
    requiredServicemen = json['required_servicemen'];
    isMultipleServiceman = json['isMultipleServiceman'];
    metaDescription = json['meta_description'];
    selectServiceManType = json['selectServiceManType'];
    serviceDate = json["serviceDate"] == null ? null : DateTime.parse(json["serviceDate"]);
    reviewRatings = json['review_ratings'].cast<int>();
    ratingCount = json['rating_count'];
    selectedRequiredServiceMan = json['required_servicemen'] ?? "1";
    selectDateTimeOption = json['selectDateTimeOption'];
    selectedDateTimeFormat = json['selectedDateTimeFormat'];
    selectedServiceNote = json['selectedServiceNote'];
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
    if (json['related_services'] != null) {
      relatedServices = <Services>[];
      json['related_services'].forEach((v) {
        relatedServices!.add(Services.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    user = json['user'] != null ? ProviderModel.fromJson(json['user']) : null;
    primaryAddress = json['primary_address'] != null ? PrimaryAddress.fromJson(json['primary_address']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    if (json['selectedServiceMan'] != null) {
      selectedServiceMan = <ProviderModel>[];
      json['selectedServiceMan'].forEach((v) {
        selectedServiceMan!.add(ProviderModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['status'] = status;
    data['duration'] = duration;
    data['duration_unit'] = durationUnit;
    data['service_rate'] = serviceRate;
    data['discount'] = discount;
    data['description'] = description;
    data['user_id'] = userId;
    data['type'] = type;
    data['is_featured'] = isFeatured;
    data['required_servicemen'] = requiredServicemen;
    data['isMultipleServiceman'] = isMultipleServiceman;
    data['meta_description'] = metaDescription;
    data['selectServiceManType'] = selectServiceManType;
    data['serviceDate'] = serviceDate == null ? null : serviceDate!.toIso8601String();

    data['review_ratings'] = reviewRatings;
    data['rating_count'] = ratingCount;
    data['selectedRequiredServiceMan'] = selectedRequiredServiceMan;
    data['selectDateTimeOption'] = selectDateTimeOption;
    data['selectedDateTimeFormat'] = selectedDateTimeFormat;
    data['selectedServiceNote'] = selectedServiceNote;
    if (primaryAddress != null) {
      data['primary_address'] = primaryAddress!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (relatedServices != null) {
      data['related_services'] =
          relatedServices!.map((v) => v.toJson()).toList();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (selectedServiceMan != null) {
      data['selectedServiceMan'] =
          selectedServiceMan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
