import '../../../../core/config/routes/app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.registerbgScffold,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 60.h),
          Text(
            AppLocalizations.of(context)!
                .translate(AppStrings.joinUstoStartSearching)!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.translate(AppStrings.youCan)!,
            style: TextStyle(
              fontSize: 15.sp,
              color: const Color(0xFF677294),
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSocialButton(image: AppImage.google, text: 'Google'),
                    CustomSocialButton(
                        image: AppImage.facebook, text: 'Facebook'),
                  ],
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    children: [
                      MainTextFormField(
                        height: 15.h,
                        hintText: AppLocalizations.of(context)!
                            .translate(AppStrings.name)!,
                        controller:
                            AppTextEditingControllers.registerNamePasswordC,
                        borderRadius: 10,
                        sizeBoxHight: 1.2,
                        hintColor: AppColors.color3,
                        textFormColor: AppColors.color3,
                        borderColor: AppColors.color3.withOpacity(0.2),
                      ),
                      SizedBox(height: 15.h),
                      MainTextFormField(
                        height: 15.h,
                        borderRadius: 10,
                        controller:
                            AppTextEditingControllers.registerEmailPasswordC,
                        hintText: AppLocalizations.of(context)!
                            .translate(AppStrings.email)!,
                        hintColor: AppColors.color3,
                        textFormColor: AppColors.color3,
                        borderColor: AppColors.color3.withOpacity(0.2),
                      ),
                      SizedBox(height: 15.h),
                      MainTextFormField(
                        height: 15.h,
                        borderRadius: 10,
                        controller: AppTextEditingControllers.phoneC,
                        hintText: AppLocalizations.of(context)!
                            .translate(AppStrings.phoneNumber)!,
                        hintColor: AppColors.color3,
                        textFormColor: AppColors.color3,
                        borderColor: AppColors.color3.withOpacity(0.2),
                      ),
                      SizedBox(height: 15.h),
                      MainTextFormField(
                        height: 15.h,
                        borderRadius: 10,
                        obscureText: showPassword,
                        controller:
                            AppTextEditingControllers.registerPasswordPasswordC,
                        hintText: AppLocalizations.of(context)!
                            .translate(AppStrings.password)!,
                        hintColor: AppColors.color3,
                        borderColor: AppColors.color3.withOpacity(0.2),
                        textFormColor: AppColors.color3,
                        primaryScheme: AppColors.color3,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(
                            showPassword == true
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            activeColor: Theme.of(context).primaryColor,
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                          Flexible(
                            child: Text(
                              AppLocalizations.of(context)!.translate(AppStrings
                                  .iAgreeWithTheTermsOfServicePrivacyPolicy)!,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 13.sp,
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.color3,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      const RegisterButton(),
                      SizedBox(height: 20.h),
                      TextButton(
                        onPressed: () {
                          context
                              .toAndRemoveAllScreen(AppRoutePath.loginScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                        .translate(AppStrings.haveAnAccountLogIn)!,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.toAndRemoveAllScreen(AppRoutePath.loyoutScreen);
                  },
                  child: Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.withoutLoggingOut)!,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
