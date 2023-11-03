import 'package:persona2/core/config/routes/app.dart';

class SearchedDoctorWidget extends StatelessWidget {
  const SearchedDoctorWidget({super.key,required this.telehealth});
final String telehealth;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.2.w,
        )
      ),
      child: MainTextFormField(
        hintText: AppLocalizations.of(context)!.translate(AppStrings.search)!,
        fillColor: AppColors.wColor,
        prefixIcon: Icon(Icons.search, size: 26.sp,),
        suffixIcon: Icon(Icons.cancel, size: 24.sp,),
        borderRadius: 16.r,
        readOnly: true,
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            isScrollControlled: true,
            builder: (context) {
              return ButtomSheetSearchDoctor(telehealth: telehealth,);
            },
          );
        },
      ),
    );
  }
}
