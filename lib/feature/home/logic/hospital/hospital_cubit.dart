
import 'dart:developer';

import 'package:persona2/core/config/routes/app.dart';
part 'hospital_state.dart';

class HospitalCubit extends Cubit<HospitalState> {
  HospitalCubit() : super(HospitalInitial());

  static HospitalCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  SearchedHospitalModel? searchedHospitalModel;
  void searchHospital({String cityId = '0'}) {
    emit(SearchHospitalLoading());
    dioHelper
        .getData(endPoint: EndPoint.searchHospitalEndPoint(cityId: cityId))
        .then((value) {
      searchedHospitalModel = SearchedHospitalModel.fromJson(value.data);
      emit(SearchHospitalSuccess());
    }).catchError((e) {
     
      emit(SearchHospitalError());
    });
  }

  HospitalDetailsModel? hospitalDetailsModel;
  void getHospitalDetails({required int hospitalId}) {
    emit(HospitalDetailsLoading());
    dioHelper
        .getData(
      endPoint: EndPoint.getHospitalDetails(hospitalId: hospitalId),
    )
        .then((value) {
      hospitalDetailsModel = HospitalDetailsModel.fromJson(value.data);
      emit(HospitalDetailsSuccess());
    }).catchError((e) {
      emit(HospitalDetailsError());
    });
  }

  void bookHospital({
    required int hospitalId,
    required int roomId,
  }) {
    emit(BookHospitalLoading());
    dioHelper.postData(
        endPoint: EndPoint.bookhospital,
        token: UserLocal.token,
        body: {
          JsonKeys.hospitalId: hospitalId,
          JsonKeys.roomId: roomId,
          "froom_date": "2023-7-27",
          "too_date": "2023-7-30"
        }).then((value) {
      emit(BookHospitalSuccess());
    }).catchError((e) {
      emit(BookHospitalError());
    });
  }
}
