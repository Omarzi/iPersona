import 'package:flutter/cupertino.dart';
import 'package:persona2/core/config/routes/app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;

  @override
  void dispose() {
    AppTextEditingControllers.loginPasswordC.clear();
    AppTextEditingControllers.loginEmailC.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LoginBg(),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.noColor,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 400.h),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          gradient: const LinearGradient(
                            begin: Alignment(-1, 0),
                            end: Alignment(1, 0),
                            colors: [
                              Color(0xFF6F427D),
                              Color(0xFFBA80CC),
                            ],
                          ),
                        ),
                        child: Center(
                          child: MainTextFormField(
                            fillColor: AppColors.noColor,
                            hintText: AppLocalizations.of(context)!
                                .translate(AppStrings.userName)!,
                            controller: AppTextEditingControllers.loginEmailC,
                            hintColor: AppColors.wColor,
                            keyboardType: TextInputType.text,
                            prefixIcon: const Icon(
                                CupertinoIcons.person_alt_circle_fill),
                            sizeBoxHight: 0.1,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          gradient: const LinearGradient(
                            begin: Alignment(-1, 0),
                            end: Alignment(1, 0),
                            colors: [
                              Color(0xFF6F427D),
                              Color(0xFFBA80CC),
                            ],
                          ),
                        ),
                        child: Center(
                          child: MainTextFormField(
                              fillColor: AppColors.noColor,
                              hintText: AppLocalizations.of(context)!
                                  .translate(AppStrings.password)!,
                              controller:
                                  AppTextEditingControllers.loginPasswordC,
                              keyboardType: TextInputType.visiblePassword,
                              hintColor: AppColors.wColor,
                              prefixIcon:
                                  const Icon(CupertinoIcons.lock_circle),
                              sizeBoxHight: 20,
                              obscureText: isObscureText,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                icon: Icon(isObscureText == false
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      const LoginButton(),
                      SizedBox(height: 35.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.toAndRemoveAllScreen(
                                  AppRoutePath.registerScreen);
                            },
                            child: Text(AppLocalizations.of(context)!
                                .translate(AppStrings.signIn)!, style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                            )),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .toAndRemoveAllScreen(AppRoutePath.loyoutScreen);
                        },
                        child: Text(
                          AppLocalizations.of(context)!
                              .translate(AppStrings.withoutLoggingOut)!,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
