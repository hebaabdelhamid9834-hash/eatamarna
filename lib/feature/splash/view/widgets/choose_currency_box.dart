import 'package:dotted_line/dotted_line.dart';
import 'package:eatamarna/core/network/api_service.dart';
import 'package:eatamarna/core/shared/loading_page/loading_page.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/image_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:eatamarna/feature/auth/data/repo/auth_repository_impl.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_event.dart';
import 'package:eatamarna/feature/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/change_lang/localization_cubit.dart';
import '../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../generated/l10n.dart';

class ChooseCurrencyBox extends StatefulWidget {
  const ChooseCurrencyBox({super.key});

  @override
  State<ChooseCurrencyBox> createState() => _ChooseCurrencyBoxState();
}

class _ChooseCurrencyBoxState extends State<ChooseCurrencyBox> {
  String _selectedLang = "KWD";
  String _selectedLangCode = "KWD";

  @override
  void initState() {
    super.initState();
    _loadSavedCurrency();
  }

  void _loadSavedCurrency() async {
    final prefs = getIt<SharedPreferences>();
    setState(() {
      _selectedLang = prefs.getString('selected_currency_name') ?? "KWD";
      _selectedLangCode = prefs.getString('selected_currency_code') ?? "KWD";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.gray),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).choose_currency,
            style: TextStyleManager.style16BoldBlack,
          ),
          SizedBox(height: 20.h),
          DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.3,
            dashLength: 6.0,
            dashColor: ColorManager.gray,
            dashGapLength: 3,
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              _showCurrencyDialog(context);
            },
            child: Container(
              width: double.infinity,
              height: context.responsiveHeight(60),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.gray),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(_selectedLang),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCurrencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: RepositoryProvider(
          create: (context) => AuthRepositoryImpl(getIt<ApiService>()),
          child: BlocProvider(
            create: (context) => SignUpBloc(
              isReminder: false,
              authRepositoryImpl: context.read<AuthRepositoryImpl>(),
            )..add(GetCurrencyEvent()),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return state is SuccessGetCurrencyState
                    ? SizedBox(
                  height: 140,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              state
                                      .currencyResponse
                                      .currencies?[index]
                                      .name ??
                                  '',
                            ),
                            onTap: () async {
                              final name = state.currencyResponse.currencies?[index].name ?? '';
                              final code = state.currencyResponse.currencies?[index].symbol ?? '';
                              
                              final prefs = getIt<SharedPreferences>();
                              await prefs.setString('selected_currency_name', name);
                              await prefs.setString('selected_currency_code', code);

                              setState(() {
                                _selectedLang = name;
                                _selectedLangCode = code;
                                context.read<SignUpBloc>().add(ChangCurrency(currency: name));
                              });
                              //     .changeLanguage("ar");
                              context.pop();
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(height: 1);
                        },
                        itemCount:
                            state.currencyResponse.currencies?.length ?? 0,
                      ),
                    )
                    : state is ErrorGetCurrencyState
                    ? Text(
                        state.error,
                        style: TextStyle(color: ColorManager.red),
                      )
                    : state is LoadingGetCurrencyState
                    ? AnimatedLoader()
                    : SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
