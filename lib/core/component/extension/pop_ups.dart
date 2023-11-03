

import '../../config/routes/app.dart';

extension LanguageAlertDialog on BuildContext {
  void customShowDialog(MainAlertDialog dialog) =>
      showDialog(context: this, builder: (BuildContext context) => dialog);
}
