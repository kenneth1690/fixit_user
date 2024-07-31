import 'dart:developer';

import 'package:fixit_user/config.dart';
import 'package:intl/intl.dart';

class AppArray {
  var onBoardingList = [
    {
      "title": appFonts.welcomeToJust,
      "subtext": appFonts.simplyTouch,
    },
    {
      "title": appFonts.findYour,
      "subtext": appFonts.selectServiceFrom,
    },
    {
      "title": appFonts.bookYourDate,
      "subtext": appFonts.chooseAnAppropriate,
    },
    {
      "title": appFonts.goOnPayment,
      "subtext": appFonts.pickYourPayment,
    },
  ];


  var chatHistoryOptionList = [appFonts.refresh, appFonts.clearChat];

  var localList = <Locale>[
    const Locale('en'),
    const Locale('ar'),
    const Locale('fr'),
    const Locale('es'),
  ];

// language list
  var languageList = [
    {
      "title": appFonts.english,
      "locale": const Locale('en', 'EN'),
      "icon": eImageAssets.en,
      "code": "en"
    },
    {
      "title": appFonts.arabic,
      "locale": const Locale("ar", 'AE'),
      "icon": eImageAssets.ar,
      "code": "ar"
    },
    {
      "title": appFonts.french,
      "locale": const Locale('fr', 'FR'),
      "icon": eImageAssets.fr,
      "code": "fr"
    },
    {
      "title": appFonts.spanish,
      "locale": const Locale("es", 'ES'),
      "icon": eImageAssets.es,
      "code": "es"
    },
  ];


  var dashboardList = [
    {
      "title": appFonts.home,
      "icon": eSvgAssets.homeOut,
      "icon2": eSvgAssets.homeFill
    },
    {
      "title": appFonts.booking,
      "icon": eSvgAssets.bookingOut,
      "icon2": eSvgAssets.bookingFill
    },
    {
      "title": appFonts.offer,
      "icon": eSvgAssets.offerOut,
      "icon2": eSvgAssets.offerFill
    },
    {
      "title": appFonts.profile,
      "icon": eSvgAssets.profileOut,
      "icon2": eSvgAssets.profileFill
    },
  ];

  var bannerList = [eImageAssets.banner1, eImageAssets.banner2];

  var categoriesList = [
    {"title": appFonts.acRepair, "icon": eSvgAssets.ac},
    {"title": appFonts.cleaning, "icon": eSvgAssets.cleaning},
    {"title": appFonts.carpenter, "icon": eSvgAssets.carpenter},
    {"title": appFonts.cooking, "icon": eSvgAssets.cooking},
    {"title": appFonts.electrician, "icon": eSvgAssets.electrician},
    {"title": appFonts.painter, "icon": eSvgAssets.painter},
    {"title": appFonts.plumber, "icon": eSvgAssets.plumber},
    {"title": appFonts.salon, "icon": eSvgAssets.salon}
  ];

  var servicesList = [
    {
      "title": appFonts.cleaningPackage,
      "icon": eImageAssets.cleaning,
      "price": "\$20.05",
      "color": const Color(0XFFFD4868)
    },
    {
      "title": appFonts.paintingPackage,
      "icon": eImageAssets.paint,
      "price": "\$15.52",
      "color": const Color(0XFF48BFFD)
    },
    {
      "title": appFonts.cookingPackage,
      "icon": eImageAssets.fire,
      "price": "\$15.52",
      "color": const Color(0XFF808CFF)
    },
    {
      "title": appFonts.acRepair,
      "icon": eImageAssets.ac,
      "price": "\$15.52",
      "color": const Color(0XFFFF7456)
    },
    {
      "title": appFonts.salonPackage,
      "icon": eImageAssets.salon,
      "price": "\$15.52",
      "color": const Color(0XFFB75CFF)
    },
    {
      "title": appFonts.plumberPackage,
      "icon": eImageAssets.plumber,
      "price": "\$15.52",
      "color": const Color(0XFF17D792)
    },
    {
      "title": appFonts.electricianPackage,
      "icon": eImageAssets.electrician,
      "price": "\$15.52",
      "color": const Color(0XFF487AFD)
    },
    {
      "title": appFonts.carpenterPackage,
      "icon": eImageAssets.carpenter,
      "price": "\$15.52",
      "color": Color(0XFFFDB448)
    },
  ];

