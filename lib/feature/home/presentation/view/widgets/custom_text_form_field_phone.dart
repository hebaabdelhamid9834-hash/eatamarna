import 'package:eatamarna/core/utils/managers/color_manager/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../../generated/l10n.dart';

class PhoneFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onCountryCodeChanged; // add this callback
  final String initialCountryCode;

  const PhoneFormField({
    super.key,
    required this.controller,
    this.onChanged,
    this.onCountryCodeChanged,
    this.initialCountryCode = 'KW',
  });

  @override
  State<PhoneFormField> createState() => _PhoneFormFieldState();
}

class _PhoneFormFieldState extends State<PhoneFormField> {

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: widget.controller,
      initialCountryCode: widget.initialCountryCode,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: S.of(context).phone,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorManager.gray),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightBlue),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      invalidNumberMessage: S.of(context).invalid_number,
      onChanged: (phone) {
        widget.onChanged?.call(phone.number);

        String code = extractPhoneCode(phone.completeNumber);
        widget.onCountryCodeChanged?.call(phone.countryCode); // send code back to Bloc
        print("Full number: ${phone.completeNumber}");
        print("Extracted country code: $code");
      },
      onCountryChanged: (country) {
        widget.onCountryCodeChanged?.call(country.dialCode);
        print("Selected country code: ${country.dialCode}");
      },
    );
  }

  String extractPhoneCode(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+|-'), '');
    final match = RegExp(r'^(?:\+|00)?(\d{1,4})').firstMatch(phoneNumber);
    return match?.group(1) ?? '';
  }
}

