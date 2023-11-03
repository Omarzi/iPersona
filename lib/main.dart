import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/services.dart';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/core/config/routes/bloc_observer.dart';
import 'package:intl/intl.dart';
import 'package:intl_utils/intl_utils.dart';

// import 'package:flutter_restart/flutter_restart.dart';
// import 'package:android_alarm_manager/android_alarm_manager.dart';
void main() async {
  Intl.defaultLocale = 'en_US';
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await CacheHelper.initCacheHelper();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) => AuthCubit()..getProfile()),
        BlocProvider(
          create: (c) => HomeCubit()
            ..getHomeDate()
            ..getUserProfile(),
        ),
        BlocProvider(create: (c) => BookCubit()),
        BlocProvider(create: (c) => SettingCubit()),
        BlocProvider(create: (c) => SessionUserCubit()..getSessionUser()),
        BlocProvider(create: (c) => HospitalCubit()..searchHospital()),
      ],
      child: const Persona(),
    ),
  );

  await AndroidAlarmManager.periodic(
    const Duration(seconds: 1),
    0,
    _restartApp,
    wakeup: true,
    rescheduleOnReboot: true,
  );
}

Future<void> _restartApp() async {
  // await FlutterRestart.restartApp();
  SystemNavigator.pop();
}
