import 'package:persona2/core/config/routes/app.dart';

class ConstToAndFrom extends StatelessWidget {
  const ConstToAndFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(   "${AppLocalizations.of(context)!.translate(AppStrings.to)!} : ",
     
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
            "${AppLocalizations.of(context)!.translate(AppStrings.from)!} : ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 20.h),

      ],
    );
  }
}
