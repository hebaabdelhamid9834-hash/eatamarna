import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/shared/widgets/main_button.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:eatamarna/feature/auth/presentation/view/sign_up/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/managers/assets_manager/image_manager.dart';
import '../../../../core/utils/managers/style_manager/text_style_manager.dart';

class TermsConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
      child: BlocProvider(
        create: (context) => SignUpBloc(isReminder: true, authRepositoryImpl: context.read<AuthRepositoryImpl>())..add(GetTermEvent()),
        child: BlocBuilder<SignUpBloc, SignUpState>(
  builder: (context, state) {
    return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerFloat,
          floatingActionButton:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MainButton(
                title: S.of(context).agree, onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignupView(reminder: true)));
            }),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              child:
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(S.of(context).termsConditions,
                      style: TextStyleManager.style16BoldBlack),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        S.of(context).termsSubtitle,
                        style: TextStyleManager.style15RegGray,
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        width: context.responsiveHeight(5),
                        height: context.responsiveHeight(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff727272),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  state is SuccessGetTermState?      Expanded(
                    child: ListView(
                      children: [
                        SizedBox(height: 24.h),
                        Image.asset(
                          ImageManager.logo,
                          height: context.responsiveHeight(180),
                        ),
                        SizedBox(height: 37.h),
                        Text(
                          state.termsResponse.title??''                          ,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),maxLines: null,
                        ),
                        Text(
state.termsResponse.content??''                          ,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),maxLines: null,
                        ),
                      ],
                    ),
                  ):state is LoadingGetTermState?AnimatedLoader():state is ErrorGetTermState?Text(state.error,style:TextStyle(color: ColorManager.red),):SizedBox(),
                ],
              ),
            ),
          ),
        );
  },
),
      ),
    );
  }
}
