import 'package:persona2/core/config/routes/app.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.onTap,
    required this.subTitle,
    required this.title
  });
  final VoidCallback onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.noColor,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 200.h,
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(height: 5.h),
               Text(
                subTitle,
                style: TextStyle(fontSize: 14.sp, color: AppColors.color3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => context.back(),
                    child:  Text(AppLocalizations.of(context)!.translate(AppStrings.cancle)!),
                  ),
                  TextButton(
                    onPressed: onTap,
                    child:  Text(AppLocalizations.of(context)!.translate(AppStrings.ok)!),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
