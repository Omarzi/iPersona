import 'package:persona2/core/config/routes/app.dart';

class EndPoint {
  static const String baseUrl = "https://anascosmetics.shop/";
  // static const String baseUrl = "https://ipersona.me/";

  static const String login = "api/ipersona/auth/login";
  static const String profile = "api/ipersona/auth/me";
  static const String register = "api/ipersona/auth/register";
  static String home = "api?lang=${UserLocal.lang == true ? 'ar' : 'en'}";
  static String searchDoctors(
          {String? name,
          int? cityId,
          int? specialityId,
          int? areaId,
          required String telehealth}) =>
      "api/doctor/search?lang=${UserLocal.lang == true ? 'ar' : 'en'}&name=$name&city_id=$cityId&speciality_id=$specialityId&area_id=$areaId&telehealth=$telehealth";
  static String profileDoctor({required int doctorId}) =>
      "api/doctor/profile/$doctorId";
  static String getDoctorDays(
          {required int doctorId, required String schedules, int? clinicId}) =>
      "api/doctor/schedules/$doctorId?schedules=$schedules&lang=${UserLocal.lang == true ? 'ar' : 'en'}&clinic_id=$clinicId";
  static String getDoctoTime(
          {required int doctorId,
          required String schedules,
          required String day, int? clinicId}) =>
      "api/doctor/schedules/time/$doctorId?schedules=$schedules&lang=${UserLocal.lang == true ? 'ar' : 'en'}&date=$day&clinic_id=$clinicId";
  static const String bookDoctorEndPoint = 'api/appointments';
  static const String paymentEndPoint = 'api/credits';
  static String searchHospitalEndPoint({String cityId = '0'}) =>
      "api/hospital/search?lang=${UserLocal.lang == true ? 'ar' : 'en'}&city_id=$cityId";
  static String getHospitalDetails({required int hospitalId}) =>
      "api/booking/hospital/details/$hospitalId?lang=${UserLocal.lang == true ? 'ar' : 'en'}";
  static const String bookhospital = "api/hospital/appointment";
  static String sessionUser =
      "api/sessions/user?lang=${UserLocal.lang == true ? 'ar' : 'en'}";
  static String sessionUserProfile({required int doctorId}) =>
      "api/user/appointments/show/$doctorId?lang=${UserLocal.lang == true ? 'ar' : 'en'}";
  static const String getUserProfile = "api/ipersona/auth/me";
  //https://anascosmetics.shop/api/doctor/clinics/37?lang=ar
  static  String getClinceEndPoint ({required int doctorId})=> "api/doctor/clinics/$doctorId?lang=${UserLocal.lang == true ? 'ar' : 'en'}";

}
