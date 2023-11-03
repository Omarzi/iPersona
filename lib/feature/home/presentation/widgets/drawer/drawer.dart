import 'package:persona2/core/component/custom/custom_dialog.dart';
import 'package:persona2/core/config/routes/app.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF7980a7),
            Color(0xFFb280c7),
          ],
        ),
      ),
      child: Drawer(
        backgroundColor: AppColors.noColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DrawerTitle(),
                Flexible(
                  flex: 15,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: AppDrawerDetails.listDate(context).length,
                    itemBuilder: (context, index) {
                      var item = AppDrawerDetails.listDate(context)[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: index == 0
                              ? const Color(0xFF8c8cb2)
                              : AppColors.noColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: ListTile(
                          onTap: () {
                            if (item.onTap != null) {
                              item.onTap!(context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: Icon(
                            item.icon,
                            color: AppColors.wColor,
                            size: 25.sp,
                          ),
                          title: Text(
                            item.text,
                            style: TextStyle(
                              color: AppColors.wColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.wColor,
                            size: 20.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchSocial(
                          "https://www.facebook.com/iPersonaApp",
                          'https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en&gl=US',
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(9.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.wColor,
                        ),
                        child: Image.asset(
                          AppImage.facebook,
                          width: 40.w,
                          height: 30.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        _launchSocial(
                          "https://www.instagram.com/ipersona.me/",
                          'https://play.google.com/store/search?q=instagram&c=apps&hl=en&gl=US',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.wColor,
                        ),
                        child: Image.asset(
                          AppImage.instegram,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        _launchSocial(
                          "https://www.linkedin.com/company/ipersona/about/",
                          'https://play.google.com/store/search?q=linkedin&c=apps&hl=en&gl=US',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.wColor,
                        ),
                        child: Image.asset(
                          AppImage.linkedin,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        _launchSocial(
                          "https://www.tiktok.com/@ipersona.me",
                          'https://play.google.com/store/search?q=tiktok&c=apps&hl=en&gl=US',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.wColor),
                        child: Image.asset(
                          AppImage.tiktok,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        _launchSocial(
                          "https://twitter.com/ipersonaapp",
                          'https://play.google.com/store/search?q=twitter&c=apps&hl=en&gl=US',
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.wColor),
                        child: Image.asset(
                          AppImage.twitter,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                const ChangeLang(),
                UserLocal.token == null
                    ? const SizedBox.shrink()
                    : ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              title: AppLocalizations.of(context)!
                                  .translate(AppStrings.logOut)!,
                              subTitle: AppLocalizations.of(context)!
                                  .translate(AppStrings.areYou)!,
                              onTap: () {
                                context.toAndRemoveAllScreen(
                                    AppRoutePath.loginScreen);

                                CacheHelper.sharedPreferences.clear();
                              },
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        leading: const Icon(
                          Icons.logout,
                          color: AppColors.wColor,
                          size: 30,
                        ),
                        title: Text(
                          AppLocalizations.of(context)!
                              .translate(AppStrings.logOut)!,
                          style: TextStyle(
                            color: AppColors.wColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                SizedBox(height: 5.h)
              ],
            ),
          ),
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
