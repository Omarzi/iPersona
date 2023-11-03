import 'package:persona2/core/config/routes/app.dart';

class HomeDoctorWidget extends StatelessWidget {
  HomeDoctorWidget({
    Key? key,
    required this.doctorlist,
    required this.titleSction,
    this.seeAllFuction,
  }) : super(key: key);

  final List<DoctorModelDate> doctorlist;
  final String titleSction;
  final VoidCallback? seeAllFuction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    titleSction,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: seeAllFuction,
                  child: Text(
                    "${AppLocalizations.of(context)!.translate(AppStrings.seeAll)!} >",
                    style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 280.h,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctorlist.length,
                  itemBuilder: (context, index) {
                    DoctorModelDate item = doctorlist[index];
                    return SizedBox(
                      width: 250.w,
                      child: Card(
                        elevation: 10,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: MainImageNetwork(
                                  image: item.image ??
                                      'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                                  width: 200.w,
                                  height: 150.h,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                item.name ?? 'Loading',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text(
                                  item.information!.jobTitle ?? 'Loading',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable
class HospitalWidget extends StatelessWidget {
  HospitalWidget(
      {super.key,
      required this.doctorlist,
      required this.titleSction,
      this.seeAllFuction,
      this.oneCardFuction});
  List<OneHospitalInSearched> doctorlist;
  final String titleSction;
  VoidCallback? seeAllFuction;
  VoidCallback? oneCardFuction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleSction,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: seeAllFuction,
              child: Text(
                'See all >',
                style: TextStyle(color: Colors.grey, fontSize: 16.sp),
              ),
            ),
          ],
        ),
        BlocBuilder<HospitalCubit, HospitalState>(
          builder: (context, state) {
            var cubit = HospitalCubit.get(context);

            return SizedBox(
              height: 280.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: doctorlist.length,
                itemBuilder: (context, index) {
                  var item = doctorlist[index];
                  return SizedBox(
                    width: 250.w,
                    child: InkWell(
                      onTap: () {
                        cubit.getHospitalDetails(hospitalId: item.id!);
                      },
                      child: Card(
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 10.h),
                          child: Column(
                            children: [
                              MainImageNetwork(
                                image: item.image ??
                                    'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                                width: 200,
                                height: 150,
                              ),
                              SizedBox(height: 15.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  item.name ?? 'Loading',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Text(item.information!.jobTitle ?? 'Loading'),
                              // Row(
                              //   children: [
                              //     if(item.doctorRatings!.isNotEmpty)
                              //     for (int i = 0; i < item.doctorRatings![0].rating!.toInt(); i++)
                              //       const Icon(
                              //         Icons.star,
                              //         color: Colors.amber,
                              //       ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}

class HomeDoctorWidgetNew extends StatelessWidget {
  const HomeDoctorWidgetNew({
    super.key,
    required this.icon,
    required this.onPress,
    required this.subTitle,
    required this.title,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.h),
      decoration: BoxDecoration(
        color: AppColors.wColor,
        border: Border.all(color: AppColors.grayApp.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 45.sp,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 100.w,
            child: MainButton(
              text:
                  AppLocalizations.of(context)!.translate(AppStrings.bookNow)!, 
              onPressed: onPress,
              fontSizeText: 14.sp,
              borderRadius: 30.r,
              paddingVertical: 0.05.h,
            ),
          )
        ],
      ),
    );
  }
}
