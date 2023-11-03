part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final String token;
  LoginSuccess({required this.token});
}

class LoginError extends AuthState {}

class LoginLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final String token;
  RegisterSuccess({required this.token});
}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {}

class GetProfileSuccess extends AuthState {}

class GetProfileLoading extends AuthState {}

class GetProfileError extends AuthState {}
