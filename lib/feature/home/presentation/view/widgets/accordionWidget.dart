import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:eatamarna/core/shared/animations/animation/grid_view_animation.dart';
import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/feature/home/data/model/trip_response.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_event.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_state.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/bus_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget({super.key});

  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  TripData? selectedTrip;
  bool isAccordionOpen = false;
  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    if (bloc.tripId != null) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        final bloc = context.read<HomeBloc>();
        if (bloc.tripResponse?.data != null &&
            bloc.tripResponse!.data!.isNotEmpty) {
          if (bloc.tripId != null) {
            // Always sync selectedTrip with latest data if tripId is set
            final latestTrip = bloc.tripResponse!.data!.firstWhere(
              (trip) => trip.id == bloc.tripId,
              orElse: () => bloc.tripResponse!.data!.first,
            );
            if (selectedTrip != latestTrip) {
              setState(() {
                selectedTrip = latestTrip;
              });
            }
          } else {
            // Reset to first trip if bloc.tripId is null (e.g. after ResetBookingEvent)
            setState(() {
              selectedTrip = bloc.tripResponse!.data!.first;
              bloc.add(
                SelectTripEvent(
                  tripId: selectedTrip!.id!,
                  date: selectedTrip!.date!,
                ),
              );
            });
          }
        } else if (bloc.tripResponse?.data != null && bloc.tripResponse!.data!.isEmpty) {
          setState(() {
            selectedTrip = null;
          });
        }
      },
      buildWhen: (previous, current) =>
          current is LoadingGetTripState ||
          current is SuccessGetTripState ||
          current is ErrorGetTripState ||
          current is SuccessGetBookingDetailsState ||
          current is LoadingGetBookingDetailsState ||
          current is ErrorGetBookingDetailsState,
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        final tripResponse = bloc.tripResponse;

        if (state is LoadingGetTripState && tripResponse == null) {
          return Center(
              child: CircularProgressIndicator(color: ColorManager.lightBlue));
        }

        if (state is ErrorGetTripState && tripResponse == null) {
          return ErrorWidget(state.error);
        }

        if (tripResponse != null && tripResponse.data != null) {
          return RefreshIndicator(
            onRefresh: ()async{
              bloc.add(GetTripResponseEvent());
            },
            child: ListView(
              children: [
                // 1. THE HEADER (ACCORDION TRIGGER)
                InkWell(
                  onTap: () => setState(() => isAccordionOpen = !isAccordionOpen),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 15.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorManager.lightBlue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).chooseTrip,
                              style: TextStyleManager.style16BoldBlack,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text(
                                  selectedTrip?.day ??
                                      tripResponse.data?.first.day ??
                                      "",
                                  style: TextStyleManager.style15RegGray,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  selectedTrip?.date ??
                                      tripResponse.data?.first.date ??
                                      "",
                                  style: TextStyleManager.style15RegGray,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  selectedTrip?.duration ??
                                      tripResponse.data!.first.duration ??
                                      "",
                                  style: TextStyleManager.style15RegGray,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          isAccordionOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                ),
                // 2. THE TRIP SELECTION LIST
                if (isAccordionOpen)
                  _buildTripList(trips: tripResponse.data, bloc: bloc),
                if (selectedTrip != null)
                  BusSeatSelector(
                      busMap: selectedTrip!.seats,
                      prices: selectedTrip!.extraPrices,
                      bloc: bloc),
                // SizedBox(height: 20.h),
              ],
            ),
          );
        }

        return SizedBox();
      },
    );
  }

  Widget _buildTripList({List<TripData>? trips, required HomeBloc bloc}) {
    return Container(
      height: 100.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        itemCount: trips?.length ?? 0,
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          final trip = trips![index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTrip = trip;
                isAccordionOpen = false;
               bloc.add(
                  SelectTripEvent(
                    tripId: selectedTrip!.id!,
                    date: selectedTrip!.date!,
                  ),
                );
              });
            },
            child: ListTile(
              tileColor: Colors.grey.shade100,
              subtitle: Row(
                children: [
                  Text(trip.day!),
                  Text(trip.date!),
                  SizedBox(width: 7),
                  Text(trip.duration!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DottedContainer extends StatelessWidget {
  const DottedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.responsiveHeight(5),
      height: context.responsiveHeight(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff727272),
      ),
    );
  }
}
