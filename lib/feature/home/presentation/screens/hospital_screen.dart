import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/hospital/hospital_cubit.dart';
import 'package:persona2/feature/home/logic/model/search_hospital_model.dart';

// ignore: must_be_immutable
class HospitalScreen extends StatefulWidget {
  HospitalScreen({super.key, required this.hospitalList, required this.cities});
  List<OneHospitalInSearched> hospitalList;
  List<HospitalCities> cities;

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  HospitalCities? citiesValue;
  @override
  Widget build(BuildContext context) {
    return Container(decoration:  BoxDecoration(
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
          leading: const CustomBackButton(),
          title:  Text(
            AppLocalizations.of(context)!.translate(AppStrings.selectTime)!,
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              MainTextFormField(
                hintText: AppLocalizations.of(context)!.translate(AppStrings.search)!,
                fillColor: AppColors.wColor,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.cancel),
                readOnly: true,
                borderRadius: 12,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocBuilder<HospitalCubit, HospitalState>(
                        builder: (context, state) {
                          var cubit = HospitalCubit.get(context);
                          var model = cubit.searchedHospitalModel;
                          return model == null
                              ? const MainLoading()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 10.h),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                          Text(
                                          "Select City",
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10.h), //01224324114
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .primaryColorLight),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                          ),
                                          width: double.infinity,
                                          child: PopupMenuButton<HospitalCities>(
                                            onSelected: (value) {
                                              setState(() {
                                                citiesValue = value;
                                              });
                                            },
                                            itemBuilder: (context) {
                                              return model.cities!.map((item) {
                                                return PopupMenuItem<
                                                    HospitalCities>(
                                                  value: item,
                                                  child: Text(
                                                      "${UserLocal.lang == true ? "${item.nameAr}" : "${item.nameEn}"}" ??
                                                          "Loading"),
                                                );
                                              }).toList();
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20.h),
                                              child: Text(citiesValue == null
                                                  ? 'Chooses'
                                                  : "${UserLocal.lang == true ? "${citiesValue!.nameAr}" : "${citiesValue!.nameEn}"}" ??
                                                      'Loading'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
    
                                        MainButton(
                                          text: AppLocalizations.of(context)!.translate(AppStrings.search)!,
                                          onPressed: () {
                                            if (citiesValue != null) {
                                              cubit.searchHospital(
                                                  cityId: citiesValue!.id.toString());
                                            } else {
                                              flutterToast(
                                                  msg: 'Plese Choose City',
                                                  color: Theme.of(context)
                                                      .primaryColor);
                                            }
                                            context.back();
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
    
                          ;
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primaryColor,
                  ),
                  child: Text('All'),
                ),
              ),
              SizedBox(height: 15.h),
              BlocBuilder<HospitalCubit, HospitalState>(
                builder: (context, state) {
                  var cubit = HospitalCubit.get(context);
                  var model = cubit.searchedHospitalModel;
                  return model == null
                      ? const MainLoading()
                      : Flexible(
                          child: ListView.builder(
                            itemCount: model.data!.length,
                            itemBuilder: (context, index) {
                              OneHospitalInSearched item = model.data![index];
                              return Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppImage.hospital2,
                                          height: 100.h,
                                          width: 80.w,
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200.w,
                                              child: Text(
                                                item.name ?? 'Loading',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20.sp),
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Text('Specialist Cardiologist'),
                                            SizedBox(height: 10.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('7 Years experience'),
                                                SizedBox(width: 10.w),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '2.8',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                          text: '[2821 views]')
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '\$',
                                                style: TextStyle(
                                                    color: AppColors.primaryColor,
                                                    fontSize: 20.sp),
                                              ),
                                              TextSpan(
                                                text: "${item.myPrice ?? 0}",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grayApp),
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        BlocBuilder<HospitalCubit, HospitalState>(
                                          builder: (context, state) {
                                            var cubit =
                                                HospitalCubit.get(context);
                                            return SizedBox(
                                              width: 140.w,
                                              height: 50.h,
                                              child: MainButton(
                                                text:AppLocalizations.of(context)!.translate(AppStrings.bookNow)!,
                                                onPressed: () {
                                                  cubit.getHospitalDetails(
                                                      hospitalId: item.id!);
    
                                                  context.to(
                                                      AppRoutePath
                                                          .hospitalBooking,
                                                      arguments: item);
                                                },
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),);
                            },
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
