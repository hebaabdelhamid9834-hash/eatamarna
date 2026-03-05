import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class ConfirmScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<HomeBloc, HomeState>(
     builder: (context, state) {
       final bloc = context.read<HomeBloc>();
       final bookingCode = bloc.bookingCodeResponse?.bookingCode ?? PreferenceManager().getBookingCode();
       
       return
         Column(
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
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Center(child: Image.asset("assets/images/confirmImage.png",width: 220,height: 220,)),
             SizedBox(height: 26,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                 S.of(context).bookingSuccess,
                 style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.bold,
                   color: Color(0xff000000),
                 ),
               ),
             ),
             SizedBox(height: 25),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                 S.of(context).bookingDescription,
                 style: TextStyle(
                   fontSize: 14,
                   fontWeight: FontWeight.w400,
                   color: Color(0xff100D40),
                 ),
                 textAlign: TextAlign.center,
               ),
             ),
              SizedBox(height: 20),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //   decoration: BoxDecoration(
              //     color: ColorManager.gray.withOpacity(0.5),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         "Booking Code",
              //         style: TextStyle(
              //           fontSize: 12,
              //           color: ColorManager.gray,
              //         ),
              //       ),
              //       Text(
              //         bookingCode ?? "N/A",
              //         style: TextStyle(
              //           fontSize: 24,
              //           fontWeight: FontWeight.bold,
              //           color: ColorManager.lightBlue,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 26,),
           ],
         ),
       ),
     ],
   );
  }

   );}}