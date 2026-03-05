import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/home_appbar.dart';
import 'home_page_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          HomeAppbar(),
          Expanded(child: HomePageView()),
        ],
      ),
    );
  }
}
