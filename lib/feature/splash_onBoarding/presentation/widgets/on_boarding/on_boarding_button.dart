
import '../../../../../../core/config/routes/app.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.position2,
    required this.pageController,
  });

  final PageController pageController;
  final int position2;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: () {
        if (position2 != 2) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutePath.loginScreen,
            (route) => false,
          );
          CacheHelper.saveData(
            key: MyCacheKey.onboarding,
            value: true,
          );
        }
      },
      text: position2 != 2 ? 'Next' : 'Get Started',
    );
  }
}
