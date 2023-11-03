import 'dart:developer';

import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/session_User_profile_model.dart';


part 'session_user_state.dart';

class SessionUserCubit extends Cubit<SessionUserState> {
  SessionUserCubit() : super(SessionUserInitial());
  static SessionUserCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();




  SessionUserModel? sessionUserModel;
  void getSessionUser() {
    emit(GetSessionUserLoading());
    dioHelper.getData(endPoint: EndPoint.sessionUser).then((value) {
      sessionUserModel = SessionUserModel.fromJson(value.data);
      emit(GetSessionUserSuccess());
    }).catchError((e) {
  
      emit(GetSessionUserError());
    });
  }
  
SessionUserProfileModel? sessionUserProfileModel;
  void getSeesionUserProfile({required int doctorId}) {
    emit(GetSessionUserProfileLoading());
    dioHelper
        .getData(endPoint: EndPoint.sessionUserProfile(doctorId: 618))
        .then((value) {
          sessionUserProfileModel = SessionUserProfileModel.fromJson(value.data);
      emit(GetSessionUserProfileSuccess());
    }).catchError((e) {
    
      emit(GetSessionUserProfileError());
    });
  }
}
