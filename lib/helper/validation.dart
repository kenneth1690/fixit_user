import '../config.dart';

class Validation {
  RegExp digitRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  RegExp regex = RegExp("^([0-9]{4}|[0-9]{6})");
  RegExp passRegex = RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$");
  RegExp zipRegex = RegExp("^\d{5}(?:[-\s]\d{4})?\$");

  // Zip Code Validation
  zipCodeValidation(context,zipCode) {
    if (zipCode.isEmpty) {
      return language(context, appFonts.enterZip);
    }
    return null;
  }

// City validation
  cityValidation(context,name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseCity);
    }
    return null;
  }

  // address validation
  addressValidation(context,name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseAddress);
    }
    return null;
  }

  // Email Validation
  emailValidation(context,email) {
    if (email.isEmpty) {
      return language(context, appFonts.pleaseEnterEmail);
    } else if (!digitRegex.hasMatch(email)) {
      return language(context, appFonts.pleaseEnterValid);
    }
    return null;
  }

  // Password Validation
  passValidation(context,password) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }


    return null;
  }

//confirm Password Validation
  confirmPassValidation(context,password, pass) {
    if (password.isEmpty) {
      return language(context, appFonts.pleaseEnterPassword);
    }


    if (password != pass) {
      return language(context, appFonts.notMatch);
    }
    return null;
  }

  // name validation
  nameValidation(context,name) {
    if (name.isEmpty) {
      return language(context, appFonts.pleaseEnterName);
    }
    return null;
  }


  // phone validation
  phoneValidation(context,phone) {
    if (phone.isEmpty) {
      return language(context,appFonts.pleaseEnterNumber);
    }
    if(!regex.hasMatch(phone)) {
      return language(context, appFonts.pleaseEnterValidNumber);
    }

    return null;
  }

  // Otp Validation
  otpValidation (context,value) {
    if (value!.isEmpty) {
      return language(context, appFonts.enterOtp);
    }
    if (!regex.hasMatch(value)) {
      return language(context, appFonts.enterValidOtp);
    }
    return null;
  }

  // Common field validation
  commonValidation(context,value){
    if (value!.isEmpty) {
      return language(context, appFonts.pleaseEnterValue);
    }
  }

//focus node change
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
