import 'package:flutter/services.dart';
import 'package:persona2/core/component/custom/custom_dialog.dart';
import 'package:persona2/core/component/extension/pop_ups.dart';
import '../../../../../../core/config/routes/app.dart';

class ChangeLang extends StatelessWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        SettingCubit cubit = SettingCubit.get(context);
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 2.h,
          ),
          child: Column(
            children: [
              Divider(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.language)!,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.wColor,
                          fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                        ),
                  ),
                  InkWell(
                    onTap: () {
                      context.customShowDialog(
                        MainAlertDialog(
                          title: AppLocalizations.of(context)!
                              .translate(AppStrings.changeLanguage)!,
                          actions: [
                            const Divider(),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                          title:
                                              "${AppLocalizations.of(context)!.translate(AppStrings.restartApp)!} ",
                                          subTitle:
                                              "${AppLocalizations.of(context)!.translate(AppStrings.areYouSureYouWantToRestartApplication)!} ",
                                          onTap: () {
                                            cubit.changeLangToArabic();

                                            SystemNavigator.pop();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate(AppStrings.arabic)!,
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontSize: 30.sp,
                                              color: UserLocal.lang == null
                                                  ? AppColors.primaryColor
                                                  : CacheHelper.getData(
                                                              key: MyCacheKey
                                                                  .lang) ==
                                                          false //  'en'
                                                      ? AppColors
                                                          .onBoardingSubTitleColor
                                                      : Theme.of(context)
                                                          .primaryColor),
                                    ),
                                  ),
                                  const Divider(),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomDialog(
                                          title:
                                              "${AppLocalizations.of(context)!.translate(AppStrings.restartApp)!} ",
                                          subTitle:
                                              "${AppLocalizations.of(context)!.translate(AppStrings.areYouSureYouWantToRestartApplication)!} ",
                                          onTap: () {
                                            cubit.changeLangToEnglish();

                                            SystemNavigator.pop();
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .translate(AppStrings.english)!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                            fontSize: 30.sp,
                                            color: UserLocal.lang == null
                                                ? AppColors
                                                    .onBoardingSubTitleColor
                                                : CacheHelper.getData(
                                                            key: MyCacheKey
                                                                .lang) ==
                                                        false
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : AppColors
                                                        .onBoardingSubTitleColor,
                                          ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          UserLocal.lang == null
                              ? AppLocalizations.of(context)!
                                  .translate(AppStrings.arabic)!
                              : UserLocal.lang == false
                                  ? AppLocalizations.of(context)!
                                      .translate(AppStrings.english)!
                                  : AppLocalizations.of(context)!
                                      .translate(AppStrings.arabic)!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 18.sp,
                                color: AppColors.wColor,
                              ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.wColor,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(height: 50.h),
            ],
          ),
        );
      },
    );
  }
}
