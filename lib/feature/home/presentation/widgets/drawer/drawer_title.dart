import 'package:persona2/core/config/routes/app.dart';

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({Key? key});

  @override
  Widget build(BuildContext context) {
    return UserLocal.token == null
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: 305.w,
                    height: 60.h,
                    child: MainButton(
                      text: AppLocalizations.of(context)!
                          .translate(AppStrings.login)!,
                      fontSizeText: 18.sp,
                      onPressed: () => context.to(AppRoutePath.loginScreen),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: 20.h,
              bottom: 30.h,
            ),
            child: Flexible(
              flex: 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        var cubit = HomeCubit.get(context);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${AppLocalizations.of(context)!.translate(AppStrings.hi)!} ${cubit.userProfile == null ? '' : cubit.userProfile!.data!.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '📞 ${cubit.userProfile == null ? '' : cubit.userProfile!.data!.information!.phone ?? ''}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.wColor,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 40.w),
                    SizedBox(
                      height: 30.h,
                      width: 30.w,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 15.sp,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.wColor),
                          iconColor:
                              MaterialStateProperty.all(AppColors.wColor),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Colors.red,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
