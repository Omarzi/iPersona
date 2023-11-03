import 'package:persona2/core/config/locale/app_localizations_setup.dart';
import 'package:persona2/core/config/routes/app.dart';

class Persona extends StatelessWidget {
  const Persona({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) {
        return BlocBuilder<SettingCubit, SettingState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Persona',
              // locale: Locale(UserLocal.lang == true ? 'ar' : 'en'),
              locale: Locale(UserLocal.lang == false ? 'en' : 'ar'),
              
               builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1,
                ),
                child: child!,
              );
            },
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  useMaterial3: true,
                  scaffoldBackgroundColor: const Color(0xFFeddef1),
                  primaryColor: AppColors.primaryColor,
                  cardColor: AppColors.wColor,
                  primarySwatch: Colors.blue,
                  textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                  ),
                  appBarTheme: const AppBarTheme(
                    elevation: 0,
                    backgroundColor: AppColors.noColor,
                  )),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: AppRoutePath.loyoutScreen,
            );
          },
        );
      },
    );
  }
}
