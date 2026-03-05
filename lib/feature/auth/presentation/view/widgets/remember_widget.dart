import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';
import '../../../../../generated/l10n.dart';

class RememberWidget extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final Widget? widget;
final bool reminder;
  const RememberWidget({super.key, this.onChanged, this.widget, required this.reminder});

  @override
  State<RememberWidget> createState() => _RememberWidgetState();
}

class _RememberWidgetState extends State<RememberWidget> {
  bool _isRemembered=false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isRemembered=widget.reminder;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isRemembered = !_isRemembered;
            });
            widget.onChanged?.call(_isRemembered);
          },
          child: Container(
            width: context.responsiveWidth(25),
            height: context.responsiveWidth(25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.lightBlue),
            ),
            child: _isRemembered
                ? Icon(Icons.check, color: ColorManager.yellow, size: 16.sp)
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        widget.widget ??
            Text(S.of(context).rememberMe, style: TextStyleManager.style14RegBlack),
      ],
    );
  }
}
