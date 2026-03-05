import 'package:eatamarna/feature/home/data/model/book_code_response.dart';
import 'package:eatamarna/feature/home/data/model/booking_response.dart';
import 'package:eatamarna/feature/home/data/model/register_guest_response.dart';
import 'package:eatamarna/feature/home/data/model/trip_response.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_event.dart';

abstract class HomeState {}
class InitialState extends HomeState{}
class LoadingGetTripState extends  HomeState{}
class ErrorGetTripState extends  HomeState{
  final String error;
  ErrorGetTripState({required this.error});
}
class SuccessGetTripState extends  HomeState{
  final TripResponse tripResponse;
  SuccessGetTripState({required this.tripResponse});
}
class LoadingGetBookingDetailsState extends HomeState{}
class ErrorGetBookingDetailsState extends HomeState{
  final String error;
  ErrorGetBookingDetailsState({required this.error});
}
class SuccessGetBookingDetailsState extends HomeState{
  final BookingResponse bookingResponse;
  SuccessGetBookingDetailsState({required this.bookingResponse});
}
class LoadingGuestSignupState extends HomeState{}
class ErrorGuestSignupState extends HomeState{
  final String error;
  ErrorGuestSignupState({required this.error});
}
class SuccessGuestSignupState extends HomeState{
  final GuestRegisterResponse response;
  SuccessGuestSignupState({required this.response});
}
class LoadingGetBookingCodeResponse extends HomeState{}
class ErrorGetBookingCodeResponse extends HomeState{
  final String error;
  ErrorGetBookingCodeResponse({required this.error});
}
class SuccessGetBookingCodeState extends HomeState{
  final BookingCodeResponse bookingCodeResponse;
  SuccessGetBookingCodeState({required this.bookingCodeResponse});
}
class LoadingGetPaymentUrlState extends HomeState{}
class ErrorGetPaymentUrlState extends HomeState{
  final String error;
  ErrorGetPaymentUrlState({required this.error});
}
class SuccessGetPaymentUrlState extends HomeState{
  final String url;
  SuccessGetPaymentUrlState({required this.url});
}
class ChangePaymentUrlState extends HomeState{}