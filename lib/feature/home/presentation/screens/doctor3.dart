import 'package:persona2/core/component/custom/custom_dialog_for_online_booking.dart';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/book_doctor_model.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

// ignore: must_be_immutable
class Doctor3 extends StatelessWidget {
  Doctor3(
      {super.key,
      required this.doctor,
      required this.telehealth,
      required this.clincId});
  final Doctors doctor;
  final String telehealth;
  final int clincId;
  DateTime now = DateTime.now();

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: Text(
            AppLocalizations.of(context)!.translate(AppStrings.selectTime)!,
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
                DoctorCardInformation(doctor: doctor),
                DoctorDaysWidget(
                  doctor: doctor,
                  telehealth: telehealth,
                  clincId: clincId,
                ),
                Text(
                  AppLocalizations.of(context)!
                      .translate(AppStrings.availableTime)!,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(height: 50.h),
                TimeWidget(),
                BlocConsumer<BookCubit, BookState>(
                  listener: (context, state) {
                    var cubit = BookCubit.get(context);
                    if (state is BookDoctorOflineSuccess) {
                      flutterToast(
                          msg: "تم الحجز بنجاح ",
                          color: Theme.of(context).primaryColor);
                      context.toAndRemoveAllScreen(AppRoutePath.loyoutScreen);
                    } else if (state is BookDoctorOnlineSuccess) {
                      var model = cubit.bookDoctorModel;
                      List<BookDoctorOnlineDate>? bookDoctorOnlineDate =
                          model!.data;
                      // customBottomSheet(context,
                      //     widget: CustomDialogForBookOnline(
                      //       bookDoctorOnlineDate: bookDoctorOnlineDate!,
                      //       selectTimeFrom:
                      //           context.read<BookCubit>().selectTimeFrom ?? '',
                      //       selectTimeId:
                      //           context.read<BookCubit>().selectTimeId ?? 0,
                      //     ));
                      showModalBottomSheet(
                        isScrollControlled: true,
                        // showDragHandle: true,
                        // useSafeArea: true,
                        // isDismissible: true,
                        // enableDrag: true,
                        // useRootNavigator: true,
                        context: context,
                        backgroundColor: AppColors.noColor,
                        builder: (context) {
                          return Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child:
                           CustomDialogForBookOnline(
                                bookDoctorOnlineDate: bookDoctorOnlineDate!,
                                selectTimeFrom:
                                    context.read<BookCubit>().selectTimeFrom ??
                                        '',
                                selectTimeId:
                                    context.read<BookCubit>().selectTimeId ?? 0,
                              )
                          );

                          // Padding(
                          //   padding: EdgeInsets.only(top: 50.h),
                          //   child: Padding(
                          //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          //     child: CustomDialogForBookOnline(
                          //       bookDoctorOnlineDate: bookDoctorOnlineDate!,
                          //       selectTimeFrom:
                          //           context.read<BookCubit>().selectTimeFrom ??
                          //               '',
                          //       selectTimeId:
                          //           context.read<BookCubit>().selectTimeId ?? 0,
                          //     )
                          //   )
                          // );
                          // Padding(
                          //   padding: MediaQuery.of(context).viewInsets,
                          //   child: CustomDialogForBookOnline(
                          //     bookDoctorOnlineDate: bookDoctorOnlineDate!,
                          //     selectTimeFrom:
                          //         context.read<BookCubit>().selectTimeFrom ??
                          //             '',
                          //     selectTimeId:
                          //         context.read<BookCubit>().selectTimeId ?? 0,
                          //   ),
                          // );
                        },
                      );
                    } else if (state is BookDoctorError) {
                      flutterToast(
                          msg: AppLocalizations.of(context)!
                              .translate(AppStrings.pleaseChoosseTime)!,
                          color: Theme.of(context).primaryColor);
                    }
                  },
                  builder: (context, state) {
                    var cubit = BookCubit.get(context);
                    return state is BookDoctorLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : MainButton(
                            paddingHorizontal: 1,
                            text: state is BookDoctorLoading
                                ? '↻'
                                : AppLocalizations.of(context)!
                                    .translate(AppStrings.confirm)!,
                            onPressed: () {
                              cubit.bookDoctor(
                                scheduleId:
                                    context.read<BookCubit>().selectTimeId ?? 0,
                                timeFrom:
                                    context.read<BookCubit>().selectTimeFrom ??
                                        '',
                                lang: UserLocal.lang == true ? 'ar' : 'en',
                              );
                            },
                          );
                  },
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
