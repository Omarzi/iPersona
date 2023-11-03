import 'package:persona2/core/config/routes/app.dart';

class AppDrawerDetails {
  String text;
  IconData icon;
  void Function(BuildContext context)? onTap;
  AppDrawerDetails({
    required this.text,
    required this.icon,
    this.onTap,
  });

  static List<AppDrawerDetails> listDate(BuildContext context) => [
        AppDrawerDetails(
          text: AppLocalizations.of(context)!.translate(AppStrings.myDoctors)!,
          // text: '',
          icon: Icons.person,
          onTap: (context) {},
        ),
        AppDrawerDetails(
          text: AppLocalizations.of(context)!.translate(AppStrings.myProfile)!,
          icon: Icons.person,
          onTap: (context) {
            if (UserLocal.token == null) {
              flutterToast(
                  msg: "Please Login First",
                  color: Theme.of(context).primaryColor);
            } else {
              context.to(AppRoutePath.profileScreen);
            }
          },
        ),
        AppDrawerDetails(
          text: AppLocalizations.of(context)!.translate(AppStrings.mysessions)!,
          icon: Icons.calendar_month,
          onTap: (context) {
            context.to(AppRoutePath.sessionUserScreen);
          },
        ),
        AppDrawerDetails(
          text: AppLocalizations.of(context)!
              .translate(AppStrings.privacyPolicy)!,
          icon: Icons.privacy_tip_sharp,
          onTap: (context) => context.to(AppRoutePath.privacyPolicy),
        ),
        AppDrawerDetails(
          text: AppLocalizations.of(context)!.translate(AppStrings.helpCenter)!,
          icon: Icons.help_center_rounded,
          onTap: (context) => context.to(AppRoutePath.helpCenterScreen),
        ),
        // AppDrawerDetails(
        //   text: AppLocalizations.of(context)!.translate(AppStrings.settings)!,
        //   icon: Icons.settings,
        //   onTap: (context) => context.to(AppRoutePath.settingScreen),
        // ),
      ];
}
