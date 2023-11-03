import 'dart:developer';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/profile_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();
  ProfileModel? profileModel;
  void login({required String email, required String password}) {
    emit(LoginLoading());
    dioHelper.postData(endPoint: EndPoint.login, body: {
      'email': email,
      'password': password,
    }).then((value) {
      emit(LoginSuccess(
          token: value.data['data']['original']['data']['access_token']));
      CacheHelper.saveData(
          key: MyCacheKey.token,
          value: value.data['data']['original']['data']['access_token']);
      print(value.data['data']['original']['data']['access_token']);
    }).catchError((e) {
      emit(LoginError());
    });
  }

  void register({
    required String email,
    required String name,
    required String password,
    required String role,
    required String residence,
    required String phone,
  }) {
    emit(RegisterLoading());
    dioHelper.postData(
      endPoint: EndPoint.register,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "residence": residence,
        "phone": phone,
      },
    ).then((value) {
      emit(RegisterSuccess(
          token: value.data['data']['original']['data']['access_token']));
      print(value.data['data']['original']['data']['access_token']);
    }).catchError((e) {
      log(e);
      emit(RegisterError());
    });
  }

  void getProfile() {
    emit(GetProfileLoading());
    dioHelper.postData(endPoint: EndPoint.profile).then((value) {
      profileModel = ProfileModel.fromJson(value.data);

      emit(GetProfileSuccess());
    }).catchError((e) {
      emit(GetProfileError());
    });
  }
}
