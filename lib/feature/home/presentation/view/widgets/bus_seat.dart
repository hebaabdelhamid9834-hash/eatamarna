import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/home/data/model/trip_response.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_event.dart' show SelectSeatsEvent, SelectPriceEvent;
import 'package:eatamarna/feature/home/presentation/view/widgets/accordionWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../../generated/l10n.dart';

class BusSeatSelector extends StatefulWidget {
  BusSeatSelector({super.key, this.busMap,this.prices, required this. bloc});
  List<Seats>? busMap;
  List<ExtraPrices>? prices;
  HomeBloc bloc;
  @override
  State<BusSeatSelector> createState() => _BusSeatSelectorState();
}

class _BusSeatSelectorState extends State<BusSeatSelector> {
  List<String> selectedSeatLabels = [];
  String? selectedValue = "";

  @override
  void initState() {
    super.initState();
    _syncWithBloc();
  }

  @override
  void didUpdateWidget(covariant BusSeatSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncWithBloc();
  }

  void _syncWithBloc() {
    selectedValue = widget.bloc.selectedPrice;
    selectedSeatLabels.clear();
    if (widget.busMap != null && widget.bloc.seats != null) {
      for (var seatId in widget.bloc.seats!) {
        final seat = widget.busMap!.firstWhere(
          (s) => s.id == seatId,
          orElse: () => Seats(),
        );
        if (seat.label != null) {
          selectedSeatLabels.add(seat.label!);
        }
      }
    }
    setState(() {});
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem(S.of(context).available, Colors.lightBlue.shade200),
        SizedBox(width: 15.w),
        _legendItem(S.of(context).reserved, Colors.black),
      ],
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 5.w),
        Text(label, style: TextStyle(fontSize: 12.sp)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print("bus map ${widget.busMap?.length}");
    return Column(
      // shrinkWrap: true,
      // scrollDirection: Axis.vertical,
      children: [
        SizedBox(
          height: 50, // IMPORTANT
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context,index){
          return Row(
              children: [
                Radio<String>(
                  fillColor: WidgetStateProperty.all(ColorManager.lightBlue),
          value:widget.prices![index].name??'',
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              widget.bloc.add(SelectPriceEvent(value ?? ''));
              print("value od radio button ${value}");
            });
          },
                ),
                 Text("${widget.prices![index].name} ${widget.prices![index].price} ${S.of(context).kwd}" ),
              ]);
          }, separatorBuilder: (context,index){
            return SizedBox(width: 10,);
          }, itemCount: widget.prices?.length??0),
        ),

        Text(
          S.of(context).chooseSeat,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildLegend(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(color: Color(0xffF8F8F8)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/material-symbols_door-open-sharp.png",
                      width: 19.5,
                      height: 19.5,
                    ),
                    SizedBox(width: 7),
                    Text(S.of(context).door),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(color: Color(0xffFFF2D9)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Group(2).png",
                      width: 19.5,
                      height: 19.5,
                    ),
                    SizedBox(width: 7),
                    Text(S.of(context).driver),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 7),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: _buildSeatGrid(),
        ),
        const SizedBox(height: 20),
        Text(S.of(context).seatReservationNumbers),
        Text(
          selectedSeatLabels.join(", "),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildSeatGrid() {
    final seats = widget.busMap ?? [];

    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      children: [
        for (int i = 0; i < seats.length; i++) ...[
          if (i == 21)
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: _doorWidget(S.of(context).door),
            ),

          if (i == 19)
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: _doorWidget("wc"),
            ),

          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: _buildSeatWidget(seats[i],bloc:widget.bloc),
          ),
        ],
      ],
    );
  }

  Widget _buildSeatWidget(Seats seat, {required HomeBloc bloc}) {
    if (seat.status == "empty") {
      return const SizedBox.shrink();
    }

    bool isReserved = seat.taken == true;
    bool isSelected = selectedSeatLabels.contains(seat.label);

    bool canSelect = seat.status == "seat" && (!isReserved || isSelected);

    return InkWell(
      onTap: canSelect
          ? () {
              setState(() {
                if (isSelected) {
                  selectedSeatLabels.remove(seat.label);
                  bloc.seats!.remove(seat.id);
                } else {
                  selectedSeatLabels.add(seat.label ?? "");
                  bloc.seats!.add(seat.id);
                }
              });
            }
          : null,
      child: _seatUI(seat, isReserved, isSelected),
    );
  }

  Widget _seatUI(Seats seat, bool isReserved, bool isSelected) {
    BoxDecoration decoration;
    TextStyle textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );

    if (isReserved) {
      decoration = BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      );
      textStyle = textStyle.copyWith(color: Colors.white);
      if (isSelected) {
        decoration = decoration.copyWith(
          border: Border.all(color: Colors.orange, width: 2),
        );
      }
    } else if (isSelected) {
      decoration = BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        border: Border.all(color: Colors.orange, width: 2),
        shape: BoxShape.circle,
      );
      textStyle = textStyle.copyWith(color: Colors.orange);
    } else {
      decoration = BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(4),
      );
      textStyle = textStyle.copyWith(color: Colors.lightBlue);
    }

    return Container(
      decoration: decoration,
      alignment: Alignment.center,
      child: Text(seat.label ?? '', style: textStyle),
    );
  }

  Widget _doorWidget(String text) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffF8F8F8)),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/material-symbols_door-open-sharp.png",
            width: 19.5,
            height: 19.5,
          ),
          const SizedBox(width: 7),
          Text(text),
        ],
      ),
    );
  }
}
