import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsiveHeight(100),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(children: []);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: 6,
      ),
    );
  }
}
