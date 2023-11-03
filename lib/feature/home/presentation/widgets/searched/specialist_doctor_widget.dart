import 'package:persona2/core/config/routes/app.dart';

class SpecialistDoctorWidget extends StatefulWidget {
  SpecialistDoctorWidget({super.key, required this.telehealth});
  final String telehealth;
  @override
  State<SpecialistDoctorWidget> createState() => _SpecialistDoctorWidgetState();
}

class _SpecialistDoctorWidgetState extends State<SpecialistDoctorWidget> {
  int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var model = cubit.searchDoctorModel;
        return model == null
            ? const MainLoading()
            : Center(
                child: SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = -1;
                          });
                          cubit.getSearchedDoctor(telehealth: widget.telehealth);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectIndex == -1
                                ? AppColors.primaryColor
                                : const Color(0xFFf6f0f8),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2.w,
                            )
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate(AppStrings.all)!,
                              style: TextStyle(
                                  color: selectIndex == -1
                                      ? AppColors.wColor
                                      : Theme.of(context).primaryColor,
                                  fontSize: 15.sp),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          itemCount: model.data!.specialities!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var item = model.data!.specialities![index];
                            return Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectIndex = index;
                                  });
                                  cubit.getSearchedDoctor(
                                      specialityId: item.id,
                                      telehealth: widget.telehealth);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                    selectIndex == index
                                        ? AppColors.primaryColor
                                        : const Color(0xFFf6f0f8),
                                    border: Border.all(
                                      color: selectIndex == index
                                          ? Colors.transparent
                                          : AppColors.primaryColor,
                                    )
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.nameSpecialities ??
                                          'Loading',
                                      style: TextStyle(
                                          color: selectIndex == index
                                              ? AppColors.wColor
                                              : Theme.of(context).primaryColor,
                                          fontSize: 15.sp),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
