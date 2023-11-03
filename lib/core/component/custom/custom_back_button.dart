

import 'package:persona2/core/config/routes/app.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: () {
            context.back();
          },
          child: Padding(
            padding:  EdgeInsets.only(left: 2.w),
            child: Container(
              margin: EdgeInsets.all(8.sp),
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackColor,
                  size: 18.sp,
                ),
              ),
            ),
          ),
        );
  }
}