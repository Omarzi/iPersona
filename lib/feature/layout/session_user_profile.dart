import 'package:persona2/core/config/routes/app.dart';

class SessionUSerProfile extends StatelessWidget {
  const SessionUSerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title:  Text(
           AppLocalizations.of(context)!.translate(AppStrings.selectTime)!,
            style: TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: BlocBuilder<SessionUserCubit, SessionUserState>(
          builder: (context, state) {
            var sessionCubit = SessionUserCubit.get(context);
            var model = sessionCubit.sessionUserProfileModel;
            return model == null
                ? const MainLoading()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        MainImageNetwork(
                                          image: model.data!.image ??
                                              'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                                          height: 100.h,
                                          width: 90.w,
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              model.data!.name ?? "..",
                                              style:   TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20.sp),
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 220.w,
                                                  child: Text(
                                                    model.data!.information!
                                                            .clinic ??
                                                        "..",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:   TextStyle(
                                                      fontSize: 18.sp,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 220.w,
                                                  child: Text(
                                                    model.data!.information!
                                                            .jobTitle ??
                                                        '..',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 11.sp),
                                                  ),
                                                ),
                                                // Other widgets can go here
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    if (model
                                                        .data!
                                                        .doctorRatings!
                                                        .isNotEmpty)
                                                      for (int i = 0;
                                                          i <
                                                              model
                                                                  .data!
                                                                  .doctorRatings![
                                                                      0]
                                                                  .rating!
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
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(AppImage.bool),
                                                SizedBox(width: 5.w),
                                                Text('87 %'),
                                              ],
                                            ),
                                            SizedBox(width: 15.w),
                                            Row(
                                              children: [
                                                Image.asset(AppImage.bool),
                                                SizedBox(width: 5.w),
                                                Text('87 %'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(height: 10.h),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Text(
                                      "the Data  | ${model.schedule!.date ?? ''}"),
                                  Text(
                                      "the Data from | ${model.schedule!.from ?? ''} to ${model.schedule!.to ?? ''}"),
                                  Text(
                                      "The price is ${model.schedule!.sessionPrice ?? ''}"),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: Image.asset(AppImage.bool),
                                  ),
                                  SizedBox(width: 10.w),
                                  Flexible(
                                      child: Text(
                                          "${model.data!.information!.about}")),
                                ],
                              ),
                              SizedBox(height: 5.h),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
