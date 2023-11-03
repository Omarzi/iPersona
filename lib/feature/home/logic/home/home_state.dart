part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHomeDataSuccess extends HomeState {}
class GetHomeDataError extends HomeState {}
class GetHomeDataLoading extends HomeState {}

class GetSearchedDoctorsSuccess extends HomeState {}
class GetSearchedDoctorsLoading extends HomeState {}
class GetSearchedDoctorsError extends HomeState {}

class GetProfileDoctorSuccess extends HomeState{}
class GetProfileDoctorLoading extends HomeState{}
class GetProfileDoctorError extends HomeState{}



class GetDoctorDaysSuccess   extends HomeState{}
class GetDoctorDaysError   extends HomeState{}
class GetDoctorDaysLoading   extends HomeState{}


class GetDoctorTimeSuccess   extends HomeState{}
class GetDoctorTimeError   extends HomeState{}
class GetDoctorTimeLoading   extends HomeState{}

class GetUserProfileLoading   extends HomeState{}
class GetUserProfileSuucess   extends HomeState{}
class GetUserProfileError  extends HomeState{}

class GetClinceError  extends HomeState{}
class GetClinceLoading  extends HomeState{}
class GetClinceSuccess  extends HomeState{}

