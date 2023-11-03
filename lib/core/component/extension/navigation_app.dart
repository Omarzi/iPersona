import '../../config/routes/app.dart';

extension To on BuildContext {
  void to(String screen, {Object? arguments}) =>
      Navigator.pushNamed(this, screen, arguments: arguments);

  void toAndRemoveScreen(String screen, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, screen, arguments: arguments);

  void toAndRemoveAllScreen(String screen, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(this, screen, (route) => false,
          arguments: arguments);

  void back() => Navigator.pop(this);
}
