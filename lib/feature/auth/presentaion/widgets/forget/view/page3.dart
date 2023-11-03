import 'package:persona2/core/config/routes/app.dart';

// ignore: must_be_immutable
class Page3 extends StatefulWidget {
  Page3({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });
  PageController pageController;
  int currentPageIndex;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isObscuredNewPass = true;
  bool isObscuredReNewPass = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TitleForgotScreen(
            title: 'Reset Password',
            subTitle:
                'Set the new password for your account so you can \n login and access all the features.',
          ),
          SizedBox(height: 30.h),
          MainTextFormField(
            height: 15.h,
            borderRadius: 10,
            hintText: 'New Password',
            hintColor: AppColors.color3,
            borderColor: AppColors.color3.withOpacity(0.2),
            primaryScheme: AppColors.primaryColor,
obscureText: isObscuredNewPass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscuredNewPass = !isObscuredNewPass;
                });
              },
              icon: Icon(
                isObscuredNewPass ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          MainTextFormField(
            height: 15.h,
            borderRadius: 10,
            hintText: 'Re-enter Password',
obscureText: isObscuredReNewPass,

            hintColor: AppColors.color3,
            borderColor: AppColors.color3.withOpacity(0.2),
            primaryScheme: AppColors.primaryColor,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscuredReNewPass = !isObscuredReNewPass;
                });
              },
              icon: Icon(
                isObscuredReNewPass ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 30.h),
          MainButton(
            text: 'Update Password',
            borderRadius: 10,

            onPressed: () {
              if (widget.currentPageIndex < 2) {
                widget.pageController.animateToPage(
                  widget.currentPageIndex + 1,
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
