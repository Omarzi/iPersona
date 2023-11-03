import 'package:persona2/core/config/routes/app.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          CacheHelper.saveData(key: MyCacheKey.token, value: state.token);
  context.read<HomeCubit>().getUserProfile();
          context.toAndRemoveAllScreen(AppRoutePath.loyoutScreen);
        } else if (state is RegisterError) {
          flutterToast(msg: 'Some Thing Error', color: Theme.of(context).primaryColor);
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return state is RegisterLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor))
            : MainButton(
                borderRadius: 12.r,
                text: AppLocalizations.of(context)!
                                  .translate(AppStrings.signIn)!,
                onPressed: () {
                  cubit.register(
                    email:
                        AppTextEditingControllers.registerEmailPasswordC.text,
                    name: AppTextEditingControllers.registerNamePasswordC.text,
                    password: AppTextEditingControllers
                        .registerPasswordPasswordC.text,
                    role: 'user',
                    residence: 'egyption',
                    phone: AppTextEditingControllers.phoneC.text
                  );
                },
              );
      },
    );
  }
}
