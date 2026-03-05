import 'package:eatamarna/core/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/managers/color_manager/color_manager.dart';
import '../../../../../core/utils/managers/style_manager/text_style_manager.dart';

class OtpInputWidget extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  const OtpInputWidget({
    super.key,
    this.length = 5,
    this.onChanged,
    this.onCompleted,
  });

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _otp = '';

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[widget.length - 1].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(String value, int index) {
    if (value.length == 1) {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (value.isEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    }

    _updateOtp();
  }

  void _updateOtp() {
    String newOtp = '';
    for (var controller in _controllers) {
      newOtp += controller.text;
    }

    if (_otp != newOtp) {
      setState(() {
        _otp = newOtp;
      });

      widget.onChanged?.call(_otp);

      if (_otp.length == widget.length) {
        widget.onCompleted?.call(_otp);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => _buildOtpBox(widget.length - 1 - index),
      ).reversed.toList(),
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: context.responsiveWidth(60),
      height: context.responsiveWidth(60),
      decoration: BoxDecoration(
        border: Border.all(
          color: _controllers[index].text.isNotEmpty
              ? ColorManager.lightBlue
              : ColorManager.gray,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Center(
        child: TextFormField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.number,
          maxLength: 1,
          style: TextStyleManager.style20BoldBlack,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) => _onTextChanged(value, index),
          onTap: () {
            _controllers[index].selection = TextSelection(
              baseOffset: 0,
              extentOffset: _controllers[index].text.length,
            );
          },
        ),
      ),
    );
  }
}
