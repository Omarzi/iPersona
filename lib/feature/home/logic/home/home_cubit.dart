import 'dart:developer';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/clinice_model.dart';
import 'package:persona2/feature/home/logic/model/doctor_days_model.dart';
import 'package:persona2/feature/home/logic/model/doctor_details_model.dart';
import 'package:persona2/feature/home/logic/model/doctor_time_model.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';
import 'package:persona2/feature/home/logic/model/user_profile_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  DoctorModel? doctorModel;
  int currentIndexDayes = 0;

  void getHomeDate() {
    emit(GetHomeDataLoading());
    dioHelper
        .getData(
      endPoint: EndPoint.home,
    )
        .then((value) {
      doctorModel = DoctorModel.fromJson(value.data);
      emit(GetHomeDataSuccess());
    }).catchError((e) {
      log("getHomeDate the error : ${e}");
      emit(GetHomeDataError());
    });
  }

  SearchDoctorModel? searchDoctorModel;
  void getSearchedDoctor({
    String? name,
    int? cityId,
    int? specialityId,
    int? areaId,
    required String telehealth,
  }) {
    emit(GetSearchedDoctorsLoading());
    dioHelper
        .getData(
            endPoint: EndPoint.searchDoctors(
      areaId: areaId,
      cityId: cityId,
      name: name,
      specialityId: specialityId,
      telehealth: telehealth,
    ))
        .then((value) {
      searchDoctorModel = SearchDoctorModel.fromJson(value.data);
      emit(GetSearchedDoctorsSuccess());
    }).catchError((e) {
      emit(GetSearchedDoctorsError());
    });
  }

  DoctorDetailsModel? doctorDetailsModel;
  void getProfileDoctor({required int doctorId}) {
    emit(GetProfileDoctorLoading());
    dioHelper
        .getData(endPoint: EndPoint.profileDoctor(doctorId: doctorId))
        .then((value) {
      doctorDetailsModel = DoctorDetailsModel.fromJson(value.data);
      emit(GetProfileDoctorSuccess());
    }).catchError((e) {
      emit(GetProfileDoctorError());
    });
  }

  DoctorDayesModel? doctorDays;
  List<String> listDays = [];
  void getDoctorDays(
      {required int doctorId, required String schedules, int? clinicId}) {
        listDays = [];
    emit(GetDoctorDaysLoading());

    dioHelper
        .getData(
      endPoint: EndPoint.getDoctorDays(
          doctorId: doctorId, schedules: schedules, clinicId: clinicId),
    )
        .then((value) {
      print('************************');
      print(value.data['data']);
      print('************************');
      doctorDays = DoctorDayesModel.fromJson(value.data);
      // log("${doctorDays!.data.}");
      if (doctorDays != null) {
        log("***************************************");
        for (var item in doctorDays!.data!) {
          listDays.add(item.date!);
        }
        //   doctorDays!.data!.forEach((element) {
        //     // listDays.add(element.date ?? '');
        //     print("THe Element is $element");
        //   });
        //   print("the list is $listDays");
        //   // doctorDays!.data!.forEach((element) {
        //   //   listDays.add(element.date!);
        //   // });
      }

      emit(GetDoctorDaysSuccess());
    }).catchError((e) {
      log('the error in days doctor is : $e');
      emit(GetDoctorDaysError());
    });
  }

  DoctorTimeModel? doctorTimeModel;
  void getDoctorTime(
      {required int doctorId,
      required String schedules,
      required String day,
      int? clinicId}) {
    emit(GetDoctorDaysLoading());

    dioHelper
        .getData(
            endPoint: EndPoint.getDoctoTime(
      doctorId: doctorId,
      schedules: schedules,
      day: day,
      clinicId: clinicId,
    ))
        .then((value) {
          print(doctorId);
      doctorTimeModel = DoctorTimeModel.fromJson(value.data);
      emit(GetDoctorDaysSuccess());
    }).catchError((e) {
      emit(GetDoctorDaysError());
    });
  }

  UserProfile? userProfile;
  void getUserProfile() {
    emit(GetUserProfileLoading());
    dioHelper
        .postData(endPoint: EndPoint.getUserProfile, token: UserLocal.token)
        .then((value) {
      userProfile = UserProfile.fromJson(value.data);
      emit(GetUserProfileSuucess());
    }).catchError((e) {
      log("$e");
      emit(GetUserProfileError());
    });
  }

  CliniceModel? cliniceModel;
  void getClincl({required int doctorId}) {
    emit(GetClinceLoading());
    
    dioHelper
        .getData(endPoint: EndPoint.getClinceEndPoint(doctorId: doctorId))
        .then((value) {
      cliniceModel = CliniceModel.fromJson(value.data);
      emit(GetClinceSuccess());
    }).catchError((e) {
      emit(GetClinceError());
    });
  }
}
