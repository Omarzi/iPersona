import 'package:flutter/material.dart';
import 'package:persona2/core/config/theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class BuildPinCodeField extends StatelessWidget {
  const BuildPinCodeField({
    Key? key,
    required this.onCompleted,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  final void Function(String)? onCompleted;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      autoFocus: true,
      cursorColor: AppColors.blackColor,
      keyboardType: TextInputType.phone,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        borderWidth: 1,
        fieldWidth: 40,
        activeColor: AppColors.primaryColor,
        activeFillColor: AppColors.wColor,
        inactiveColor: AppColors.secondColor,
        errorBorderColor: Colors.redAccent,
        selectedColor: AppColors.secondColor,
        selectedFillColor: AppColors.wColor,
        inactiveFillColor: AppColors.secondColor,
        disabledColor: AppColors.secondColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      textStyle: const TextStyle(
        color: AppColors.primaryColor,
      ),
      onAutoFillDisposeAction: AutofillContextAction.commit,
      onCompleted: onCompleted,
      onChanged: onChanged,
      appContext: context,
      validator: validator,
    );
  }
}
