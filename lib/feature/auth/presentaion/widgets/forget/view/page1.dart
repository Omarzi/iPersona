
import 'package:persona2/core/config/routes/app.dart';

// ignore: must_be_immutable
class Page1 extends StatelessWidget {
  Page1({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });
  PageController pageController;
  int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TitleForgotScreen(
            title: 'Forgot Password',
            subTitle:
                'Enter your email for the verifivation proccess ,\n we will send 4 digits code to your email.',
          ),
          SizedBox(height: 30.h),
          MainTextFormField(
            height: 15.h,
            borderRadius: 10,
            hintText: 'Email',
            hintColor: AppColors.color3,
            borderColor: AppColors.color3.withOpacity(0.2),
          ),
          SizedBox(height: 110.h),
          MainButton(
            text: 'Continue',
            borderRadius: 10,
            onPressed: () {
              if (currentPageIndex < 2) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
                
              }
            },
          ),
        ],
      ),
    );
  }
}
