import 'dart:developer';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persona2/core/config/routes/app.dart';

import '../../logic/model/search_doctor_model.dart';

// ignore: must_be_immutable
class DoctorDetailsScreen extends StatefulWidget {
  DoctorDetailsScreen({
    super.key,
    required this.doctor,
    required this.telehealth,
  });

  final Doctors doctor;
  final String telehealth;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  List<String> parts = [];

  @override
  void initState() {
    context.read<HomeCubit>().getClincl(doctorId: widget.doctor.id!);
    super.initState();
  }

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
          leading: const CustomBackButton(),
          title: Text(
            AppLocalizations.of(context)!.translate(AppStrings.oneDoctor)!,
            style: const TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Card(
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(color: AppColors.primaryColor, width: 1.2.w),
                    borderRadius: BorderRadius.circular(
                        12.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MainImageNetwork(
                              image: widget.doctor.image ??
                                  'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                              height: 100.h,
                              width: 100.w,
                              shape: BoxShape.circle,
                            ),
                            SizedBox(width: 10.w),

///////////////////////////

                            Flexible(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.doctor.name ?? 'Loading',
                                          overflow: TextOverflow.ellipsis,
                                          textWidthBasis: TextWidthBasis.parent,
                                          softWrap: true,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          widget.doctor.information!.jobTitle ??
                                              '..',
                                          overflow: TextOverflow.ellipsis,
                                          textWidthBasis: TextWidthBasis.parent,
                                          softWrap: true,
                                          maxLines: 3,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            if (widget.doctor.doctorRatings!
                                                .isNotEmpty)
                                              for (int i = 0;
                                                  i <
                                                      widget
                                                          .doctor
                                                          .doctorRatings![0]
                                                          .rating!
                                                          .toInt();
                                                  i++)
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.sp,
                                                ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${AppLocalizations.of(context)!.translate(AppStrings.lE)!} ",
                                                style: TextStyle(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 16.sp),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${widget.telehealth == 'online' ? widget.doctor.onlinePrice : widget.doctor.oflinePrice} ${widget.telehealth == 'ofline' ? '' : '/${AppLocalizations.of(context)!.translate(AppStrings.hr)!}'}",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.grayApp),
                                              )
                                            ],
                                          ),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Row(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         Image.asset(AppImage.bool),
                            //         SizedBox(width: 5.w),
                            //         Text('87 %'),
                            //       ],
                            //     ),
                            //     SizedBox(width: 15.w),
                            //     Row(
                            //       children: [
                            //         Image.asset(AppImage.bool),
                            //         SizedBox(width: 5.w),
                            //         Text('87 %'),
                            //       ],
                            //     ),
                            //   ],
                            // ),
                            BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                var cubit = HomeCubit.get(context);
                                return SizedBox(
                                  width: 110.w,
                                  height: 40.h,
                                  child: MainButton(
                                    text: AppLocalizations.of(context)!
                                        .translate(AppStrings.bookNow)!,
                                    fontSizeText: 16.sp,
                                    onPressed: () {
                                      if (UserLocal.token == null) {
                                        context.to(AppRoutePath.loginScreen);
                                      } else {
                                        if (widget.telehealth == 'ofline') {
                                          log("the doctor id  is ${widget.doctor.id}");
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return BlocBuilder<HomeCubit,
                                                  HomeState>(
                                                builder: (context, state) {
                                                  var homeCu =
                                                      HomeCubit.get(context);
                                                  var clinicModel =
                                                      homeCu.cliniceModel;
                                                  return clinicModel == null
                                                      ? const Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : Dialog(
                                                          insetPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          100.h,
                                                                      horizontal:
                                                                          20.w),
                                                          backgroundColor:
                                                              AppColors.wColor,
                                                          child:
                                                              ListView.builder(
                                                            itemCount:
                                                                clinicModel
                                                                    .data!
                                                                    .length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: AppColors
                                                                      .color3
                                                                      .withOpacity(
                                                                          0.3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                margin:
                                                                    EdgeInsets
                                                                        .all(10
                                                                            .w),
                                                                child: ListTile(
                                                                  onTap: () {
                                                                    log("${clinicModel.data![i].id}");
                                                                    cubit
                                                                        .getDoctorDays(
                                                                      doctorId: widget
                                                                          .doctor
                                                                          .id!,
                                                                      schedules:
                                                                          widget
                                                                              .telehealth,
                                                                      clinicId: clinicModel
                                                                          .data![
                                                                              i]
                                                                          .id,
                                                                    );
                                                                    context.to(
                                                                        AppRoutePath
                                                                            .doctor3,
                                                                        arguments: {
                                                                          'doctor':
                                                                              widget.doctor,
                                                                          'telehealth':
                                                                              widget.telehealth,
                                                                          'clincId': clinicModel
                                                                              .data![i]
                                                                              .id
                                                                        });
                                                                  },
                                                                  title: Text(clinicModel
                                                                          .data![
                                                                              i]
                                                                          .nameAr ??
                                                                      '...'),
                                                                ),
                                                              );
                                                            },
                                                          ));
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          cubit.getDoctorDays(
                                              doctorId: widget.doctor.id!,
                                              schedules: widget.telehealth);
                                          context.to(AppRoutePath.doctor3,
                                              arguments: {
                                                'doctor': widget.doctor,
                                                'telehealth': widget.telehealth,
                                                'clincId': 1
                                              });
                                        }
                                      }
                                    },
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    var model = cubit.doctorDetailsModel;
                    if (model != null) {
                      parts = model.data!.information!.about!.split(' - ');
                    }

                    return model == null
                        ? const MainLoading()
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.translate(
                                      AppStrings.informationAboutTheExpert)!,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(15.w),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFDFDFD),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Column(
                                      children: [
                                        // Column(
                                        //   children: [
                                        //     for (int i = 0;
                                        //         i <
                                        //             model.data!.specialities!
                                        //                 .length;
                                        //         i++)
                                        //       Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.start,
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.center,
                                        //         children: [
                                        //           Image.asset(AppImage.bool),
                                        //           SizedBox(width: 10.w),
                                        //           Flexible(
                                        //               child: Text(
                                        //                   "${model.data!.specialities![i].nameSpecialities}")),
                                        //         ],
                                        //       ),
                                        //   ],
                                        // ),
                                        SizedBox(height: 5.h),
                                        for (String part in parts)
                                          Container(
                                            margin: EdgeInsets.all(5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                      AppImage.bool),
                                                ),
                                                SizedBox(width: 10.w),
                                                Flexible(child: Text("$part")),
                                              ],
                                            ),
                                          )
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.start,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     Padding(
                                        //       padding:
                                        //           EdgeInsets.only(top: 5.h),
                                        //       child: Image.asset(AppImage.bool),
                                        //     ),
                                        //     SizedBox(width: 10.w),
                                        //     //TODO//:

                                        //       Flexible(
                                        //         child: Text(
                                        //           "${model.data!.information!.about}",
                                        //         ),
                                        //       ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.translate(AppStrings.ratting)!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    var model = cubit.doctorDetailsModel;

                    return model == null
                        ? const MainLoading()
                        : Column(
                            children: [
                              for (int i = 0;
                                  i < model.data!.doctorRatings!.length;
                                  i++)
                                Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.primaryColor, width: 1.2.w), // Customize color and width
                                    borderRadius: BorderRadius.circular(12.r), // Customize the border radius
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model
                                                            .data!
                                                            .doctorRatings![i]
                                                            .name ??
                                                        '..',
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Text(
                                                    '${model.data!.doctorRatings![i].comment}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 40.h),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RatingBar(
                                              initialRating: 3,
                                              itemSize: 20.sp,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 5,
                                                ),
                                                half: const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 5,
                                                ),
                                                empty: const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 5,
                                                ),
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
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
