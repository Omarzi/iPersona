import 'package:persona2/core/config/routes/app.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.read<HomeCubit>().getUserProfile();
          context.toAndRemoveAllScreen(AppRoutePath.loyoutScreen);

          CacheHelper.saveData(key: MyCacheKey.token, value: state.token);
        } else if (state is LoginError) {
          flutterToast(msg: 'Some Thing Error', color: Theme.of(context).primaryColor);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return state is LoginLoading
            ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))
            : Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: MainButton(
                  text: AppLocalizations.of(context)!
                                    .translate(AppStrings.login)!,
                  fontSizeText: 20.sp,
                  borderRadius: 18.r,
                  onPressed: () {
                    cubit.login(
                      email: AppTextEditingControllers.loginEmailC.text,
                      password: AppTextEditingControllers.loginPasswordC.text,
                    );
                  },
                ),
            );
      },
    );
  }
}
