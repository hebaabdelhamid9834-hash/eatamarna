import 'package:dotted_line/dotted_line.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:eatamarna/feature/home/presentation/view/widgets/rooms_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../core/shared/widgets/main_form_field.dart';
import '../widgets/accordionWidget.dart';

class TravelInfoTab extends StatelessWidget {
  const TravelInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: AccordionWidget(
      ),
    );
  }
}
