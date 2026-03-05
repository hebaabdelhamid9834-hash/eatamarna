import 'package:dotted_line/dotted_line.dart';
import 'package:eatamarna/core/utils/dependancy_injection/dependancy_injection.dart';
import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:eatamarna/core/utils/managers/assets_manager/image_manager.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/core/utils/navigation/navigation_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/change_lang/localization_cubit.dart';
import '../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../generated/l10n.dart';

class ChooseLangBox extends StatefulWidget {
  const ChooseLangBox({super.key});

  @override
  State<ChooseLangBox> createState() => _ChooseLangBoxState();
}

class _ChooseLangBoxState extends State<ChooseLangBox> {
  String _selectedLang = "العربية";
  String _selectedLangCode = "ar";

  @override
  void initState() {
    super.initState();
    final cubit = context.read<LocalizationCubit>();
    _loadSavedLanguage();
    // _selectedLangCode ="ar";
    // _selectedLang = "العربية";
  }
  void _loadSavedLanguage() async {
    final prefs = getIt<SharedPreferences>();
    setState(() {
      _selectedLang = prefs.getString('locale') ?? "ar";
      _selectedLangCode = prefs.getString('locale') ?? "ar";
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
            S.of(context).chooseLanguage,
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
              _showLanguageDialog(context);
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
                    Image.asset(
                      _selectedLangCode == "ar"
                          ? ImageManager.kuFlag
                          : ImageManager.ukFlag,
                    ),
                    const SizedBox(width: 10),
                    Text(_selectedLangCode == "ar"  ? "العربية" : "English"),                    const Spacer(),
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

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("العربية"),
              onTap: () {
                setState(() {
                  _selectedLang = "العربية";
                  _selectedLangCode = "ar";
                });
                context.read<LocalizationCubit>().changeLanguage("ar");
                context.pop();
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text("English"),
              onTap: () {
                setState(() {
                  _selectedLang = "English";
                  _selectedLangCode = "en";
                });
                context.read<LocalizationCubit>().changeLanguage("en");
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
