
import '../../../../../../core/config/routes/app.dart';

class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutePath.loginScreen,
            (route) => false,
          );
          CacheHelper.saveData(
             key: MyCacheKey.onboarding,
             value: true,
          );
        },
        child: Text(
          'Skip',
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 20.sp),
        ),
      ),
    );
  }
}
