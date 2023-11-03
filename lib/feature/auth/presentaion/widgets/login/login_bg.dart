import '../../../../../core/config/routes/app.dart';

class LoginBg extends StatelessWidget {
  const LoginBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImage.loginBg,
      fit: BoxFit.fill,
      height: double.infinity,
    );
  }
}
