import 'package:flutter/cupertino.dart';
import 'package:persona2/core/config/routes/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        drawer: const HomeDrawer(),
        appBar: homeAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .translate(AppStrings.chooseTheService)!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Container(
                        color: AppColors.grayApp,
                        height: 1.4.h,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    var model = cubit.doctorModel;
                    return model == null
                        ? const MainLoading()
                        : HomeDoctorWidgetNew(
                            title: AppLocalizations.of(context)!
                                .translate(AppStrings.onlineSessions)!,
                            subTitle: AppLocalizations.of(context)!.translate(
                                AppStrings.connectWithOneOfOurExpertsViaVideo)!,
                            icon: CupertinoIcons.video_camera,
                            onPress: () {
                              cubit.getSearchedDoctor(telehealth: 'online');
                              context.to(
                                AppRoutePath.doctorsScreen,
                                arguments: 'online',
                              );
                            },
                          );
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    var model = cubit.doctorModel;
                    return model == null
                        ? const MainLoading()
                        : HomeDoctorWidgetNew(
                            title: AppLocalizations.of(context)!
                                .translate(AppStrings.visitTheNearestClinic)!,
                            subTitle: '',
                            icon: Icons.maps_home_work_outlined,
                            onPress: () {
                              cubit.getSearchedDoctor(telehealth: 'ofline');
                              context.to(
                                AppRoutePath.doctorsScreen,
                                arguments: "ofline",
                              );
                            },
                          );
                  },
                ),
                SizedBox(height: 20.h),
                BlocBuilder<HospitalCubit, HospitalState>(
                  builder: (context, state) {
                    var cubit = HospitalCubit.get(context);
                    var model = cubit.searchedHospitalModel;

                    return model == null
                        ? const MainLoading()
                        : HomeDoctorWidgetNew(
                            title: AppLocalizations.of(context)!
                                .translate(AppStrings.hospitalReservations)!,
                            subTitle: '',
                            icon: Icons.local_hospital_outlined,
                            onPress: () {
                              context.to(AppRoutePath.hospitalScreen,
                                  arguments: {
                                    'list': model.data ?? [],
                                    'cities': model.cities
                                  });
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
