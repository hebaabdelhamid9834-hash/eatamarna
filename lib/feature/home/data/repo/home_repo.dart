import 'package:dartz/dartz.dart';
import 'package:eatamarna/core/failure/failures.dart';
import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/feature/home/data/model/book_code_response.dart';
import 'package:eatamarna/feature/home/data/model/booking_response.dart';
import 'package:eatamarna/feature/home/data/model/register_guest_response.dart';
import 'package:eatamarna/feature/home/data/model/trip_response.dart';
import 'package:intl/intl.dart';

String formatDate(String arabicDate) {
  const months = {
    'يناير': '01',
    'فبراير': '02',
    'مارس': '03',
    'أبريل': '04',
    'مايو': '05',
    'يونيو': '06',
    'يوليو': '07',
    'أغسطس': '08',
    'اغسطس': '08',
    'سبتمبر': '09',
    'أكتوبر': '10',
    'اكتوبر': '10',
    'نوفمبر': '11',
    'ديسمبر': '12',
  };

  final parts = arabicDate.trim().split(' ');
print("parts ${parts}");
print("month ${months[parts[1]]}");

  final day = parts[0].padLeft(2, '0');
  final month = months[parts[1]] ?? '01';
  final year = parts[2];

  return "$year-$month-$day";
}
class HomeRepositoryImpl {
  final ApiService _apiService;

  HomeRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;
  Future<Either<Failure, TripResponse>> getTrips() async {
    try {
      final response = await _apiService.get(urlEndPoint: "reservations/trips");
      final TripResponses = TripResponse.fromJson(response);
      return Right(TripResponses);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, BookingResponse>> getBookingData({
    required String tripId,
    required String selectedDate,
    required List seatsId, required String price,
  }) async
  {
    String seatsQuery = seatsId.map((e) => "seats[]=$e").join("&");
    print("seat query ${seatsQuery}");
    print("date ${selectedDate}");
    String apiDate = formatDate(selectedDate);
    print("selected_date ${apiDate}");

    try {

      final bookingResponse = await _apiService.get(
        urlEndPoint:
            "reservations/price-details?trip_id=$tripId&selected_date=$apiDate&$seatsQuery",
      );
      final response = BookingResponse.fromJson(bookingResponse);
      print("response ${response}");
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, BookingCodeResponse>> getBookingCodeData({
    required String tripId,
    required String selectedDate,
    required List<Map<String,dynamic>> seatsId,
    required String price
  }) async
  {
    String apiDate = formatDate(selectedDate);
    print("code selected date ${apiDate}");
    final body={
        "trip_id": tripId,
        "selected_date": apiDate,
        // "guests": 1,
        "person_types": [
          {
            "name": "Adult",
            // "desc": "",
            // "min": "1",
            // "max": "10",
            // "price": "100",
            "number": seatsId.length
          }
        ],
     if(price.isNotEmpty) "extra_price": [{"name":price,"enable":1}],
        "selected_seats":seatsId
    };
    try {
      final bookingResponse = await _apiService.post(
        urlEndPoint:
        "guest/reservations/book",data:body );
      final response = BookingCodeResponse.fromJson(bookingResponse);
      return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, GuestRegisterResponse>> registerGuest({
    required String fName,
    required String lName,
    required String countryCode,
    required String phone,
    required String email,
  }) async
  {
    try{
      final  body = {
        "first_name": fName,
        "last_name":lName,
        "country_code": countryCode,
        "phone": phone,
        "email":email,
      };
      print("register${body}");
      final response =await _apiService.post(urlEndPoint: "guest/register",data:body);
      final guestResponse=GuestRegisterResponse.fromJson(response);
      return Right(guestResponse);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,String?>>getPaymentUrl({required bool isKINET})async{
    try{
      final body={
        "booking_code": await PreferenceManager().getBookingCode(),
        "gateway_id": isKINET?"sadadpay":"offline_payment"
      };
      final response =await _apiService.post(urlEndPoint: "guest/reservations/initiate-payment",data: body);
      final url=UrlResponse.fromJson(response);
      return Right(url.url);
    }
    on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}
