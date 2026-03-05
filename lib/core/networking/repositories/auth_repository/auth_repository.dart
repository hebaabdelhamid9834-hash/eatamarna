// import 'dart:io';
// import 'package:care_psy/core/networking/network_response.dart';
// import 'package:care_psy/core/networking/repositories/base_repository.dart';
// import 'package:care_psy/core/networking/responses/cities_response/cities_response.dart';
// import 'package:care_psy/core/networking/responses/countries_response/countries_response.dart';
// import 'package:care_psy/core/networking/responses/general_response.dart';
// import 'package:care_psy/core/networking/responses/nationalities_response/nationalities_response.dart';
// import 'package:care_psy/core/networking/responses/user_response/user_response.dart';
// import 'package:care_psy/utils/enums.dart';
// import 'package:dio/dio.dart';
//
// class AuthRepository extends BaseRepository {
//   Future<NetworkResponse<UserResponse>> login({
//     required String phone,
//     required String countryCode,
//     required String email,
//     required String password,
//     required String fcmToken,
//     required bool isEmail,
//   }) async {
//     body = {
//       'phone_country': countryCode,
//       'phone': phone,
//       'email': email,
//       'password': password,
//       'device_token': fcmToken,
//       'device_type': Platform.isAndroid ? 'android' : 'ios',
//     };
//     return networkHandler.post(UserResponse(), "auth/login", body: body);
//   }
//
//   Future<NetworkResponse<UserResponse>> register({
//     required UserType userType,
//     required String name,
//     required String email,
//     required String countryCode,
//     required String phone,
//     required String password,
//     required String birthdate,
//     required int? countryId,
//     required int? cityId,
//     required int? nationalityId,
//     required Gender? gender,
//     required MaritalStatus? maritalStatus,
//     required String? image,
//   }) async {
//     body = {
//       'name': name,
//       'phone': phone,
//       'phone_code': countryCode,
//       'email': email,
//       'password': password,
//       'password_confirmation': password,
//       'country_id': countryId,
//       'city_id': cityId,
//       'nationality_id': nationalityId,
//       'birth_date': birthdate,
//       'gender': gender?.name,
//       'marital_status': maritalStatus?.name,
//     };
//     FormData formData = FormData.fromMap(body);
//     if (image != null) {
//       formData.files.add(
//         MapEntry('image', await MultipartFile.fromFile(image!)),
//       );
//     }
//     return networkHandler.post(
//       UserResponse(),
//       userType == UserType.user
//           ? "client-register"
//           : "therapist-register-initiate",
//       body: formData,
//     );
//   }
//
//   Future<NetworkResponse<UserResponse>> verifyPhone({
//     required String otp,
//   }) {
//     body = { 'otp': otp};
//     return networkHandler.post(UserResponse(), "verify-otp", body: body);
//   }
//
//   Future<NetworkResponse<UserResponse>> fetchProfile() {
//     return networkHandler.get(UserResponse(), 'auth/profile-consultant');
//   }
//
//   Future<NetworkResponse<CountriesResponse>> fetchCountries({
//     String name = '',
//   }) {
//     return networkHandler.get(CountriesResponse(), 'countries?name=$name');
//   }
//
//   Future<NetworkResponse<NationalitiesResponse>> fetchNationalities({
//     String name = '',
//   }) {
//     return networkHandler.get(
//       NationalitiesResponse(),
//       'nationalities?name=$name',
//     );
//   }
//
//   Future<NetworkResponse<CitiesResponse>> fetchCities({
//     required int? countryId,
//     String name = '',
//   }) {
//     return networkHandler.get(
//       CitiesResponse(),
//       'cities?country_id=${countryId ?? ''}&name=$name',
//     );
//   }
// }
