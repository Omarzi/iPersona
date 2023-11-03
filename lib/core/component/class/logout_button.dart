import 'package:persona2/core/config/routes/app.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await CacheHelper.sharedPreferences.clear();
        context.toAndRemoveAllScreen(AppRoutePath.loginScreen);
      },
      icon: const Icon(Icons.logout),
    );
  }
}
