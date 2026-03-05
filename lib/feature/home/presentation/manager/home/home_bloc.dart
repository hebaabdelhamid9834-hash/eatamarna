import 'package:bloc/bloc.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/feature/home/data/model/book_code_response.dart';
import 'package:eatamarna/feature/home/data/model/booking_response.dart';
import 'package:eatamarna/feature/home/data/model/register_guest_response.dart';
import 'package:eatamarna/feature/home/data/repo/home_repo.dart';

import 'package:eatamarna/feature/home/data/model/trip_response.dart';
import 'package:flutter/material.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._homeRepositoryImpl) : super(InitialState()){
    on<GetTripResponseEvent>(_getTrip);
    on<GetBookingDetailsEvent>(_getBookingDetails);
    on<SelectTripEvent>(_selectTrip);
    on<SelectSeatsEvent>(_selectSeats);
    on<SelectPriceEvent>(_selectPrice);
    on<GuestSignupEvent>(_signup);
    on<GetBookingCodeEvent>(_getBookingCodeDetails);
    on<GetPaymentUrlEvent>(_getPaymentUrl);
    on<ChangePaymentMethod>(_changePayment);
    on<ResetBookingEvent>(_resetBooking);
  }
  final HomeRepositoryImpl _homeRepositoryImpl;
  TripResponse? tripResponse;
   String? tripId;
  String?selectedDate;
  List ?seats=[];
  int selectedIndex=0;
  //todo
  String?selectedPrice;
  BookingResponse? bookingResponse;
  GuestRegisterResponse? guestResponse;
  BookingCodeResponse? bookingCodeResponse;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String countryCode = "965";

  _resetBooking(ResetBookingEvent event, Emitter<HomeState> emit) {
    tripResponse = null;
    tripId = null;
    selectedDate = null;
    seats = [];
    selectedPrice = null;
    bookingResponse = null;
    guestResponse = null;
    bookingCodeResponse = null;
    fNameController.clear();
    lNameController.clear();
    emailController.clear();
    phoneController.clear();
    add(GetTripResponseEvent());
  }

  _selectTrip(SelectTripEvent event, Emitter<HomeState> emit) {
    tripId = event.tripId;
    selectedDate = event.date;
  }
  void _selectSeats(SelectSeatsEvent event, Emitter<HomeState> emit) {
    seats = event.seats;
  }

  void _selectPrice(SelectPriceEvent event, Emitter<HomeState> emit) {
    selectedPrice = event.price;
  }
  _getTrip(GetTripResponseEvent event,Emitter<HomeState>emit )async{
    emit(LoadingGetTripState());
    final result=await _homeRepositoryImpl.getTrips();
    result.fold((failure){
      emit(ErrorGetTripState(error: failure.errorMessage));
  }, (response){
      tripResponse = response;
      emit(SuccessGetTripState(tripResponse: response));
  });
}
  _getBookingDetails(GetBookingDetailsEvent event,Emitter<HomeState>emit )async{
    emit(LoadingGetBookingDetailsState());
    final result=await _homeRepositoryImpl.getBookingData(tripId: tripId??'', selectedDate: selectedDate??'', seatsId: seats??[],price: selectedPrice??'');
    result.fold((failure){
      print("error ${failure.errorMessage}");
      emit(ErrorGetBookingDetailsState(error: failure.errorMessage));
    }, (response){
      bookingResponse = response;
      emit(SuccessGetBookingDetailsState(bookingResponse: response));
      add(GuestSignupEvent());
    });
  }
  _signup(GuestSignupEvent event, Emitter<HomeState> emit) async {
     // if (!formKey.currentState!.validate()) return;
    print("here");
    emit(LoadingGuestSignupState());
    final result = await _homeRepositoryImpl.registerGuest(
        fName: fNameController.text,
        lName: lNameController.text,
        countryCode: countryCode,
        phone: phoneController.text,
        email: emailController.text,
    );
    print("here");

    await result.fold(
          (failure) async {
        print("error ${failure.errorMessage}");
        emit(ErrorGuestSignupState(error: failure.errorMessage));
      },(result) async {
      guestResponse = result;

      await TokenStorageService().saveToken(result.guestToken ?? '');

      final token = await TokenStorageService().getToken();
      print("here token $token");

      emit(SuccessGuestSignupState(response: result));
      add(GetBookingCodeEvent());
    },
    );
  }
  _getBookingCodeDetails(GetBookingCodeEvent event,Emitter<HomeState>emit )async{
    final seatsMap = (seats ?? []).map((seatId) {
      return {
        "id": seatId,
      //  "is_extra": 0,
      };
    }).toList();
    emit(LoadingGetBookingCodeResponse());
    final result=await _homeRepositoryImpl.getBookingCodeData(tripId: tripId??'', selectedDate: selectedDate??'', seatsId: seatsMap,price: selectedPrice??"");
    result.fold((failure){
      print("error ${failure.errorMessage}");
      emit(ErrorGetBookingCodeResponse(error: failure.errorMessage));
    }, (response){
      bookingCodeResponse = response;
      PreferenceManager().saveBookingCode(response.bookingCode??'');
      final bookingCode=PreferenceManager().getBookingCode();
      print("booking code ${bookingCode}");
      emit(SuccessGetBookingCodeState(bookingCodeResponse: response));

    });
  }
  _changePayment(ChangePaymentMethod event,Emitter<HomeState>emit){
    selectedIndex=event.selectedItem;
    // emit(ChangePaymentUrlState());
  }
  _getPaymentUrl(GetPaymentUrlEvent event,Emitter<HomeState>emit)async{
    emit(LoadingGetPaymentUrlState());
    print("event${event.isKINETUrl}");
    final result=await _homeRepositoryImpl.getPaymentUrl(isKINET: event.isKINETUrl);
    result.fold((failure){
      emit(ErrorGetPaymentUrlState(error: failure.errorMessage));
    }, (url){
      emit(SuccessGetPaymentUrlState(url: url??''));
    });
  }
}
