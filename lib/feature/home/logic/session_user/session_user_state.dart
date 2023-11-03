part of 'session_user_cubit.dart';

@immutable
abstract class SessionUserState {}

class SessionUserInitial extends SessionUserState {}

class GetSessionUserSuccess extends SessionUserState {}
class GetSessionUserLoading extends SessionUserState {}
class GetSessionUserError extends SessionUserState {}

class GetSessionUserProfileError extends SessionUserState {}
class GetSessionUserProfileSuccess extends SessionUserState {}
class GetSessionUserProfileLoading extends SessionUserState {}
