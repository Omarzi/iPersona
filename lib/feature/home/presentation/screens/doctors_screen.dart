import 'package:persona2/core/config/routes/app.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key, required this.telehealth});
  final String telehealth;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            gredeantColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!
                .translate(AppStrings.popularDoctor)!,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor),
          ),
          leading: const CustomBackButton(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SearchedDoctorWidget(telehealth: telehealth),
              SizedBox(height: 20.h),
              SpecialistDoctorWidget(telehealth: telehealth),
              SizedBox(height: 15.h),
              ListDoctorSearchedWidget(telehealth: telehealth),
            ],
          ),
        ),
      ),
    );
  }
}
