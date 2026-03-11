import 'package:dotted_line/dotted_line.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home/home_event.dart';

class PaymentScreen extends StatefulWidget {
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map<String, String>> payments = [
    {"key": "cashOnDelivery", "image": "assets/images/cache.png"},
    {"key": "knet", "image": "assets/images/knet.png"},
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();

        // Filter payments based on kinet visibility
        final filteredPayments = payments.where((payment) {
          if (payment['key'] == 'knet') {
            return bloc.isKinetVisible;
          }
          return true;
        }).toList();

        if (bloc.bookingResponse != null) {
          final bookingResponse = bloc.bookingResponse!;
          return ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                padding: EdgeInsets.only(top: 23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorManager.gray),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        S.of(context).paymentDetails,
                        style: TextStyle(
                          fontSize: 16,

                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 2,
                        dashColor: ColorManager.gray,
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PaymentTextRow(
                        title: S.of(context).tripDate,
                        value: bookingResponse.bookingDetails?.date ?? '',
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PaymentTextRow(
                        title: S.of(context).tripTime,
                        value:
                            bookingResponse.bookingDetails?.time.toString() ??
                            '',
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PaymentTextRow(
                        title: S.of(context).currencyLabel,
                        value:
                            bookingResponse.bookingDetails?.currency
                                .toString() ??
                            '',
                      ),
                    ),
                    SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PaymentTextRow(
                        title: S.of(context).subscriptionPrice,
                        value:
                            bookingResponse.bookingDetails?.totalPrice
                                .toString() ??
                            '',
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: Color(0xffFFFAF2),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).total,
                              style: TextStyle(
                                fontSize: 17,
                                color: ColorManager.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  bookingResponse.bookingDetails?.totalPrice
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 19,
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  bookingResponse.bookingDetails?.currency
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                padding: EdgeInsets.only(top: 23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorManager.gray),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        S.of(context).choosePaymentMethod,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DottedLine(
                        direction: Axis.horizontal,
                        dashLength: 6,
                        dashGapLength: 4,
                        lineThickness: 2,
                        dashColor: ColorManager.gray,
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: List.generate(filteredPayments.length, (
                          index,
                        ) {
                          final isSelected = bloc.selectedIndex == index;

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  bloc.add(
                                    ChangePaymentMethod(selectedItem: index),
                                  );
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isSelected
                                        ? ColorManager.lightBlue
                                        : ColorManager.black,
                                    width: isSelected ? 2 : 1,
                                  ),
                                  color: isSelected
                                      ? ColorManager.lightBlue.withOpacity(0.08)
                                      : Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      filteredPayments[index]["image"]!,
                                      height: 40,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      filteredPayments[index]["key"] ==
                                              "cashOnDelivery"
                                          ? S.of(context).cashOnDelivery
                                          : S.of(context).knet,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: isSelected
                                            ? ColorManager.lightBlue
                                            : ColorManager.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is ErrorGetBookingDetailsState) {
          return Center(
            child: Text(state.error, style: TextStyle(color: ColorManager.red)),
          );
        } else if (state is LoadingGetBookingDetailsState) {
          return Center(
            child: CircularProgressIndicator(color: ColorManager.lightBlue),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class PaymentTextRow extends StatelessWidget {
  final String title;
  final String value;

  PaymentTextRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: ColorManager.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16, color: ColorManager.black),
            ),
            // SizedBox(width: 3,),
            // Text(
            //   "ريال",
            //   style: TextStyle(
            //     fontSize: 14,
            //     color: ColorManager.black,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
