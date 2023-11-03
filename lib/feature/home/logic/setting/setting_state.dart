part of 'setting_cubit.dart';

@immutable
abstract class SettingState {}

class SettingInitial extends SettingState {}


class ChangedLangToArabic extends SettingState {}
class ChangedLangToEnglish extends SettingState {}
