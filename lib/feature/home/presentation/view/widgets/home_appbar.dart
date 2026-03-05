import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/core/storage/preference_manager.dart';
import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/core/utils/navigation/router_path.dart'
    show RouterPath;
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/view/widgets/log_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../generated/l10n.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Text(S.of(context).tripName, style: TextStyleManager.style16BoldBlack),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(S.of(context).mecca, style: TextStyleManager.style15RegGray),
                      SizedBox(width: 5.w),
                      Container(
                        width: context.responsiveHeight(5),
                        height: context.responsiveHeight(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff727272),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(S.of(context).saudiArabia, style: TextStyleManager.style15RegGray),
                    ],
                  ),
                ],
              ),
              // PreferenceManager().getSubToken().isNotEmpty?
              // IconButton(
              //   onPressed: () async {
              //   // //  if (!isLoggedIn) {
              //   //     context.pushNamed(RouterPath.login);
              //   //   } else {
              //       showDialog(
              //         context: context,
              //         builder: (_) => LogoutDialog(
              //           onLogout: () {
              //             context.read<SignUpBloc>().add(LogoutEvent());
              //           },
              //         ),
              //       );
              //   //  }
              //   },
              //   icon: Icon(
              //      Icons.logout,
              //   ),
              // ):
              // IconButton(
              //   onPressed: () async {
              //    // if (!isLoggedIn) {
              //       context.pushNamed(RouterPath.login);
              //     // } else {
              //     //   showDialog(
              //     //     context: context,
              //     //     builder: (_) => LogoutDialog(
              //     //       onLogout: () {
              //     //         context.read<SignUpBloc>().add(LogoutEvent());
              //     //       },
              //     //     ),
              //     //   );
              //     // }
              //   },
              //   icon: Icon(
              //    Icons.login
              //   ),
              // )
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Divider(color: ColorManager.gray),
      ],
    );
  }
}
