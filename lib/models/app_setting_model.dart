
import 'package:fixit_user/config.dart';


class AppSettingModel {
  General? general;
  Activation? activation;
  SubscriptionPlan? subscriptionPlan;
  ProviderCommissions? providerCommissions;
  DefaultCreationLimits? defaultCreationLimits;
  FirebaseCred? firebase;

  AppSettingModel(
      {this.general,
        this.activation,
        this.subscriptionPlan,
        this.providerCommissions,
        this.defaultCreationLimits,this.firebase});

  AppSettingModel.fromJson(Map<String, dynamic> json) {
    general =
    json['general'] != null ? General.fromJson(json['general']) : null;
    activation = json['activation'] != null
        ? Activation.fromJson(json['activation'])
        : null;
    subscriptionPlan = json['subscription_plan'] != null
        ? SubscriptionPlan.fromJson(json['subscription_plan'])
        : null;
    providerCommissions = json['provider_commissions'] != null
        ? ProviderCommissions.fromJson(json['provider_commissions'])
        : null;
    defaultCreationLimits = json['default_creation_limits'] != null
        ? DefaultCreationLimits.fromJson(json['default_creation_limits'])
        : null;
    firebase = json['firebase'] != null
        ? FirebaseCred.fromJson(json['firebase'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (general != null) {
      data['general'] = general!.toJson();
    }
    if (activation != null) {
      data['activation'] = activation!.toJson();
    }
    if (subscriptionPlan != null) {
      data['subscription_plan'] = subscriptionPlan!.toJson();
    }
    if (providerCommissions != null) {
      data['provider_commissions'] = providerCommissions!.toJson();
    }
    if (defaultCreationLimits != null) {
      data['default_creation_limits'] = defaultCreationLimits!.toJson();
    }
    if (firebase != null) {
      data['firebase'] = firebase!.toJson();
    }
    return data;
  }
}

class General {
  String? mode;
  String? favicon;
  String? copyright;
  String? darkLogo;
  String? siteName;
  String? lightLogo;
  String? platformFees;
  String? defaultTimezone;
  String? minBookingAmount;
  String? platformFeesType;
  String? defaultCurrencyId;
  String? defaultLanguageId;
  String? firebaseServerKey;
  CurrencyModel? defaultCurrency;
  DefaultLanguage? defaultLanguage;

  General(
      {this.mode,
        this.favicon,
        this.copyright,
        this.darkLogo,
        this.siteName,
        this.lightLogo,
        this.platformFees,
        this.defaultTimezone,
        this.minBookingAmount,
        this.platformFeesType,
        this.defaultCurrencyId,
        this.defaultLanguageId,
        this.firebaseServerKey,
        this.defaultCurrency,
        this.defaultLanguage});

  General.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    favicon = json['favicon'];
    copyright = json['copyright'];
    darkLogo = json['dark_logo'];
    siteName = json['site_name'];
    lightLogo = json['light_logo'];
    platformFees = json['platform_fees'];
    defaultTimezone = json['default_timezone'];
    minBookingAmount = json['min_booking_amount'];
    platformFeesType = json['platform_fees_type'];
    defaultCurrencyId = json['default_currency_id'];
    defaultLanguageId = json['default_language_id'];
    firebaseServerKey = json['firebase_server_key'];
    defaultCurrency = json['default_currency'] != null
        ? CurrencyModel.fromJson(json['default_currency'])
        : null;
    defaultLanguage = json['default_language'] != null
        ? DefaultLanguage.fromJson(json['default_language'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mode'] = mode;
    data['favicon'] = favicon;
    data['copyright'] = copyright;
    data['dark_logo'] = darkLogo;
    data['site_name'] = siteName;
    data['light_logo'] = lightLogo;
    data['platform_fees'] = platformFees;
    data['default_timezone'] = defaultTimezone;
    data['min_booking_amount'] = minBookingAmount;
    data['platform_fees_type'] = platformFeesType;
    data['default_currency_id'] = defaultCurrencyId;
    data['default_language_id'] = defaultLanguageId;
    data['firebase_server_key'] = firebaseServerKey;
    if (defaultCurrency != null) {
      data['default_currency'] = defaultCurrency!.toJson();
    }
    if (defaultLanguage != null) {
      data['default_language'] = defaultLanguage!.toJson();
    }
    return data;
  }
}

class DefaultLanguage {
  int? id;
  String? name;
  String? locale;
  String? appLocale;
  int? isRtl;
  int? status;
  String? systemReserve;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  DefaultLanguage(
      {this.id,
        this.name,
        this.locale,
        this.appLocale,
        this.isRtl,
        this.status,
        this.systemReserve,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DefaultLanguage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    locale = json['locale'];
    appLocale = json['app_locale'];
    isRtl = json['is_rtl'];
    status = json['status'];
    systemReserve = json['system_reserve'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['locale'] = locale;
    data['app_locale'] = appLocale;
    data['is_rtl'] = isRtl;
    data['status'] = status;
    data['system_reserve'] = systemReserve;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Activation {
  String? cash;
  String? couponEnable;
  String? walletEnable;
  String? extraChargeStatus;
  String? platformFeesStatus;
  String? serviceAutoApprove;
  String? providerAutoApprove;

  Activation(
      {this.cash,
        this.couponEnable,
        this.walletEnable,
        this.extraChargeStatus,
        this.platformFeesStatus,
        this.serviceAutoApprove,
        this.providerAutoApprove});

  Activation.fromJson(Map<String, dynamic> json) {
    cash = json['cash'];
    couponEnable = json['coupon_enable'];
    walletEnable = json['wallet_enable'];
    extraChargeStatus = json['extra_charge_status'];
    platformFeesStatus = json['platform_fees_status'];
    serviceAutoApprove = json['service_auto_approve'];
    providerAutoApprove = json['provider_auto_approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cash'] = cash;
    data['coupon_enable'] = couponEnable;
    data['wallet_enable'] = walletEnable;
    data['extra_charge_status'] = extraChargeStatus;
    data['platform_fees_status'] = platformFeesStatus;
    data['service_auto_approve'] = serviceAutoApprove;
    data['provider_auto_approve'] = providerAutoApprove;
    return data;
  }
}

class SubscriptionPlan {
  String? freeTrialDays;
  String? freeTrialEnabled;

  SubscriptionPlan({this.freeTrialDays, this.freeTrialEnabled});

  SubscriptionPlan.fromJson(Map<String, dynamic> json) {
    freeTrialDays = json['free_trial_days'];
    freeTrialEnabled = json['free_trial_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['free_trial_days'] = freeTrialDays;
    data['free_trial_enabled'] = freeTrialEnabled;
    return data;
  }
}

class ProviderCommissions {
  String? status;
  String? minWithdrawAmount;
  String? defaultCommissionRate;
  String? isCategoryBasedCommission;

  ProviderCommissions(
      {this.status,
        this.minWithdrawAmount,
        this.defaultCommissionRate,
        this.isCategoryBasedCommission});

  ProviderCommissions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    minWithdrawAmount = json['min_withdraw_amount'];
    defaultCommissionRate = json['default_commission_rate'];
    isCategoryBasedCommission = json['is_category_based_commission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['min_withdraw_amount'] = minWithdrawAmount;
    data['default_commission_rate'] = defaultCommissionRate;
    data['is_category_based_commission'] = isCategoryBasedCommission;
    return data;
  }
}

class DefaultCreationLimits {
  String? allowedMaxServices;
  String? allowedMaxAddresses;
  String? allowedMaxServicemen;
  String? allowedMaxServicePackages;

  DefaultCreationLimits(
      {this.allowedMaxServices,
        this.allowedMaxAddresses,
        this.allowedMaxServicemen,
        this.allowedMaxServicePackages});

  DefaultCreationLimits.fromJson(Map<String, dynamic> json) {
    allowedMaxServices = json['allowed_max_services'];
    allowedMaxAddresses = json['allowed_max_addresses'];
    allowedMaxServicemen = json['allowed_max_servicemen'];
    allowedMaxServicePackages = json['allowed_max_service_packages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['allowed_max_services'] = allowedMaxServices;
    data['allowed_max_addresses'] = allowedMaxAddresses;
    data['allowed_max_servicemen'] = allowedMaxServicemen;
    data['allowed_max_service_packages'] = allowedMaxServicePackages;
    return data;
  }
}

class PaymentMethods {
  String? name,slug,image;
  bool? status;

  PaymentMethods({this.name, this.status,this.image,this.slug});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    status = (json['status'] == "0" ||  json['status'] =="1") ? json['status'] =="1"? true  : false: json['status'];
    image = json['image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['status'] = status;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}


class FirebaseCred {
  ServiceJson? serviceJson;
  String? googleMapApiKey;

  FirebaseCred({this.serviceJson, this.googleMapApiKey});

  FirebaseCred.fromJson(Map<String, dynamic> json) {
    serviceJson = json['service_json'] != null
        ? ServiceJson.fromJson(json['service_json'])
        : null;
    googleMapApiKey = json['google_map_api_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (serviceJson != null) {
      data['service_json'] = serviceJson!.toJson();
    }
    data['google_map_api_key'] = googleMapApiKey;
    return data;
  }
}

class ServiceJson {
  String? type;
  String? authUri;
  String? clientId;
  String? tokenUri;
  String? projectId;
  String? privateKey;
  String? clientEmail;
  String? privateKeyId;
  String? universeDomain;
  String? clientX509CertUrl;
  String? authProviderX509CertUrl;

  ServiceJson(
      {this.type,
        this.authUri,
        this.clientId,
        this.tokenUri,
        this.projectId,
        this.privateKey,
        this.clientEmail,
        this.privateKeyId,
        this.universeDomain,
        this.clientX509CertUrl,
        this.authProviderX509CertUrl});

  ServiceJson.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    authUri = json['auth_uri'];
    clientId = json['client_id'];
    tokenUri = json['token_uri'];
    projectId = json['project_id'];
    privateKey = json['private_key'];
    clientEmail = json['client_email'];
    privateKeyId = json['private_key_id'];
    universeDomain = json['universe_domain'];
    clientX509CertUrl = json['client_x509_cert_url'];
    authProviderX509CertUrl = json['auth_provider_x509_cert_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['auth_uri'] = authUri;
    data['client_id'] = clientId;
    data['token_uri'] = tokenUri;
    data['project_id'] = projectId;
    data['private_key'] = privateKey;
    data['client_email'] = clientEmail;
    data['private_key_id'] = privateKeyId;
    data['universe_domain'] = universeDomain;
    data['client_x509_cert_url'] = clientX509CertUrl;
    data['auth_provider_x509_cert_url'] = authProviderX509CertUrl;
    return data;
  }
}
