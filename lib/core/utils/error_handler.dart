import 'package:eatamarna/core/shared/widgets/no_internet_dialog.dart';
import 'package:eatamarna/core/shared/widgets/error_retry_dialog.dart';
import 'package:eatamarna/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorHandler {
  static void showError(BuildContext context, String error, VoidCallback onTryAgain) {
    if (error == S.of(context).noInternetConnection) {
      showDialog(
        context: context,
        builder: (context) => NoInternetDialog(onTryAgain: onTryAgain),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorRetryDialog(error: error, onTryAgain: onTryAgain),
      );
    }
  }
}
