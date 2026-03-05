import 'package:easy_stepper/easy_stepper.dart';
import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

class CustomStepper extends StatelessWidget {
   CustomStepper({
    super.key,
    required int activeStep,
    required this.onStep
  }) : _activeStep = activeStep;

  final int _activeStep;
Function(int)onStep;
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStepIconColor: ColorManager.lightBlue,
      stepRadius: 20,
      activeStep: _activeStep,
      showLoadingAnimation:_activeStep==3? false:true,
      lineStyle: const LineStyle(
        lineLength: 60,
        lineThickness: 2,
        finishedLineColor: ColorManager.lightBlue,
        unreachedLineColor: Colors.grey,// ✅ line becomes blue
        activeLineColor: Colors.grey
      ),
      finishedStepBackgroundColor: ColorManager.lightBlue,   // ✅ completed circle blue
      finishedStepTextColor: ColorManager.lightBlue,

      activeStepBackgroundColor:ColorManager.white,     // current step blue
      activeStepTextColor: ColorManager.lightBlue,

      unreachedStepBackgroundColor: Colors.grey,
      unreachedStepTextColor: Colors.grey,
      onStepReached: (index) {
      onStep(index);
      },
      steps:  [
        EasyStep(
          icon: Icon(Icons.flight,),
          title: S.of(context).trip_info,
        ),
        EasyStep(
          icon: Icon(Icons.person),
          title: S.of(context).personal_info,
        ),
        EasyStep(
          icon: Icon(Icons.payment),
          title: S.of(context).payment,
        ),
        EasyStep(
          icon: Icon(Icons.check),
          title: S.of(context).confirm,
        ),
      ],
    );
  }
}
