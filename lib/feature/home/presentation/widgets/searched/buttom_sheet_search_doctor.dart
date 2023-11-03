import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

class ButtomSheetSearchDoctor extends StatefulWidget {
  ButtomSheetSearchDoctor({super.key, required this.telehealth});
  final String telehealth;
  @override
  State<ButtomSheetSearchDoctor> createState() =>
      _ButtomSheetSearchDoctorState();
}

class _ButtomSheetSearchDoctorState extends State<ButtomSheetSearchDoctor> {
  Specialities? specialitiesValue;
  Cities? citiesValue;
  SelectedAreas? selectedAreasValue;
  TextEditingController nameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var model = cubit.searchDoctorModel;
        return model == null
            ? const MainLoading()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.name)!,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      MainTextFormField(
                        hintText: AppLocalizations.of(context)!
                            .translate(AppStrings.name)!,
                        borderColor: Colors.grey,
                        controller: nameC,
                        textFormColor: AppColors.blackColor,
                        borderRadius: 10,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.selectspecialty)!,
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        width: double.infinity,
                        child: PopupMenuButton<Specialities>(
                          onSelected: (value) {
                            setState(() {
                              specialitiesValue = value;
                            });
                          },
                          itemBuilder: (context) {
                            return model.data!.specialities!.map((item) {
                              return PopupMenuItem<Specialities>(
                                value: item,
                                child: Text(item.nameSpecialities ?? "Loading"),
                              );
                            }).toList();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(specialitiesValue == null
                                ? AppLocalizations.of(context)!
                                    .translate(AppStrings.chooses)!
                                : specialitiesValue!.nameSpecialities ??
                                    'Loading'),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.selectCity)!,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),

                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        width: double.infinity,
                        child: PopupMenuButton<Cities>(
                          onSelected: (value) {
                            setState(() {
                              citiesValue = value;
                              cubit.getSearchedDoctor(
                                  cityId: citiesValue!.id!,
                                  telehealth: widget.telehealth);
                            });
                          },
                          itemBuilder: (context) {
                            return model.data!.cities!.map((item) {
                              return PopupMenuItem<Cities>(
                                value: item,
                                child: Text(item.nameCity ?? "Loading"),
                              );
                            }).toList();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(citiesValue == null
                                ? AppLocalizations.of(context)!
                                    .translate(AppStrings.chooses)!
                                : citiesValue!.nameCity ?? 'Loading'),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        AppLocalizations.of(context)!
                            .translate(AppStrings.selectTheRegion)!,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          // vertical: 20.h,
                        ),
                        width: double.infinity,
                        child: PopupMenuButton<SelectedAreas>(
                          onSelected: (value) {
                            setState(() {
                              selectedAreasValue = value;
                            });
                          },
                          itemBuilder: (context) {
                            return model.data!.selectedAreas!.map((item) {
                              return PopupMenuItem<SelectedAreas>(
                                value: item,
                                child: Text(item.nameAreas ?? "Loading"),
                              );
                            }).toList();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Text(selectedAreasValue == null
                                ? AppLocalizations.of(context)!
                                    .translate(AppStrings.chooses)!
                                : selectedAreasValue!.nameAreas ?? 'Loading'),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      MainButton(
                        text: AppLocalizations.of(context)!
                            .translate(AppStrings.search)!,
                        onPressed: () {
                          cubit.getSearchedDoctor(
                            telehealth: widget.telehealth,
                            name: nameC.text.isEmpty ? null : nameC.text,
                            cityId:
                                citiesValue == null ? null : citiesValue!.id,
                            specialityId: specialitiesValue == null
                                ? null
                                : specialitiesValue!.id,
                            areaId: selectedAreasValue == null
                                ? null
                                : selectedAreasValue!.id,
                          );
                          context.back();
                        },
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}
