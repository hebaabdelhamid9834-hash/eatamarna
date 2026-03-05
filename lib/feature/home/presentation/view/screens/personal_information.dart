import 'package:dotted_line/dotted_line.dart';
import 'package:eatamarna/core/shared/widgets/main_form_field.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/icon_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/phone_suffix_widget.dart';
import 'package:eatamarna/feature/home/presentation/manager/home/home_bloc.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/custom_text_form_field.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/custom_text_form_field_phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/l10n.dart';

class PersonalInformation extends StatelessWidget {
  String fullPhone = '';
  HomeBloc bloc;
  PersonalInformation({required this.bloc});
  @override
  Widget build(BuildContext context) {
    return
     Form(
      key: bloc.formKey,
      child: Container(
      // height: MediaQuery.sizeOf(context).height*.30,
      margin: EdgeInsets.symmetric(horizontal: 23),
      padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.gray)
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).personalData,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(height: 11,),
          DottedLine(
            direction: Axis.horizontal,
            dashLength: 6,
            dashGapLength: 4,
            lineThickness: 2,
            dashColor: ColorManager.gray,
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            labelText: S.of(context).firstName,
            prefixIcon: Icons.person_outline,
            controller: bloc.fNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).field_required;
              }
              return null;
            },
          ),
          SizedBox(height: 23),
          CustomTextFormField(
            labelText: S.of(context).lastName,
            prefixIcon: Icons.person_outline,
            controller: bloc.lNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).field_required;
              }
              return null;
            },
          ),
          SizedBox(height: 23),
          CustomTextFormField(
            labelText: S.of(context).email,
            prefixIcon: Icons.email,
            controller: bloc.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                 return S.of(context).field_required;
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                 return S.of(context).field_required;
              }
              return null;
            },
          ),
          SizedBox(height: 23),
          //todo
          PhoneFormField(
            controller: bloc.phoneController,
            onChanged: (value) {
              // fullPhone = value; // +201234567890
            },
            onCountryCodeChanged: (code) {
              bloc.countryCode= code; // store code in a controller or state
            },
          ),
        ],
      ),
      ),
    );
  }
}
