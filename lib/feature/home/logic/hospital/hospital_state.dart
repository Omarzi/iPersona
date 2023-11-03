part of 'hospital_cubit.dart';

@immutable
abstract class HospitalState {}

class HospitalInitial extends HospitalState {}

class SearchHospitalSuccess extends HospitalState {}
class SearchHospitalLoading extends HospitalState {}
class SearchHospitalError extends HospitalState {}

class HospitalDetailsSuccess extends HospitalState {}
class HospitalDetailsLoading extends HospitalState {}
class HospitalDetailsError extends HospitalState {}

class BookHospitalError extends HospitalState {}
class BookHospitalSuccess extends HospitalState {}
class BookHospitalLoading extends HospitalState {}



