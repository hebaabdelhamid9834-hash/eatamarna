import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/home/data/repo/home_repo.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_event.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_state.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/payment_screen.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/payment_web_view_screen.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/personal_information.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/travel_info_tab.dart';
import 'package:eatamarna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/personal_information.dart';
import 'package:eatamarna/feature/home/presentation/view/screens/travel_info_tab.dart';
import 'package:eatamarna/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eatamarna/core/utils/error_handler.dart';
import '../../../../../core/shared/widgets/no_internet_dialog.dart';
import 'confirm_screen.dart';
import '../widgets/custom_stepper.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}
class _HomePageViewState extends State<HomePageView> {
  int _activeStep = 0;
  final PageController _pageController = PageController();
  void _goToStep(int index, BuildContext context) {
    if (index == 0 || index == 3) {
      context.read<HomeBloc>().add(ResetBookingEvent());
    }
    setState(() => _activeStep = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.verified,
                color: Colors.green,
              ),
              Expanded(
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: null,
                  softWrap: true,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HomeRepositoryImpl(apiService: getIt<ApiService>()),
      child: BlocProvider(
        create: (context) =>
        HomeBloc(context.read<HomeRepositoryImpl>())
          ..add(GetTripResponseEvent())
          ..add(GetKinetStatusEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              current is SuccessGetBookingCodeState ||
              current is SuccessGetBookingDetailsState ||
              current is LoadingGetBookingDetailsState ||
              current is ErrorGetBookingDetailsState ||
              current is LoadingGetPaymentUrlState ||
              current is SuccessGetPaymentUrlState ||
              current is ErrorGetPaymentUrlState ||
              current is LoadingGuestSignupState ||
              current is SuccessGuestSignupState ||
              current is ErrorGetTripState ||
              current is LoadingGetBookingCodeResponse,
          listener: (context,state)async{
            if (state is LoadingGetPaymentUrlState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  content: Row(
                    children: [
                      CircularProgressIndicator(color: ColorManager.lightBlue),
                      const SizedBox(width: 20),
                      Text(S.of(context).loading),
                    ],
                  ),
                ),
              );
            }
            if (state is SuccessGetPaymentUrlState) {
              Navigator.pop(context);
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentWebView(url: state.url),
                ),
              );

              if (context.mounted) {
                _goToStep(3, context); // go to Confirm step
              }
            }
            if(state is SuccessGuestSignupState){
              showSuccessDialog(context,S.of(context).personal_data_success);
            }
            if(state is SuccessGetBookingCodeState){
             final bookingCode= PreferenceManager().saveBookingCode(state.bookingCodeResponse.bookingCode??'');
             print("bookingCode ${PreferenceManager().getBookingCode()}");
            }
            if(state is ErrorGuestSignupState){
              ErrorHandler.showError(context, S.of(context).invalid_fields, () {
                context.read<HomeBloc>().add(GuestSignupEvent());
              });
              _goToStep(1, context);
            }
            if (state is ErrorGetPaymentUrlState) {
              Navigator.pop(context);
              final bloc = context.read<HomeBloc>();
              ErrorHandler.showError(context, state.error, () {
                bloc.add(GetPaymentUrlEvent(
                  isKINETUrl: bloc.selectedIndex == 0 ? false : true,
                ));
              });
            }
            if (state is ErrorGetBookingCodeResponse) {
              // Navigator.pop(context);
              context.read<HomeBloc>().add(GetBookingCodeEvent());
            }
            if (state is ErrorGetBookingDetailsState) {
              final bloc = context.read<HomeBloc>();
              ErrorHandler.showError(context, state.error, () {
                bloc.add(GetBookingDetailsEvent(
                    tripId: bloc.tripId ?? "",
                    selectedDate: bloc.selectedDate ?? "",
                    seatsId: bloc.seats ?? []));
              });
            }
            if (state is ErrorGetTripState) {
              ErrorHandler.showError(context, state.error, () {
                context.read<HomeBloc>().add(GetTripResponseEvent());
              });
            }
          },
          builder: (context, state) {
            final bloc=context.read<HomeBloc>();
            return Column(
              children: [
                CustomStepper(activeStep: _activeStep, onStep: (index) {
                  if (index <= _activeStep) {
                    _goToStep(index, context);
                  }
                },),
                const Divider(),

                /// Pages
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        TravelInfoTab(),
                        PersonalInformation(bloc:bloc),
                        PaymentScreen(),
                        ConfirmScreen()
                        // PaymentTab(),
                        // ConfirmTab(),
                      ],
                    ),
                  ),
                ),

                /// Buttons
                _activeStep == 3 ? SizedBox() :
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 16),
                  child: MainButton(
                    title:S.of(context).next,
                    isLoading: false,
                    // state is LoadingGetBookingDetailsState ||
                    //     state is LoadingGuestSignupState ||
                    //     state is LoadingGetBookingCodeResponse,
                    onTap: () {
                      if (_activeStep == 0) {
                        if (bloc.tripId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).pleaseSelectTrip)),
                          );
                          return;
                        }
                        if (bloc.seats == null || bloc.seats!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(S.of(context).pleaseSelectSeats)),
                          );
                          return;
                        }
                      }
                      if (_activeStep == 1) {
                        if (bloc.formKey.currentState != null && !bloc.formKey.currentState!.validate()) {
                          return;
                        }
                        bloc.add(GetBookingDetailsEvent(
                            tripId: bloc.tripId ?? "",
                            selectedDate: bloc.selectedDate ?? "",
                            seatsId: bloc.seats ?? []));
                        // No need to call manually if GetBookingDetailsEvent triggers it,
                        // but the current implementation in HomeBloc triggers it in SuccessGetBookingDetailsState.
                      }
                      if (_activeStep == 2) {
                        bloc.add(GetPaymentUrlEvent(
                          isKINETUrl: bloc.selectedIndex == 0 ? false : true,
                        ));
                        return;
                      }
                      if (_activeStep < 3) {
                        _goToStep(_activeStep + 1, context);
                      }
                    },
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}

