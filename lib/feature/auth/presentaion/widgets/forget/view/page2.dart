
// ignore_for_file: must_be_immutable

import 'package:persona2/core/config/routes/app.dart';

class Page2 extends StatelessWidget {
  Page2({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });
  final TextEditingController codeController = TextEditingController();
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
            title: 'Enter 4 Digits Code',
            subTitle:
                'Enter the 4 digits code that you received on \n your email.',
          ),
          SizedBox(height: 30.h),
          BuildPinCodeField(
            onChanged: (value) {
              codeController.text = value;
            },
            onCompleted: (submitCode) {
              codeController.text = submitCode;
            },
          ),
          SizedBox(height: 100.h),
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
