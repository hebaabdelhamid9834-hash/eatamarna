import 'package:eatamarna/feature/home/presentation/manager/home/home_state.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {}
class GetTripResponseEvent extends HomeEvent{}
class GetBusMapResponseEvent extends HomeEvent{}
class GetBookingDetailsEvent extends HomeEvent{
  final String tripId;
  final String selectedDate;
  final List seatsId;
  GetBookingDetailsEvent({required this.tripId,required this.selectedDate,required this.seatsId});
}
class SelectTripEvent extends HomeEvent {
  final String tripId;
  final String date;
  SelectTripEvent({
    required this.tripId,
    required this.date,
  });
}
class SelectSeatsEvent extends HomeEvent {
  final List seats;

  SelectSeatsEvent(this.seats);
}

class SelectPriceEvent extends HomeEvent {
  final String price;

  SelectPriceEvent(this.price);
}
class GuestSignupEvent extends HomeEvent{}
class GetBookingCodeEvent extends HomeEvent{}
class GetPaymentUrlEvent extends HomeEvent{
  final bool isKINETUrl;
  GetPaymentUrlEvent({required this.isKINETUrl});
}
class ChangePaymentMethod extends HomeEvent{
  final int selectedItem;
  ChangePaymentMethod({required this.selectedItem});
}

class ResetBookingEvent extends HomeEvent {}
