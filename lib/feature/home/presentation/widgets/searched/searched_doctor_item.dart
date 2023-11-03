import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

class SearchedDoctorItem extends StatelessWidget {
  const SearchedDoctorItem({
    super.key,
    required this.item,
    required this.telehealth,
  });
  final Doctors item;
  final String telehealth;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 1.2.w), // Customize color and width
        borderRadius: BorderRadius.circular(12.r), // Customize the border radius
      ),
      child: Padding(
        padding:  EdgeInsets.all(12.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MainImageNetwork(
                  image: item.image ??
                      'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                  height: 100.h,
                  width: 90.w,
                  shape: BoxShape.circle,
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? 'Loading',
                              overflow: TextOverflow.ellipsis,
                              textWidthBasis: TextWidthBasis.parent,
                              softWrap: true,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              item.information?.jobTitle ?? "Loading",
                              // AppLocalizations.of(context)!
                              //     .translate(AppStrings.yearsExperience)!,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 12.sp,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                if (item.doctorRatings!.isNotEmpty)
                                  for (int i = 0;
                                      i <
                                          item.doctorRatings![0].rating!
                                              .toInt();
                                      i++)
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "${AppLocalizations.of(context)!.translate(AppStrings.lE)!} ",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 20.sp),
                      ),
                      TextSpan(
                        text:
                            "${telehealth == 'online' ? item.onlinePrice : item.oflinePrice} ${telehealth == 'ofline' ? '' : '/${AppLocalizations.of(context)!.translate(AppStrings.hr)!}'}",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.grayApp),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 110.w,
                  height: 50.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      var cubit = HomeCubit.get(context);
                      return MainButton(
                        text: AppLocalizations.of(context)!
                            .translate(AppStrings.bookNow)!,
                        onPressed: () {
                          cubit.getProfileDoctor(doctorId: item.id!);
                          context.to(
                            AppRoutePath.doctorDetailsScreen,
                            arguments: {
                              'item': item,
                              'telehealth': telehealth,
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
