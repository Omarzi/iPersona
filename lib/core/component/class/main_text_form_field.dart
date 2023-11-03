import '../../config/routes/app.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField({
    super.key,
    this.onTap,
    this.hintText,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 50,
    this.fillColor = AppColors.wColor,
    this.borderColor = AppColors.noColor,
    this.maxLines = 1,
    this.sizeBoxHight = 0.06,
    this.prefix,
    this.hintColor = AppColors.grayApp,
    this.height = 0,
    this.suffixIcon,
    this.labelText,
    this.labelSize,
    this.primaryScheme = AppColors.wColor,
    this.textFormColor = AppColors.wColor,
    this.initialValue,
  });

  final bool readOnly;
  final bool obscureText;

  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color fillColor;
  final Color borderColor;
  final int maxLines;
  final double sizeBoxHight;
  final double height;
  final Widget? prefix;
  final Color hintColor;
  final Color primaryScheme;
  final Color textFormColor;
  final double? labelSize;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: primaryScheme,
            ),
      ),
      child: TextFormField(
        cursorHeight: 28,
        maxLines: maxLines,
        initialValue: initialValue,
        readOnly: readOnly,
        obscureText: obscureText,
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        controller: controller,
        enableSuggestions: true,
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        style: TextStyle(color: textFormColor, fontSize: 20),
        decoration: inputDecoration(),
      ),
    );
  }

  InputDecoration inputDecoration() => InputDecoration(
        // filled: true,
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 14.0.sp,
        ),
        hintStyle: TextStyle(color: hintColor, fontSize: 17.sp),
        enabled: true,
        filled: true,

        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: labelSize),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hoverColor: Colors.red,
        focusColor: Colors.red,
        fillColor: fillColor,
        contentPadding: EdgeInsets.symmetric(vertical: height, horizontal: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        errorBorder: outlineInputBorderError(),
        focusedErrorBorder: outlineInputBorderError(),
      );

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: borderColor,
      ),
    );
  }

  OutlineInputBorder outlineInputBorderError() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: const BorderSide(
        color: AppColors.redColor,
      ),
    );
  }
}
