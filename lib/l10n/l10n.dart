import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get chooseLanguage;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Serv5'**
  String get appName;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget Password ?'**
  String get forgetPassword;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhone;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid OTP'**
  String get invalidOtp;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get userName;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get appLanguage;

  /// No description provided for @pleaseChooseAppLanguage.
  ///
  /// In en, this message translates to:
  /// **'Please choose app language'**
  String get pleaseChooseAppLanguage;

  /// No description provided for @testAnotherPage.
  ///
  /// In en, this message translates to:
  /// **'Test Another Page'**
  String get testAnotherPage;

  /// No description provided for @navgationError.
  ///
  /// In en, this message translates to:
  /// **'Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments'**
  String get navgationError;

  /// No description provided for @connectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout with server'**
  String get connectionTimeout;

  /// No description provided for @receiveTimeout.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout with server'**
  String get receiveTimeout;

  /// No description provided for @sendTimeout.
  ///
  /// In en, this message translates to:
  /// **'Send timeout with server'**
  String get sendTimeout;

  /// No description provided for @requestCanceled.
  ///
  /// In en, this message translates to:
  /// **'Request to server was canceled'**
  String get requestCanceled;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @unexpectedError.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error, please try again'**
  String get unexpectedError;

  /// No description provided for @defaultError.
  ///
  /// In en, this message translates to:
  /// **'Oops! There was an error, please try again'**
  String get defaultError;

  /// No description provided for @requestNotFound.
  ///
  /// In en, this message translates to:
  /// **'Your request not found, please try later'**
  String get requestNotFound;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error, please try later'**
  String get internalServerError;

  /// No description provided for @badRequestError.
  ///
  /// In en, this message translates to:
  /// **'Bad request, please check your data'**
  String get badRequestError;

  /// No description provided for @choose_currency.
  ///
  /// In en, this message translates to:
  /// **'Choose Currency'**
  String get choose_currency;

  /// No description provided for @tripName.
  ///
  /// In en, this message translates to:
  /// **'Trip Name'**
  String get tripName;

  /// No description provided for @mecca.
  ///
  /// In en, this message translates to:
  /// **'Mecca'**
  String get mecca;

  /// No description provided for @saudiArabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get saudiArabia;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @personalData.
  ///
  /// In en, this message translates to:
  /// **'Personal Data'**
  String get personalData;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @bookingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Booking Successful'**
  String get bookingSuccess;

  /// No description provided for @bookingDescription.
  ///
  /// In en, this message translates to:
  /// **'The Umrah trip was booked successfully. We ask God to accept it from us and from all pilgrims.'**
  String get bookingDescription;

  /// No description provided for @chooseTrip.
  ///
  /// In en, this message translates to:
  /// **'Choose Trip'**
  String get chooseTrip;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @reserved.
  ///
  /// In en, this message translates to:
  /// **'Reserved'**
  String get reserved;

  /// No description provided for @chooseSeat.
  ///
  /// In en, this message translates to:
  /// **'Choose your seat on the bus'**
  String get chooseSeat;

  /// No description provided for @door.
  ///
  /// In en, this message translates to:
  /// **'Door'**
  String get door;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @seatReservationNumbers.
  ///
  /// In en, this message translates to:
  /// **'Seat Reservation Numbers'**
  String get seatReservationNumbers;

  /// No description provided for @kwd.
  ///
  /// In en, this message translates to:
  /// **'KWD'**
  String get kwd;

  /// No description provided for @paymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// No description provided for @tripDate.
  ///
  /// In en, this message translates to:
  /// **'Trip Date'**
  String get tripDate;

  /// No description provided for @tripTime.
  ///
  /// In en, this message translates to:
  /// **'Trip Time'**
  String get tripTime;

  /// No description provided for @currencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currencyLabel;

  /// No description provided for @subscriptionPrice.
  ///
  /// In en, this message translates to:
  /// **'Subscription Price'**
  String get subscriptionPrice;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get choosePaymentMethod;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery'**
  String get cashOnDelivery;

  /// No description provided for @knet.
  ///
  /// In en, this message translates to:
  /// **'K-NET'**
  String get knet;

  /// No description provided for @personal_info.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personal_info;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @field_required.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get field_required;

  /// No description provided for @trip_info.
  ///
  /// In en, this message translates to:
  /// **'Trip Information'**
  String get trip_info;

  /// No description provided for @invalid_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid Number'**
  String get invalid_number;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your login details'**
  String get loginSubtitle;

  /// No description provided for @noAccountYet.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet? '**
  String get noAccountYet;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @newAccount.
  ///
  /// In en, this message translates to:
  /// **'New Account'**
  String get newAccount;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your login details'**
  String get signUpSubtitle;

  /// No description provided for @surname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// No description provided for @iReadAndAccept.
  ///
  /// In en, this message translates to:
  /// **'I have read and accept'**
  String get iReadAndAccept;

  /// No description provided for @termsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Terms and Privacy Policy'**
  String get termsPrivacy;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @forgotPassSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email to receive an OTP code'**
  String get forgotPassSubtitle;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code sent to the registered email'**
  String get otpSubtitle;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @codeExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'Code expires in '**
  String get codeExpiresIn;

  /// No description provided for @didNotReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code yet?'**
  String get didNotReceiveCode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @confirmCode.
  ///
  /// In en, this message translates to:
  /// **'Confirm Code'**
  String get confirmCode;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get resetPasswordSubtitle;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @operationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Operation successful'**
  String get operationSuccess;

  /// No description provided for @passChangedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, your password has been changed successfully'**
  String get passChangedSuccess;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgotShort.
  ///
  /// In en, this message translates to:
  /// **'Forgot?'**
  String get forgotShort;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get agree;

  /// No description provided for @termsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please read the terms carefully before registering'**
  String get termsSubtitle;

  /// No description provided for @invalid_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields correctly'**
  String get invalid_fields;

  /// No description provided for @personal_data_success.
  ///
  /// In en, this message translates to:
  /// **'Your personal data has been submitted successfully'**
  String get personal_data_success;

  /// No description provided for @pleaseSelectTrip.
  ///
  /// In en, this message translates to:
  /// **'Please select a trip'**
  String get pleaseSelectTrip;

  /// No description provided for @pleaseSelectSeats.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one seat'**
  String get pleaseSelectSeats;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
    case 'en':
      return SEn();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
