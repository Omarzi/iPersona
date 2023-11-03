import 'package:flutter/material.dart';
import 'package:persona2/core/config/routes/app.dart';

extension EmptyPadding on BuildContext {
  SizedBox sizeH(double height) =>
      SizedBox(height: MediaQuery.of(this).size.height.toDouble() * height);
  SizedBox sizeW(double width) =>
      SizedBox(width: MediaQuery.of(this).size.width.toDouble() * width);
}


extension Sizeed on double{

SizedBox get sWidth => SizedBox(width: this.w );
SizedBox get sHeight => SizedBox(width: this.h );

}

extension MediaQueryValues on BuildContext {
  double get w => MediaQuery.of(this).size.width;
  double get h => MediaQuery.of(this).size.height;
}

// extension EmptyPaddingg on num {
//   SizedBox get ph => SizedBox(height: toDouble());
//   SizedBox get pw => SizedBox(width: toDouble());
// }

extension Shrink on Widget {
  SizedBox get sh => const SizedBox.shrink();
}

extension validatorFun on String {
  bool validatorEmail() =>
      RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]").hasMatch(this);
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }
}

extension GeneralValidate on BuildContext? {
  String? generalValdate(String? value, {String value2 = 'value'}) {
    if (value == null || value.isEmpty) {
      return 'من فضلك املء الحقل';
    }
    return null;
  }
}


// extension validatationInCreateAccount on BuildContext {
//   String? validateCreation(String? val) {
//     if (val!.isEmpty || val == '') {
//       return AppStrings.pleaseEnterValue;
//     }
//     return null;
//   }

//   String? validateCrationForEmail(String? val) {
//     if (val!.isEmpty || val == '') {
//       return AppStrings.pleaseEnterValue;
//     } else if (!val.validatorEmail()) {
//       return AppStrings.exampleGmail;
//     }
//     return null;
//   }
// }
