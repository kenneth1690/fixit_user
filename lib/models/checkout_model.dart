
class CheckoutModel {
  List<SingleServices>? services;
  List<ServicesPackage>? servicesPackage;
  FinalTotal? total;

  CheckoutModel({this.services, this.servicesPackage, this.total});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = <SingleServices>[];
      json['services'].forEach((v) {
        services!.add(SingleServices.fromJson(v));
      });
    }
    if (json['services_package'] != null) {
      servicesPackage = <ServicesPackage>[];
      json['services_package'].forEach((v) {
        servicesPackage!.add(ServicesPackage.fromJson(v));
      });
    }
    total = json['total'] != null ? FinalTotal.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (servicesPackage != null) {
      data['services_package'] =
          servicesPackage!.map((v) => v.toJson()).toList();
    }
    if (total != null) {
      data['total'] = total!.toJson();
    }
    return data;
  }
}

class SingleServices {
  String? providerId;
  int? serviceId;
  double? servicePrice;
  int? addressId;
  double? perServicemanCharge;
  String? dateTime;
  Total? total;

  SingleServices(
      {this.providerId,
        this.serviceId,
        this.servicePrice,
        this.addressId,
        this.perServicemanCharge,
        this.dateTime,
        this.total});

  SingleServices.fromJson(Map<String, dynamic> json) {
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    servicePrice =double.parse(json['service_price'].toString());
    addressId = json['address_id'];
    perServicemanCharge = double.parse(json['per_serviceman_charge'].toString());
    dateTime = json['date_time'];
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['provider_id'] = providerId;
    data['service_id'] = serviceId;
    data['service_price'] = servicePrice;
    data['address_id'] = addressId;
    data['per_serviceman_charge'] = perServicemanCharge;
    data['date_time'] = dateTime;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    return data;
  }
}

class ServicesPackage {
  int? servicePackageId;
  List<PackageServices>? services;

  ServicesPackage({this.servicePackageId, this.services});

  ServicesPackage.fromJson(Map<String, dynamic> json) {
    servicePackageId = json['service_package_id'];
    if (json['services'] != null) {
      services = <PackageServices>[];
      json['services'].forEach((v) {
        services!.add(PackageServices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_package_id'] = servicePackageId;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageServices {
  int? servicePackageId;
  String? providerId;
  int? serviceId;
  double? servicePackagePrice;
  int? addressId;
  double? tax;
  double? servicePrice;
  double? perServicemanCharge;
  String? dateTime;
  Total? total;

  PackageServices(
      {this.servicePackageId,
        this.providerId,
        this.serviceId,
        this.servicePackagePrice,
        this.addressId,
        this.tax,
        this.servicePrice,
        this.perServicemanCharge,
        this.dateTime,
        this.total});

  PackageServices.fromJson(Map<String, dynamic> json) {
    servicePackageId = json['service_package_id'];
    providerId = json['provider_id'];
    serviceId = json['service_id'];
    servicePackagePrice = double.parse(json['service_package_price'].toString());
    addressId = json['address_id'];
    tax =  double.parse(json['tax'].toString());
    servicePrice = double.parse(json['service_price'].toString());
    perServicemanCharge = double.parse(json['per_serviceman_charge'].toString());
    dateTime = json['date_time'];
    total = json['total'] != null ? Total.fromJson(json['total']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_package_id'] = servicePackageId;
    data['provider_id'] = providerId;
    data['service_id'] = serviceId;
    data['service_package_price'] = servicePackagePrice;
    data['address_id'] = addressId;
    data['tax'] = tax;
    data['service_price'] = servicePrice;
    data['per_serviceman_charge'] = perServicemanCharge;
    data['date_time'] = dateTime;
    if (total != null) {
      data['total'] = total!.toJson();
    }
    return data;
  }
}

class Total {
  String? requiredServicemen;
  int? totalExtraServicemen;
  int? totalServicemen;
  double? totalServicemanCharge;
  double? couponTotalDiscount;
  double? platformFees;
  String? platformFeesType;
  double? tax;
  double? subtotal;
  double? total;

  Total(
      {this.requiredServicemen,
        this.totalExtraServicemen,
        this.totalServicemen,
        this.totalServicemanCharge,
        this.couponTotalDiscount,
        this.platformFees,
        this.platformFeesType,
        this.tax,
        this.subtotal,
        this.total});

  Total.fromJson(Map<String, dynamic> json) {
    requiredServicemen = json['required_servicemen'];
    totalExtraServicemen = json['total_extra_servicemen'];
    totalServicemen = int.parse(json['total_servicemen'].toString());
    totalServicemanCharge =  double.parse(json['total_serviceman_charge'].toString());
    couponTotalDiscount = double.parse(json['coupon_total_discount'].toString());
    platformFees = double.parse(json['platform_fees'].toString());
    platformFeesType = json['platform_fees_type'];
    tax = double.parse(json['tax'].toString());
    subtotal =double.parse(json['subtotal'].toString());
    total = double.parse(json['total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['required_servicemen'] = requiredServicemen;
    data['total_extra_servicemen'] = totalExtraServicemen;
    data['total_servicemen'] = totalServicemen;
    data['total_serviceman_charge'] = totalServicemanCharge;
    data['coupon_total_discount'] = couponTotalDiscount;
    data['platform_fees'] = platformFees;
    data['platform_fees_type'] = platformFeesType;
    data['tax'] = tax;
    data['subtotal'] = subtotal;
    data['total'] = total;
    return data;
  }
}

class FinalTotal {
  int? requiredServicemen;
  int? totalExtraServicemen;
  int? totalServicemen;
  double? totalServicemanCharge;
  double? couponTotalDiscount;
  double? tax;
  double? platformFees;
  String? platformFeesType;
  double? subtotal;
  double? total;

  FinalTotal(
      {this.requiredServicemen,
        this.totalExtraServicemen,
        this.totalServicemen,
        this.totalServicemanCharge,
        this.couponTotalDiscount,
        this.tax,
        this.platformFees,
        this.platformFeesType,
        this.subtotal,
        this.total});

  FinalTotal.fromJson(Map<String, dynamic> json) {
    requiredServicemen = json['required_servicemen'];
    totalExtraServicemen = json['total_extra_servicemen'];
    totalServicemen = json['total_servicemen'];
    totalServicemanCharge = double.parse(json['total_serviceman_charge'].toString());
    couponTotalDiscount =  double.parse(json['coupon_total_discount'].toString());
    tax = double.parse(json['tax'].toString());
    platformFees = double.parse(json['platform_fees'].toString());
    platformFeesType = json['platform_fees_type'];
    subtotal =  double.parse(json['subtotal'].toString());
    total = double.parse(json['total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['required_servicemen'] = requiredServicemen;
    data['total_extra_servicemen'] = totalExtraServicemen;
    data['total_servicemen'] = totalServicemen;
    data['total_serviceman_charge'] = totalServicemanCharge;
    data['coupon_total_discount'] = couponTotalDiscount;
    data['tax'] = tax;
    data['platform_fees'] = platformFees;
    data['platform_fees_type'] = platformFeesType;
    data['subtotal'] = subtotal;
    data['total'] = total;
    return data;
  }
}