  var featuredList = [
    {
      "profile": eImageAssets.fsProfile1,
      "name": appFonts.arleneMcCoy,
      "rating": "3.0",
      "discount": "10%",
      "image": eImageAssets.fs1,
      "work": appFonts.cleaningBathroom,
      "offerPrice": "\$40.56",
      "price": "\$30",
      "time": appFonts.min30,
      "description": appFonts.foamJet,
      "serviceman": "Min 2 servicemen required"
    },
    {
      "profile": eImageAssets.fsProfile2,
      "name": appFonts.darleneRobertson,
      "rating": "3.0",
      "discount": "",
      "image": eImageAssets.fs2,
      "work": appFonts.furnishing,
      "offerPrice": "\$15.23",
      "price": "\$15.23",
      "time": appFonts.min30,
      "description": appFonts.foamJet,
      "serviceman": "Min 1 servicemen required"
    }
  ];

  var expertServicesList = [
    {
      "name": appFonts.leslie,
      "rating": "4.0",
      "image": eImageAssets.es1,
      "location": appFonts.santaAna,
      "status": "online",
      "subtext": appFonts.paintingService
    },
    {
      "name": appFonts.estherHoward,
      "rating": "4.0",
      "image": eImageAssets.es2,
      "location": appFonts.allentown,
      "status": "offline",
      "subtext": appFonts.paintingCleaning
    },
    {
      "name": appFonts.guyHawkins,
      "rating": "3.0",
      "image": eImageAssets.es3,
      "location": appFonts.mesaNew,
      "status": "online",
      "subtext": appFonts.salonService
    },
  ];

  var latestBlogList = [
    {
      "name": appFonts.switchboard,
      "image": eImageAssets.lb1,
      "subtext": appFonts.woodenPartition,
      "date": appFonts.feb25,
      "message": "23",
      "by": appFonts.byAdmin
    },
    {
      "name": appFonts.manTrimming,
      "image": eImageAssets.lb2,
      "subtext": appFonts.woodenPartition,
      "date": appFonts.feb25,
      "message": "30",
      "by": appFonts.byAdmin
    },
    {
      "name": appFonts.bringJoy,
      "image": eImageAssets.lb3,
      "subtext": appFonts.mar30,
      "date": appFonts.feb25,
      "message": "10",
      "by": appFonts.byAdmin
    },
  ];

  var profileList = [
    {
      "title": appFonts.general,
      "data": [
        {
          "icon": eSvgAssets.like,
          "title": appFonts.favouriteList,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.locationOut1,
          "title": appFonts.manageLocations,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.coupon,
          "title": appFonts.myReviews,
          "isArrow": true
        },
        {
          "icon": eSvgAssets.chat,
          "title": appFonts.chatHistory,
          "isArrow": true
        }
      ]
    },
    {
      "title": appFonts.aboutApp,
      "data": [
        {
          "icon": eSvgAssets.mobile,
          "title": appFonts.appDetails,
          "description": appFonts.aboutUs,
          "isArrow": true
        },
        {"icon": eSvgAssets.rate, "title": appFonts.rateUs, "isArrow": false},
        {
          "icon": eSvgAssets.share,
          "title": appFonts.shareApp,
          "isArrow": false
        },
      ]
    },
    {
      "title": appFonts.becomeProvider,
    },
    {
      "title": appFonts.alertZone,
      "data": [
        {
          "icon": eSvgAssets.delete,
          "title": appFonts.deleteAccount,
          "isArrow": false
        },
        {"icon": eSvgAssets.logout, "title": appFonts.logOut, "isArrow": false}
      ]
    },
  ];


  var guestProfileList = [

    {
      "title": appFonts.aboutApp,
      "data": [
        {
          "icon": eSvgAssets.mobile,
          "title": appFonts.appDetails,
          "description": appFonts.aboutUs,
          "isArrow": true
        },
        {"icon": eSvgAssets.rate, "title": appFonts.rateUs, "isArrow": false},
        {
          "icon": eSvgAssets.share,
          "title": appFonts.shareApp,
          "isArrow": false
        },
      ]
    },
    {
      "title": appFonts.becomeProvider,
    }
   
  ];

  //app setting
  List appSetting(isTheme) => [
        {
          'title': isTheme ? appFonts.lightTheme : appFonts.darkTheme,
          'icon': eSvgAssets.dark
        },
        {'title': appFonts.changeCurrency, 'icon': eSvgAssets.currency},
        {'title': appFonts.changeLanguage, 'icon': eSvgAssets.translate},
        {'title': appFonts.changePassword, 'icon': eSvgAssets.lock}
      ];

//currency
  var currencyList = [
    {
      'title': appFonts.usDollar,
      'icon': eSvgAssets.usCurrency,
      "code": "USD",
      "symbol": "\$",
      'USD': 1,
      'INR': 83.24,
      'POU': 0.83,
      'EUR': 0.96,
    },
    {
      'title': appFonts.euro,
      'icon': eSvgAssets.euroCurrency,
      "code": "EUR",
      "symbol": '€',
      'USD': 1.05,
      'INR': 87.10,
      'POU': 0.87,
      'EUR': 1,
    },
    {
      'title': appFonts.inr,
      'icon': eSvgAssets.inCurrency,
      "code": "INR",
      "symbol": '₹',
      'USD': 0.012,
      'INR': 1,
      'POU': 0.010,
      'EUR': 0.011,
    },
    {
      'title': appFonts.pound,
      'icon': eSvgAssets.ukCurrency,
      "code": "POU",
      "symbol": "£",
      'USD': 1.22,
      'INR': 101.74,
      'POU': 1,
      'EUR': 1.15,
    }
  ];

