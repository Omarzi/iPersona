
import 'dart:developer';

import 'package:persona2/core/config/routes/app.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  static SettingCubit get(context) => BlocProvider.of(context);




  bool lang = true; // that mean En

  void changeLangToArabic() {
    emit(ChangedLangToEnglish());
    lang = true;
    
    CacheHelper.saveData(key: MyCacheKey.lang, value: true);
    log("${CacheHelper.getData(key: MyCacheKey.lang)}");
    emit(ChangedLangToArabic());
  }

  void changeLangToEnglish() {
    emit(ChangedLangToArabic());
    lang = false;
    
    CacheHelper.saveData(key: MyCacheKey.lang, value: false);
    log("${CacheHelper.getData(key: MyCacheKey.lang)}");

    emit(ChangedLangToEnglish());
  }















}
