import 'package:persona2/core/component/class/main_web_view.dart';
import 'package:persona2/feature/home/presentation/screens/setting_screen.dart';
import 'package:persona2/feature/layout/session_user_profile.dart';

import 'app.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutePath.loginScreen:
        return MaterialPageRoute(
          builder: (c) => LoginScreen(),
        );
      case AppRoutePath.sessionUserScreen:
        return MaterialPageRoute(
          builder: (c) => SessionUserScreen(),
        );
      case AppRoutePath.registerScreen:
        return MaterialPageRoute(
          builder: (c) => RegisterScreen(),
        );
      case AppRoutePath.loyoutScreen:
        return MaterialPageRoute(
          builder: (c) => LayoutScreen(),
        );
      case AppRoutePath.settingScreen:
        return MaterialPageRoute(
          builder: (c) => SettingScreen(),
        );
      // case AppRoutePath.bookScreen2:
      //   return MaterialPageRoute(
      //     builder: (c) => BookScreen2(),
      //   );
      case AppRoutePath.onBoardingScreen:
        return MaterialPageRoute(
          builder: (c) => OnBoardingScreen(),
        );
      case AppRoutePath.mainWebView:
        final link = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (c) => MainWebViewPdf(link: link),
        );
      case AppRoutePath.homeScreen:
        return MaterialPageRoute(
          builder: (c) => HomeScreen(),
        );
      case AppRoutePath.sessionUserProfile:
        return MaterialPageRoute(
          builder: (c) => SessionUSerProfile(),
        );
      case AppRoutePath.doctorsScreen:
        final telehealth = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (c) => DoctorsScreen(telehealth: telehealth),
        );
      case AppRoutePath.doctorDetailsScreen:
        final map = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (c) => DoctorDetailsScreen(
            doctor: map['item'],
            telehealth: map['telehealth'],
          ),
        );
      case AppRoutePath.doctor3:
        final map = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (c) => Doctor3(
            doctor: map['doctor'],
            telehealth: map['telehealth'],
            clincId: map['clincId'],
          ),
        );
      case AppRoutePath.hospitalScreen:
        final map = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (c) => HospitalScreen(
            hospitalList: map['list'],
            cities: map['cities'],
          ),
        );
      case AppRoutePath.hospitalBooking:
        final item = routeSettings.arguments as OneHospitalInSearched;
        return MaterialPageRoute(
          builder: (c) => HospitalBooking(onHospital: item),
        );
      case AppRoutePath.profileScreen:
        return MaterialPageRoute(
          builder: (c) => ProfileScreen(),
        );
      case AppRoutePath.privacyPolicy:
        return MaterialPageRoute(
          builder: (c) => PrivacyPolicyScreen(),
        );
      case AppRoutePath.helpCenterScreen:
        return MaterialPageRoute(
          builder: (c) => HelpCenterScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (c) => const Scaffold(),
        );
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((c) =>   Scaffold(
            body: Center(
              child: Text(
                'NoRouteFound',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }
}