  var homeCouponList = [
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
    {
      "title": appFonts.bankOfAmerica,
      "code": appFonts.code,
      "off": appFonts.off30
    },
  ];

  var historyList = [
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "30.50",
      "status": appFonts.credit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "33.50",
      "status": appFonts.debit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "10.50",
      "status": appFonts.debit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "38.50",
      "status": appFonts.credit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "50.50",
      "status": appFonts.debit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "20.50",
      "status": appFonts.debit
    },
    {
      "title": appFonts.paintingCancelled,
      "date": appFonts.aug14,
      "price": "19.50",
      "status": appFonts.credit
    },
  ];

  var favouriteTabList = [appFonts.provider, appFonts.service];

  var favouriteProviderList = [
    {
      "title": appFonts.leslie,
      "image": eImageAssets.es1,
      "subtext": appFonts.paintingCleaning,
      "rate": "3.0"
    },
    {
      "title": appFonts.estherHoward,
      "image": eImageAssets.es2,
      "subtext": appFonts.paintingService,
      "rate": "4.6"
    },
    {
      "title": appFonts.guyHawkins,
      "image": eImageAssets.es3,
      "subtext": appFonts.salonService,
      "rate": "2.8"
    },
    {
      "title": appFonts.leslie,
      "image": eImageAssets.es1,
      "subtext": appFonts.paintingCleaning,
      "rate": "2.8"
    },
    {
      "title": appFonts.guyHawkins,
      "image": eImageAssets.es3,
      "subtext": appFonts.salonService,
      "rate": "2.8"
    },
  ];

  var favouriteServicesList = [
    {
      "title": "Ac water drop solution",
      "image": eImageAssets.fsl1,
      "subtext": "Ac repair",
      "price": "30.56"
    },
    {
      "title": "Feather hair cutting",
      "image": eImageAssets.fsl2,
      "subtext": "Salon",
      "price": "15"
    },
    {
      "title": "Furniture & carpenter",
      "image": eImageAssets.fsl3,
      "subtext": "Carpenter",
      "price": "25"
    },
    {
      "title": "Wall painting",
      "image": eImageAssets.fsl4,
      "subtext": "Painter",
      "price": "58.23"
    },
    {
      "title": "Marriage cooking",
      "image": eImageAssets.fsl5,
      "subtext": "Cooking",
      "price": "41.25"
    },
    {
      "title": "Light fitting & repair",
      "image": eImageAssets.fsl6,
      "subtext": "Electrician",
      "price": "10.26"
    },
  ];

  var myLocationList = [
    {
      "icon": eSvgAssets.homeFill,
      "name": "Kristin Watson",
      "number": "(406) 555-0120",
      "place": "Home",
      "address": "3891 Ranchview Dr. Richardson,",
      "set": "Set as a primary location",
      "zipCode": "62639",
      "is_primary": "1",
      "type": "home",
      "city": "Wembley",
      "country_id": 2,
      "state_id": 3,
      "country": {"id": 4, "name": "Afghanistan"},
      "state": {"id": 42, "name": "Badakhshan"}
    },
    {
      "icon": eSvgAssets.beg,
      "name": "Floyd Miles",
      "number": "(684) 555-0102",
      "place": "Work",
      "address": "2118 Thornridge Cir. Syracuse,",
      "set": "Not set as a primary location",
      "zipCode": "62639",
      "city": "Wembley",
      "is_primary": "0",
      "type": "Work",
      "country_id": 1,
      "state_id": 4,
      "country": {"id": 4, "name": "Afghanistan"},
      "state": {"id": 42, "name": "Badakhshan"}
    },
  ];

  var reviewList = [
    {
      "image": eImageAssets.profile,
      "name": "Kurt Bates",
      "service": "Cleaning service",
      "rate": "4.0",
      "review":
          "“I just love their service & the staff nature for work, I’d like to hire them again”",
      "time": "12 min ago",
    },
    {
      "image": eImageAssets.profile,
      "name": "Jane Cooper",
      "service": "Painting service",
      "rate": "4.0",
      "review":
          "This provider has the best staff who assist us until the service is complete. Thank you!",
      "time": "15 days ago",
    },
    {
      "image": eImageAssets.profile,
      "name": "Lorri Warf",
      "service": "Ac cleaning",
      "rate": "4.0",
      "review": "“I love their work with ease, Thank you !”",
      "time": "28 days ago",
    },
  ];

  var editReviewList = [
    {"icon": eSvgAssets.bad, "title": appFonts.bad,"gif":eGifAssets.bad},
    {"icon": eSvgAssets.okay, "title": appFonts.okay,"gif":eGifAssets.okay},
    {"icon": eSvgAssets.good, "title": appFonts.good,"gif":eGifAssets.good},
    {"icon": eSvgAssets.amazing, "title": appFonts.amazing,"gif":eGifAssets.amazing},
    {"icon": eSvgAssets.excellent, "title": appFonts.excellent,"gif":eGifAssets.excellent},
  ];

  var appDetailsList = [
   /* {
      "title": appFonts.aboutUs,
      "icon": eSvgAssets.about,
    },
    {
      "title": appFonts.privacyPolicy,
      "icon": eSvgAssets.privacy,
    },
    {
      "title": appFonts.cancellationPolicy,
      "icon": eSvgAssets.cancellation,
    },
    {
      "title": appFonts.refundPolicy,
      "icon": eSvgAssets.refund,
    },
    {
      "title": appFonts.helpSupport,
      "icon": eSvgAssets.help,
    },*/
  ];

  var selectErrorList = [
    "Purchase error",
    "Technical error",
    "App error",
    "Feedback"
  ];

  var notificationList = [
    {
      "icon": eSvgAssets.clock,
      "title": "Reminder !",
      "time": "1 min",
      "message": "You have booked plumber service today at 6:30pm.",
      "isRead": false
    },
    {
      "icon": eSvgAssets.about,
      "title": "Service start",
      "time": "2 min",
      "message": "Jane cooper has started service of cleaning.",
      "isRead": false
    },
    {
      "icon": eSvgAssets.receipt,
      "title": "Add new image",
      "time": "2 min",
      "message": "Add a new carpenter & furnishing category service picture.",
      "image": eImageAssets.notiImage,
      "isRead": true
    },
    {
      "icon": eSvgAssets.purse,
      "title": "Payment update",
      "time": "2 min",
      "message": "Your payment is done of cleaning service.",
      "isRead": true
    },
    {
      "icon": eSvgAssets.receipt,
      "title": "Update status",
      "time": "2 min",
      "message": "Booking status has been changed from pending to accepted.",
      "isRead": true
    },
    {
      "icon": eSvgAssets.clock,
      "title": "Reminder !",
      "time": "1 min",
      "message": "You have booked plumber service today at 6:30pm.",
      "isRead": true
    },
  ];

  List countryList = [
    {"id": 1, "title": "India"},
    {"id": 2, "title": "Pakistan"},
    {"id": 3, "title": "Afghanistan"},
    {"id": 4, "title": "Shri lanka"},
    {"id": 5, "title": "Australia"},
    {"id": 6, "title": "England"},
    {"id": 7, "title": "South africa"},
  ];

  List stateList = [
    {"id": 1, "title": "Maharashtra"},
    {"id": 2, "title": "Gujarat"},
    {"id": 3, "title": "Delhi"},
    {"id": 4, "title": "Rajasthan"},
    {"id": 5, "title": "Madhya Pradesh"},
    {"id": 6, "title": "Punjab"},
  ];

  List categoryList = [
    {
      "icon": eSvgAssets.cleaning,
      "isCheck": false,
      "title": appFonts.cleaning,
    },
    {
      "icon": eSvgAssets.ac,
      "isCheck": false,
      "title": appFonts.acRepair,
    },
    {
      "icon": eSvgAssets.carpenter,
      "isCheck": false,
      "title": appFonts.carpenter,
    },
    {
      "icon": eSvgAssets.cooking,
      "isCheck": false,
      "title": appFonts.cooking,
    },
    {
      "icon": eSvgAssets.electrician,
      "isCheck": false,
      "title": appFonts.electrician,
    },
    {
      "icon": eSvgAssets.painter,
      "isCheck": false,
      "title": appFonts.painter,
    },
    {
      "icon": eSvgAssets.plumber,
      "isCheck": false,
      "title": appFonts.plumber,
    },
  ];

  var ratingList = [
    {"rate": "5", "icon": eSvgAssets.star5, "value": 5},
    {"rate": "4", "icon": eSvgAssets.star4, "value": 4},
    {"rate": "3", "icon": eSvgAssets.star3, "value": 3},
    {"rate": "2", "icon": eSvgAssets.star2, "value": 2},
    {"rate": "1", "icon": eSvgAssets.star1, "value": 1},
  ];

  var subCategoriesList = [
    {"icon": eSvgAssets.fan, "title": appFonts.acRepair},
    {"icon": eSvgAssets.installation, "title": appFonts.installation},
    {"icon": eSvgAssets.ac, "title": appFonts.hanging},
    {"icon": eSvgAssets.servicing, "title": appFonts.servicing},
    {"icon": eSvgAssets.painter, "title": appFonts.painter},
  ];

  var filterList = [
    appFonts.category,
    appFonts.priceRating,
    appFonts.distance,
  ];

  var filterList1 = [
    appFonts.provider,
    appFonts.priceRating,
    appFonts.distance,
  ];

  List experienceList = [
    {
      "id": 0,
      "title": appFonts.highestExperience,
    },
    {"id": 1, "title": appFonts.lowestExperience},
    {"id": 2, "title": appFonts.highestServed},
    {"id": 3, "title": appFonts.lowestServed},
  ];

  List providerExpList = [
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
    {
      "image": eImageAssets.fsProfile2,
      "title": "Templeton Peck",
      "experience": "2 years of experience",
      "services": "10",
      "isCheck": false,
    },
  ];

  var servicesImageList = [
    eImageAssets.servicesImage,
    eImageAssets.s1,
    eImageAssets.s2
  ];

  var reviewRating = [
    {
      "star": appFonts.star5,
      "percentage": "84",
    },
    {
      "star": appFonts.star4,
      "percentage": "9",
    },
    {
      "star": appFonts.star3,
      "percentage": "4",
    },
    {
      "star": appFonts.star2,
      "percentage": "2",
    },
    {
      "star": appFonts.star1,
      "percentage": "1",
    },
  ];

  List reviewLowHighList = [
    {"id": 0, "title": appFonts.lowestRate},
    {"id": 1, "title": appFonts.highestRate},
  ];

  var languagesList = [appFonts.english, appFonts.spanish, appFonts.chines];

  var servicemanChooseList = [
    appFonts.letAppChoose,
    appFonts.selectServicemenAs
  ];

  var selectList = [
    {"image": eSvgAssets.gallery, "title": appFonts.chooseFromGallery},
    {"image": eSvgAssets.camera, "title": appFonts.openCamera}
  ];

  var selectRepaymentOrCancel = [
    {"title": appFonts.cancelBooking},
    {"title": appFonts.cashOnDelivery},
    {"title": appFonts.selectAnotherPayment}
  ];

  List monthList = [
    {"title": "January", "index": 1},
    {"title": "February", "index": 2},
    {"title": "March", "index": 3},
    {"title": "April", "index": 4},
    {"title": "May", "index": 5},
    {"title": "June", "index": 6},
    {"title": "July", "index": 7},
    {"title": "August", "index": 8},
    {"title": "September", "index": 9},
    {"title": "October", "index": 10},
    {"title": "November", "index": 11},
    {"title": "December", "index": 12}
  ];

  List<String> hourList = List.generate(12, (index) {
    DateTime time = DateTime.now().add(Duration(hours: index));
    String formattedTime = DateFormat.H().format(time);
    log("formattedTime :$formattedTime");
    return formattedTime;
  });

  List<String> minList = List.generate(60, (index) {
    DateTime time = DateTime.now().add(Duration(minutes: index));
    String formattedTime = DateFormat('mm').format(time);
    log("$time:::::::$formattedTime");
    return formattedTime;
  });

  List<String> dayList = List.generate(2, (index) {
    DateTime time = DateTime.now().add(Duration(days: index));
    String formattedTime = DateFormat('a').format(time);
    log("$time:::::::$formattedTime");
    return formattedTime;
  });

  var amPmList = ["AM", "PM"];

  var timeSlotsList = [
    "1:00",
    "2:30",
    "2:50",
    "3:00",
    "4:15",
    "4:30",
    "4:55",
    "5:15",
    "5:20",
    "5:35",
    "6:25",
    "7:15",
    "7:30",
  ];

  var cartList = [
    {
      "isPackage": false,
      "image": eImageAssets.es1,
      "name": "Kurt Bates",
      "price": "22.00",
      "rating": "3.0",
      "service": "Ac cleaning service",
      "discount": "10% off",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "servicemanList": []
    },
    {
      "isPackage": false,
      "image": eImageAssets.es3,
      "name": "Darlene Rubbi",
      "price": "15.23",
      "rating": "4.0",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "service": "Furnishing & carpentry",
      "discount": "10% off",
      "servicemanList": [
        {"image": eImageAssets.es2, "name": "Stella Milevski", "rating": "3.0"}
      ]
    },
    {
      "isPackage": true,
      "image": eImageAssets.es3,
      "name": "Kurt Bates",
      "price": "15.23",
      "rating": "4.0",
      "service": "Cleaning package",
      "servicemanList": [
        {"image": eImageAssets.es1, "name": "Templeton Peck", "rating": "3.0"},
        {"image": eImageAssets.es2, "name": "Lynn Tanner", "rating": "3.5"}
      ]
    },
  ];

  var couponList = [
    {
      "title": "MasterCard",
      "code": "#A125",
      "percentage": "30%",
      "validity": "16th Apr, 2023"
    },
    {
      "title": "Visa",
      "code": "#A126",
      "percentage": "20%",
      "validity": "13th Aug, 2023"
    },
    {
      "title": "ICICI",
      "code": "#A127",
      "percentage": "40%",
      "validity": "19th Oct, 2023"
    },
    {
      "title": "HDFC",
      "code": "#A128",
      "percentage": "30%",
      "validity": "13th Aug, 2023"
    },
    {
      "title": "Axis",
      "code": "#A129",
      "percentage": "10%",
      "validity": "12th Sep, 2023"
    },
  ];

  var paymentMethodList = [
    {
      "image": eSvgAssets.wallet,
      "title": appFonts.wallet,
      "value": appFonts.wallet
    },
    {
      "image": eSvgAssets.wallet,
      "title": appFonts.paypal,
      "value": appFonts.paypal
    },
    {
      "image": eSvgAssets.razorpay,
      "title": appFonts.razorPay,
      "value": appFonts.wallet
    },
    {
      "image": eSvgAssets.stripe,
      "title": appFonts.stripe,
      "value": appFonts.wallet
    },
    {
      "image": eSvgAssets.visa,
      "title": appFonts.mastercardVisa,
      "value": appFonts.wallet
    },
    {
      "image": eSvgAssets.cash,
      "title": appFonts.payOnHold,
      "value": appFonts.onHand
    },
  ];

  var paymentGatewayList = [
    {"id": 0, "title": appFonts.razorPay, 'icon': eSvgAssets.razorpay},
    {"id": 1, "title": appFonts.stripe, 'icon': eSvgAssets.stripe}
  ];

  var servicemanList = [
    {
      "title": appFonts.leslie,
      "image": eImageAssets.es1,
      "exp": "3",
      "rate": "3.0",
      "isCheck": false
    },
    {
      "title": appFonts.estherHoward,
      "image": eImageAssets.es2,
      "exp": "3",
      "rate": "4.6",
      "isCheck": false
    },
    {
      "title": appFonts.guyHawkins,
      "image": eImageAssets.es3,
      "exp": "3",
      "rate": "2.8",
      "isCheck": false
    },
    {
      "title": appFonts.leslie,
      "image": eImageAssets.es1,
      "exp": "3",
      "rate": "2.8",
      "isCheck": false
    },
    {
      "title": appFonts.guyHawkins,
      "image": eImageAssets.es3,
      "exp": "3",
      "rate": "2.8",
      "isCheck": false
    },
  ];

  var jobExperienceList = [
    {
      "id": 0,
      "title": appFonts.highestExperience,
    },
    {"id": 1, "title": appFonts.lowestExperience},
  ];

  var expertiseList = [
    appFonts.acRepair,
    appFonts.carpenter,
    appFonts.cleaning,
  ];

  List includedServiceList = [
    {
      "title": "Ac cleaning service",
      "image": eImageAssets.es1,
      "price": "12.14",
      "rate": "3.0",
      "time": "30 mins",
      "servicemanRequired": "1",
      "desc": "Foam jet technology removes dust 2x deeper."
    },
    {
      "title": "Bathroom cleaning",
      "image": eImageAssets.es2,
      "price": "30.25",
      "rate": "4.0",
      "time": "30 mins",
      "servicemanRequired": "2",
      "desc": "Get the best and most durable wooden furniture.",
    },
  ];

  var servicePackageList = [
    {
      "title": "Ac cleaning service",
      "image": eImageAssets.es2,
      "rate": "4.0",
      "time": "30 mins",
      "serviceTime": "6:00 PM",
      "date": "6 Sep, 2023",
      "requiredServicemen": [
        {
          "image": eImageAssets.es1,
          "title": "Stella Milevski",
          "rate": "3.5",
        }
      ]
    },
    {
      "title": "Ac cleaning service",
      "image": eImageAssets.es2,
      "serviceTime": "6:00 PM",
      "date": "6 Sep, 2023",
      "rate": "4.0",
      "requiredServicemen": []
    },
  ];

  var bookingList = [
    {
      "bookingNumber": "#58961",
      "image": eImageAssets.lb1,
      "isPackage": true,
      "isExpand": false,
      "name": "Curtain cleaning",
      "price": "25.23",
      "offer": "10% off",
      "status": appFonts.pending,
      "dateTime": "6 Sep, 2023 - 6:00 pm",
      "payment": "Not paid yet",
      "location": "California - USA",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Arlene McCoy",
          "rate": "3.5",
        }
      ],
      "servicemanLists": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kate Tanner",
          "rate": "4.0",
        }
      ]
    },
    {
      "bookingNumber": "#25636",
      "image": eImageAssets.lb2,
      "isPackage": false,
      "isExpand": false,
      "name": "House hold cook",
      "price": "30.25",
      "offer": "10% off",
      "status": appFonts.accepted,
      "dateTime": "8 Aug, 2023 - 5:20 am",
      "payment": "Not paid yet",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
        }
      ],
      "servicemanLists": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kate Tanner",
          "rate": "4.0",
        }
      ]
    },
    {
      "bookingNumber": "#85962",
      "image": eImageAssets.lb3,
      "isPackage": false,
      "isExpand": false,
      "name": "Hair spa & color",
      "price": "15.23",
      "offer": "15% off",
      "status": appFonts.ongoing,
      "dateTime": "10 Aug, 2023 - 2:05 pm",
      "payment": "Not paid yet",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
        }
      ],
      "servicemanLists": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Nolan Westervelt",
          "rate": "3.5",
        },
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es3,
          "title": "Kate Tanner",
          "rate": "3.5",
        },
      ]
    },
    {
      "bookingNumber": "#56236",
      "image": eImageAssets.es1,
      "isPackage": false,
      "isExpand": false,
      "name": "Furnishing & carpentry",
      "price": "40.26",
      "offer": "12% off",
      "status": appFonts.completed,
      "dateTime": "15 Aug, 2023 - 10:55 am",
      "payment": "Paid in advance",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
        }
      ],
      "servicemanLists": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Nolan Westervelt",
          "rate": "3.5",
        },
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es3,
          "title": "Kate Tanner",
          "rate": "3.5",
        },
      ]
    },
    {
      "bookingNumber": "#15263",
      "image": eImageAssets.lb1,
      "isPackage": false,
      "isExpand": false,
      "name": "Chimney sweeping",
      "price": "21.78",
      "status": appFonts.cancelled,
      "dateTime": "20 Aug, 2023 - 4:25pm",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
        }
      ],
      "servicemanLists": []
    },
  ];

  var bookingFilterList = [
    appFonts.status,
    appFonts.date,
    appFonts.category,
  ];

  var bookingStatusList = [
    appFonts.allBooking,
    appFonts.bookingStatus,
    appFonts.pendingBooking,
    appFonts.acceptedBooking,
    appFonts.ongoingBooking,
    appFonts.completedBooking,
    appFonts.cancelledBooking,
  ];

  var bookingStatus = [
    {
      "status": "s",
      "time": "2:30 am",
      "date": "Today",
      "title": "Changes in schedule",
      "subtext": "You have change time for service."
    },
    {
      "status": "s",
      "time": "2:30 am",
      "date": "Today",
      "title": "Changes in schedule",
      "subtext": "You have change time for service."
    },
    {
      "status": appFonts.ongoing,
      "time": "2:30 am",
      "date": "Today",
      "title": "Changes in schedule",
      "subtext": "You have change time for service."
    },
    {
      "status": appFonts.accepted,
      "time": "2:30 am",
      "date": "Today",
      "title": "Changes in schedule",
      "subtext": "You have change time for service."
    },
    {
      "status": appFonts.pending,
      "time": "2:30 am",
      "date": "Today",
      "title": "Changes in schedule",
      "subtext": "You have change time for service."
    },
  ];

  var socialList = [
    {"image": eSvgAssets.phone1, "title": appFonts.call},
    {"image": eSvgAssets.chat, "title": appFonts.chat},
    {"image": eSvgAssets.wp, "title": appFonts.wp},
  ];

  //chat list
  var chatList = [
    {
      "type": "receiver",
      "message": "Hello ! How can i help you ?",
    },
    {
      "type": "source",
      "message": "Hello ! When will you arrive ?",
    },
    {
      "type": "receiver",
      "message": "I’ll be there soon.",
    },
    {
      "type": "source",
      "message": "Okay !! Thank you.",
    }
  ];

  var optionList = [
    appFonts.callNow,
    appFonts.clearChat,
  ];

  var pendingBookingDetailList = [
    {
      "image": eImageAssets.fsl1,
      "status": "Pending",
      "bookingId": "#85962",
      "title": "Hair spa & color",
      "rate": "3.5",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "location": "2118 Thorn ridge Cir. Syracuse, Connecticut - 35624, USA.",
      "description":
          "Our expert technicians will thoroughly clean and disinfect your air conditioning system, ensuring optimal performance.",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
          "email": "kurtbsted56@gmail.com",
          "phone": "+25 632 256 4562",
          "location":
              "3891 Ranch view Dr. Richardson, California - 62639, USA.",
        }
      ],
      "servicemanList": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
        }
      ],
    }
  ];

  var acceptBookingDetailList = [
    {
      "image": eImageAssets.fsl1,
      "bookingId": "#85962",
      "status": "Accepted",
      "title": "Hair spa & color",
      "rate": "3.5",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "location": "2118 Thorn ridge Cir. Syracuse, Connecticut - 35624, USA.",
      "description":
          "Our expert technicians will thoroughly clean and disinfect your air conditioning system, ensuring optimal performance.",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
          "email": "kurtbsted56@gmail.com",
          "phone": "+25 632 256 4562",
          "location":
              "3891 Ranch view Dr. Richardson, California - 62639, USA.",
        }
      ],
      "servicemanList": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
        }
      ],
    }
  ];

  var ongoingBookingDetailList = [
    {
      "image": eImageAssets.fsl1,
      "bookingId": "#85962",
      "status": "Ongoing",
      "title": "Hair spa & color",
      "rate": "3.5",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "location": "2118 Thorn ridge Cir. Syracuse, Connecticut - 35624, USA.",
      "description":
          "Our expert technicians will thoroughly clean and disinfect your air conditioning system, ensuring optimal performance.",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
          "email": "kurtbsted56@gmail.com",
          "phone": "+25 632 256 4562",
          "location":
              "3891 Ranch view Dr. Richardson, California - 62639, USA.",
        }
      ],
      "servicemanList": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
        }
      ],
    }
  ];

  var completedBookingDetailList = [
    {
      "image": eImageAssets.fsl1,
      "bookingId": "#85962",
      "status": "Completed",
      "title": "Hair spa & color",
      "rate": "3.5",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "location": "2118 Thorn ridge Cir. Syracuse, Connecticut - 35624, USA.",
      "description":
          "Our expert technicians will thoroughly clean and disinfect your air conditioning system, ensuring optimal performance.",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
          "email": "kurtbsted56@gmail.com",
          "phone": "+25 632 256 4562",
          "location":
              "3891 Ranch view Dr. Richardson, California - 62639, USA.",
        }
      ],
      "servicemanList": [
        {
          "role": appFonts.serviceman,
          "image": eImageAssets.es2,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
        }
      ],
    }
  ];

  var cancelledBookingDetailList = [
    {
      "image": eImageAssets.fsl1,
      "bookingId": "#85962",
      "status": "Cancelled",
      "title": "Hair spa & color",
      "rate": "3.5",
      "date": "6 Sep, 2023",
      "time": "6:00 PM",
      "location": "2118 Thorn ridge Cir. Syracuse, Connecticut - 35624, USA.",
      "description":
          "Our expert technicians will thoroughly clean and disinfect your air conditioning system, ensuring optimal performance.",
      "providerList": [
        {
          "role": appFonts.provider,
          "image": eImageAssets.es1,
          "title": "Kierra Lubin",
          "rate": "3.0",
          "experience": "3",
          "email": "kurtbsted56@gmail.com",
          "phone": "+25 632 256 4562",
          "location":
              "3891 Ranch view Dr. Richardson, California - 62639, USA.",
        }
      ],
      "servicemanList": [],
    }
  ];

  var packageBookingList = [
    {
      "title": "Cleaning service package",
      "price": "32.08",
      "Description":
          "As a service member, I believe I am capable of problem solving. I too face a variety of obstacles at work and must develop effective solutions to ensure client satisfaction.",
      "pImage": eImageAssets.es1,
      "pName": "Kurt Bates",
      "rate": "3.0",
      "includedService": [
        {
          "image": eImageAssets.fs2,
          "title": "House hold cook",
          "price": "15.23",
          "bookingId": "#15263",
          "status": appFonts.accepted,
          "serviceman": "2"
        },
        {
          "image": eImageAssets.es1,
          "title": "Hair spa",
          "price": "10.15",
          "bookingId": "#15264",
          "status": appFonts.ongoing,
          "serviceman": "0"
        },
      ]
    }
  ];
  List themeModeList = [
    appFonts.darkTheme,
    appFonts.lightTheme,
    appFonts.systemDefault
  ];
}
