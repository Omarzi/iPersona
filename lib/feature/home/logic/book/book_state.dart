part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}
class BookDoctorOflineSuccess extends BookState {}

class BookDoctorOnlineSuccess extends BookState {}
class BookDoctorLoading extends BookState {}
class BookDoctorError extends BookState {
  final String msg;
  BookDoctorError({required this.msg});
}

class PaymentSuccess extends BookState {
  final String msg;
  PaymentSuccess({required this.msg});
}
class PaymentLoading extends BookState {}
class PaymentError extends BookState {}



