// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `العربية`
  String get arabic {
    return Intl.message('العربية', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Choose your preferred language`
  String get chooseLanguage {
    return Intl.message(
      'Choose your preferred language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Serv5`
  String get appName {
    return Intl.message('Serv5', name: 'appName', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid OTP`
  String get invalidOtp {
    return Intl.message(
      'Please enter a valid OTP',
      name: 'invalidOtp',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Please choose app language`
  String get pleaseChooseAppLanguage {
    return Intl.message(
      'Please choose app language',
      name: 'pleaseChooseAppLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Test Another Page`
  String get testAnotherPage {
    return Intl.message(
      'Test Another Page',
      name: 'testAnotherPage',
      desc: '',
      args: [],
    );
  }

  /// `Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments`
  String get navgationError {
    return Intl.message(
      'Error! You Have Navigated To A Wrong Route. Or Navigated With Wrong Arguments',
      name: 'navgationError',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with server`
  String get connectionTimeout {
    return Intl.message(
      'Connection timeout with server',
      name: 'connectionTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with server`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout with server',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with server`
  String get sendTimeout {
    return Intl.message(
      'Send timeout with server',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was canceled`
  String get requestCanceled {
    return Intl.message(
      'Request to server was canceled',
      name: 'requestCanceled',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected error, please try again`
  String get unexpectedError {
    return Intl.message(
      'Unexpected error, please try again',
      name: 'unexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `Oops! There was an error, please try again`
  String get defaultError {
    return Intl.message(
      'Oops! There was an error, please try again',
      name: 'defaultError',
      desc: '',
      args: [],
    );
  }

  /// `Your request not found, please try later`
  String get requestNotFound {
    return Intl.message(
      'Your request not found, please try later',
      name: 'requestNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error, please try later`
  String get internalServerError {
    return Intl.message(
      'Internal server error, please try later',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Bad request, please check your data`
  String get badRequestError {
    return Intl.message(
      'Bad request, please check your data',
      name: 'badRequestError',
      desc: '',
      args: [],
    );
  }

  /// `Choose Currency`
  String get choose_currency {
    return Intl.message(
      'Choose Currency',
      name: 'choose_currency',
      desc: '',
      args: [],
    );
  }

  /// `Trip Name`
  String get tripName {
    return Intl.message('Trip Name', name: 'tripName', desc: '', args: []);
  }

  /// `Mecca`
  String get mecca {
    return Intl.message('Mecca', name: 'mecca', desc: '', args: []);
  }

  /// `Saudi Arabia`
  String get saudiArabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutConfirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data`
  String get personalData {
    return Intl.message(
      'Personal Data',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Booking Successful`
  String get bookingSuccess {
    return Intl.message(
      'Booking Successful',
      name: 'bookingSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The Umrah trip was booked successfully. We ask God to accept it from us and from all pilgrims.`
  String get bookingDescription {
    return Intl.message(
      'The Umrah trip was booked successfully. We ask God to accept it from us and from all pilgrims.',
      name: 'bookingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Choose Trip`
  String get chooseTrip {
    return Intl.message('Choose Trip', name: 'chooseTrip', desc: '', args: []);
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `Reserved`
  String get reserved {
    return Intl.message('Reserved', name: 'reserved', desc: '', args: []);
  }

  /// `Choose your seat on the bus`
  String get chooseSeat {
    return Intl.message(
      'Choose your seat on the bus',
      name: 'chooseSeat',
      desc: '',
      args: [],
    );
  }

  /// `Door`
  String get door {
    return Intl.message('Door', name: 'door', desc: '', args: []);
  }

  /// `Driver`
  String get driver {
    return Intl.message('Driver', name: 'driver', desc: '', args: []);
  }

  /// `Seat Reservation Numbers`
  String get seatReservationNumbers {
    return Intl.message(
      'Seat Reservation Numbers',
      name: 'seatReservationNumbers',
      desc: '',
      args: [],
    );
  }

  /// `KWD`
  String get kwd {
    return Intl.message('KWD', name: 'kwd', desc: '', args: []);
  }

  /// `Payment Details`
  String get paymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'paymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trip Date`
  String get tripDate {
    return Intl.message('Trip Date', name: 'tripDate', desc: '', args: []);
  }

  /// `Trip Time`
  String get tripTime {
    return Intl.message('Trip Time', name: 'tripTime', desc: '', args: []);
  }

  /// `Currency`
  String get currencyLabel {
    return Intl.message('Currency', name: 'currencyLabel', desc: '', args: []);
  }

  /// `Subscription Price`
  String get subscriptionPrice {
    return Intl.message(
      'Subscription Price',
      name: 'subscriptionPrice',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Choose Payment Method`
  String get choosePaymentMethod {
    return Intl.message(
      'Choose Payment Method',
      name: 'choosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `K-NET`
  String get knet {
    return Intl.message('K-NET', name: 'knet', desc: '', args: []);
  }

  /// `Personal Information`
  String get personal_info {
    return Intl.message(
      'Personal Information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Trip Information`
  String get trip_info {
    return Intl.message(
      'Trip Information',
      name: 'trip_info',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Number`
  String get invalid_number {
    return Intl.message(
      'Invalid Number',
      name: 'invalid_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your login details`
  String get loginSubtitle {
    return Intl.message(
      'Please enter your login details',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet? `
  String get noAccountYet {
    return Intl.message(
      'Don\'t have an account yet? ',
      name: 'noAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `New Account`
  String get newAccount {
    return Intl.message('New Account', name: 'newAccount', desc: '', args: []);
  }

  /// `Please enter your login details`
  String get signUpSubtitle {
    return Intl.message(
      'Please enter your login details',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message('Surname', name: 'surname', desc: '', args: []);
  }

  /// `I have read and accept`
  String get iReadAndAccept {
    return Intl.message(
      'I have read and accept',
      name: 'iReadAndAccept',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Privacy Policy`
  String get termsPrivacy {
    return Intl.message(
      'Terms and Privacy Policy',
      name: 'termsPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to receive an OTP code`
  String get forgotPassSubtitle {
    return Intl.message(
      'Please enter your email to receive an OTP code',
      name: 'forgotPassSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message('Send Code', name: 'sendCode', desc: '', args: []);
  }

  /// `Please enter the code sent to the registered email`
  String get otpSubtitle {
    return Intl.message(
      'Please enter the code sent to the registered email',
      name: 'otpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Code expires in `
  String get codeExpiresIn {
    return Intl.message(
      'Code expires in ',
      name: 'codeExpiresIn',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code yet?`
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive the code yet?',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Confirm Code`
  String get confirmCode {
    return Intl.message(
      'Confirm Code',
      name: 'confirmCode',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password`
  String get resetPasswordSubtitle {
    return Intl.message(
      'Please enter your new password',
      name: 'resetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Operation successful`
  String get operationSuccess {
    return Intl.message(
      'Operation successful',
      name: 'operationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations, your password has been changed successfully`
  String get passChangedSuccess {
    return Intl.message(
      'Congratulations, your password has been changed successfully',
      name: 'passChangedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forgot?`
  String get forgotShort {
    return Intl.message('Forgot?', name: 'forgotShort', desc: '', args: []);
  }

  /// `Agree`
  String get agree {
    return Intl.message('Agree', name: 'agree', desc: '', args: []);
  }

  /// `Please read the terms carefully before registering`
  String get termsSubtitle {
    return Intl.message(
      'Please read the terms carefully before registering',
      name: 'termsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields correctly`
  String get invalid_fields {
    return Intl.message(
      'Please fill in all fields correctly',
      name: 'invalid_fields',
      desc: '',
      args: [],
    );
  }

  /// `Your personal data has been submitted successfully`
  String get personal_data_success {
    return Intl.message(
      'Your personal data has been submitted successfully',
      name: 'personal_data_success',
      desc: '',
      args: [],
    );
  }

  /// `Please select a trip`
  String get pleaseSelectTrip {
    return Intl.message(
      'Please select a trip',
      name: 'pleaseSelectTrip',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one seat`
  String get pleaseSelectSeats {
    return Intl.message(
      'Please select at least one seat',
      name: 'pleaseSelectSeats',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
