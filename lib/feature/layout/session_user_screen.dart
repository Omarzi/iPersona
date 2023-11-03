import 'dart:developer';

import 'package:android_intent_plus/android_intent.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/config/routes/app.dart';

class SessionUserScreen extends StatelessWidget {
  const SessionUserScreen({super.key});

  String getDayOfWeek(String dateString, String format) {
    try {
      DateTime date = DateFormat(format).parse(dateString);
      return DateFormat('EEEE').format(date);
    } catch (e) {
      return 'Invalid date format. Please use $format.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return UserLocal.token == null
        ? Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 150.w,
                    child: MainButton(
                      text: AppLocalizations.of(context)!
                          .translate(AppStrings.login)!,
                      onPressed: () {
                        context.to(AppRoutePath.loginScreen);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors: [
            //       Colors.white,
            //       gredeantColor,
            //     ],
            //   ),
            // ),
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
              backgroundColor: AppColors.noColor,
              body: Column(
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.mysessions)!,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  BlocConsumer<SessionUserCubit, SessionUserState>(
                    listener: (context, state) {
                      if (state is GetSessionUserProfileSuccess) {
                        context.to(AppRoutePath.sessionUserProfile);
                      }
                    },
                    builder: (context, state) {
                      var cubit = SessionUserCubit.get(context);
                      var model = cubit.sessionUserModel;
                      return model == null
                          ? const MainLoading()
                          : Flexible(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                itemCount: model.data!.length,
                                itemBuilder: (context, index) {
                                  var doctorItem = model.data![index];
                                  String dayOfWeek = getDayOfWeek(
                                      doctorItem.from ?? '', 'dd-MM-yyyy');
                                  log(doctorItem.from ?? '...');

                                  return InkWell(
                                    onTap: () {
                                      cubit.getSeesionUserProfile(
                                          doctorId: doctorItem.doctor!.id!);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                        vertical: 10.h,
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.h),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                          border: Border.all(
                                            color: AppColors.primaryColor,
                                            width: 1.2.w,
                                          )),
                                      child: Column(
                                        children: [
                                          Text(
                                            "${UserLocal.lang == true ? doctorItem.doctor == null ? 'Loading' : doctorItem.doctor!.nameAr : doctorItem.doctor == null ? 'Loading' : doctorItem.doctor!.name}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.sp,
                                            ),
                                          ),
                                          SizedBox(height: 15.h),
                                          TextButton(
                                            onPressed: () {
                                              // context.to(
                                              //     AppRoutePath.mainWebView,
                                              //     arguments:
                                              //         doctorItem.startUrl);

                                              //us.zoom.videomeetings

                                              // LaunchApp.openApp(
                                              //   androidPackageName: 'us.zoom.videomeetings',
                                              //   openStore: true,
                                              // );
                                              // print(doctorItem.startUrl);
                                              // final Uri _url = Uri.parse(doctorItem.startUrl ?? '');
                                              // launchInBrowser(_url );

                                              // openApp('https://play.google.com/store/apps/details?id=us.zoom.videomeetings');

                                              //https://play.google.com/store/apps/details?id=com.facebook.katana
                                              //https://www.facebook.com/ahmed.afroto.71868

                                              // _launchSocial('fb://page/109225061600006', 'https://www.facebook.com/IAMZenju');
                                              // _launchSocial(
                                              //     'https://www.facebook.com/ahmed.afroto.71868',
                                              //     'https://play.google.com/store/apps/details?id=com.facebook.katana');
                                              // _launchSocial('${doctorItem.startUrl}', 'https://play.google.com/store/apps/details?id=us.zoom.videomeetings');
                                              _launchSocial(
                                                  'https://us05web.zoom.us/j/88417798891?pwd=uBuzi045WdT4Oa3SH51xC0MVIlqQz3.1',
                                                  'https://play.google.com/store/apps/details?id=us.zoom.videomeetings');
                                            },
                                            child: Text(
                                              // "Link",
                                              AppLocalizations.of(context)!
                                                  .translate("link")!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.sp,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 15.h),
                                          Text(
                                            doctorItem.schedule!.date ==
                                                    'wednesday'
                                                ? AppLocalizations.of(context)!
                                                .translate("الأربعاء")!
                                                : doctorItem.schedule!.date ==
                                                'monday' ? AppLocalizations.of(context)!
                                                .translate("الأثنين")! : doctorItem.schedule!.date ==
                                                'tuesday' ? AppLocalizations.of(context)!
                                                .translate("الثلاثاء")! : doctorItem.schedule!.date ==
                                                'thursday' ? AppLocalizations.of(context)!
                                                .translate("الخميس")! : doctorItem.schedule!.date ==
                                                'friday' ? AppLocalizations.of(context)!
                                              .translate("الجمعة")! : doctorItem.schedule!.date ==
                                                'saturday' ? AppLocalizations.of(context)!
                                        .translate("السبت")! : doctorItem.schedule!.date ==
                                                'sunday' ? AppLocalizations.of(context)!
                                      .translate("الأحد")! : '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                            ),
                                          ),
                                          // Text(
                                          //   doctorItem.from ?? '',
                                          //   style: const TextStyle(
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                    },
                  )
                ],
              ),
            ),
          );
  }

  void _launchSocial(String url, String fallbackUrl) async {
    try {
      final Uri uri = Uri.parse(url);
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      final Uri fallbackUri = Uri.parse(fallbackUrl);
      await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
    }
  }
}
