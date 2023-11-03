import 'package:persona2/core/config/routes/app.dart';

class CustomLikeView extends StatelessWidget {
  const CustomLikeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: 450.h,
        decoration: BoxDecoration(
          color: AppColors.wColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 35.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            Image.asset(AppImage.like),
            Text(
              'Thank You !',
              style: TextStyle(
                fontSize: 35.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Your Appointment Successful',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.color3,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              '''You booked an appointment with Dr. 
      Sara Ahmed  on February 21,
      at 02:00 PM
      ''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.color3,
              ),
            ),
            SizedBox(height: 35.h),
            MainButton(
              text: 'Done',
              onPressed: () {
                context.to(AppRoutePath.hospitalScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
