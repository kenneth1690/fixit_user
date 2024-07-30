
export 'package:cached_network_image/cached_network_image.dart';

import 'package:fixit_user/common/app_array.dart';
import 'package:fixit_user/common/session.dart';
import 'package:fixit_user/common/theme/app_theme.dart';

import 'package:fixit_user/helper/navigation_class.dart';
import 'package:fixit_user/models/app_setting_model.dart';
import 'package:fixit_user/services/api_methods.dart';
import 'package:fixit_user/services/api_service.dart';
import 'package:fixit_user/utils/fonts.dart';
import 'common/app_fonts.dart';
import 'config.dart';
export 'package:fixit_user/packages_list.dart';
export 'package:flutter/material.dart';
export '../common/theme/app_css.dart';
export 'package:fixit_user/common/extension/text_style_extensions.dart';
export 'package:fixit_user/common/extension/widget_extension.dart';

export 'package:fixit_user/common_shimmer/shimmer_list.dart';

export 'package:fixit_user/routes/screen_list.dart';
export '../common/extension/spacing.dart';
export 'package:fixit_user/common/assets/index.dart';
export '../routes/index.dart';
export '../widgets/small_container.dart';
export '../widgets/text_field_common.dart';
export '../widgets/button_common.dart';
export '../widgets/common_arrow.dart';
export '../widgets/dot_indicator.dart';
export '../providers/index.dart';
export '../widgets/fields_background.dart';
export '../widgets/country_picker_custom/country_code_custom.dart';
export '../widgets/common_state.dart';
export '../helper/validation.dart';
export '../widgets/loading_component.dart';
export '../widgets/container_with_text_layout.dart';
export '../widgets/auth_top_layouts.dart';
export '../widgets/heading_row_common.dart';
export '../widgets/dotted_line.dart';
export '../utils/extensions.dart';
export '../widgets/status_layout.dart';
export 'models/index.dart';

export '../widgets/custom_painters.dart';
export '../common/languages/language_change.dart';
export '../common/theme/theme_service.dart';
export '../widgets/profile_pic_common.dart';
export '../widgets/add_button_common.dart';
export '../widgets/edit_review_layout.dart';
export '../models/profile_model.dart';
export '../widgets/alert_dialog_common.dart';
export '../widgets/search_text_filed_common.dart';

export '../widgets/empty_layout.dart';
export '../widgets/app_bar_common.dart';
export '../widgets/common_radio.dart';
export '../widgets/checkbox_common.dart';
export '../widgets/bottom_sheet_buttons_common.dart';
export '../widgets/filter_icon_common.dart';
export '../widgets/services_delivered_layout.dart';
export '../widgets/bottom_sheet_top_layout.dart';
export '../widgets/custom_message_layout.dart';
export '../widgets/location_change_row_common.dart';
export '../widgets/bill_summary_layout.dart';
export '../widgets/booked_date_time_layout.dart';
export '../widgets/cancellation_policy_layout.dart';
export '../widgets/disclaimer_layout.dart';
export '../widgets/divider_common.dart';
export '../widgets/time_slot_layout.dart';
export '../widgets/common_empty.dart';
export '../models/select_service_package_model.dart';
export '../widgets/booking_status_layout.dart';
export '../models/booking_model.dart';
export '../utils/general_utils.dart';
export '../../widgets/contact_detail_row_common.dart';
export '../../widgets/social_button_common.dart';

export 'package:fixit_user/users_services.dart';
export '../widgets/status_detail_layout.dart';
export '../common/languages/app_language.dart';

Session session = Session();
AppFonts appFonts = AppFonts();
NavigationClass route = NavigationClass();
AppArray appArray = AppArray();
Validation validation = Validation();
AppCss appCss = AppCss();
ApiServices apiServices = ApiServices();
ApiMethods api = ApiMethods();
TextCommon textCommon = TextCommon();
CollectionName collectionName = CollectionName();

AppSettingModel? appSettingModel;
List<PaymentMethods> paymentMethods = [];

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

AppTheme appColor(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);
  return themeServices.appTheme;
}

CurrencyProvider currency(context) {
  final currencyData = Provider.of<CurrencyProvider>(context, listen: false);
  return currencyData;
}

getSymbol(context) {
  final currencyData =
      Provider.of<CurrencyProvider>(context, listen: false).priceSymbol;

  return currencyData;
}

showLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).showLoading();
}

hideLoading(context) async {
  Provider.of<LoadingProvider>(context, listen: false).hideLoading();
}

String language(context, text) {
  return AppLocalizations.of(context)!.translate(text);
}

bool rtl(context) {
  return AppLocalizations.of(context)?.locale.languageCode == "ar";
}

bool isDark(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);

  return themeServices.isDarkMode;
}

int themeIndex(context) {
  final themeServices = Provider.of<ThemeService>(context, listen: false);

  return themeServices.themeIndex;
}

bool isAlert =false;

Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class FadeInRoute extends PageRouteBuilder {
  final Widget page;
final dynamic arg;
  FadeInRoute({required this.page, required String routeName,this.arg})
      : super(
    settings: RouteSettings(name: routeName,arguments:arg ),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      print("Dfd");
      return page;
    },// set name here

    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    transitionDuration: Duration(milliseconds: 500),
  );
}
