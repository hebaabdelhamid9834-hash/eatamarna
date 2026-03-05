// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../generated/l10n.dart';
// import 'localization_cubit.dart';
// import '../managers/color_manager/color_manager.dart';
// import '../managers/style_manager/text_style_manager.dart';
//
// class ChangeLangOptions {
//   static void showLanguageOptions(BuildContext context, GlobalKey key) async {
//     LocalizationCubit localizationCubit = BlocProvider.of<LocalizationCubit>(
//       context,
//     );
//     final lang = S.of(context);
//
//     final RenderBox? renderBox =
//         key.currentContext?.findRenderObject() as RenderBox?;
//     final RenderBox? overlay =
//         Overlay.of(context).context.findRenderObject() as RenderBox?;
//
//     if (renderBox != null && overlay != null) {
//       final Offset offset = renderBox.localToGlobal(
//         Offset.zero,
//         ancestor: overlay,
//       );
//
//       final selectedLang = await showMenu<String>(
//         shadowColor: ColorManager.black.withOpacity(0.25),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.r),
//         ),
//         color: ColorManager.white,
//         context: context,
//         position: RelativeRect.fromLTRB(
//           offset.dx + renderBox.size.width - 170,
//           offset.dy + renderBox.size.height,
//           offset.dx + renderBox.size.width,
//           offset.dy + renderBox.size.height + 50,
//         ),
//         items: [
//           PopupMenuItem(value: "ar", child: _buildLangOption(lang.arabic)),
//           PopupMenuItem(value: "en", child: _buildLangOption(lang.english)),
//         ],
//       );
//
//       if (selectedLang != null) {
//         localizationCubit.changeLanguage(selectedLang);
//       }
//     }
//   }
//
//   static Widget _buildLangOption(String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 5.h),
//       child: Row(
//         children: [
//           Text(
//             text,
//             style: TextStyleManager.style14BoldBlack,
//           ),
//           SizedBox(width: 250.w),
//           Icon(
//             Icons.check,
//           ),
//         ],
//       ),
//     );
//   }
// }
