import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/helper/cache_helper.dart';
import 'package:quran_app/features/home/logic/cubits/main_cubit_states.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit() : super(InitialMainState());

  bool isDark = false;

  void changeAppMode() {
    isDark = !isDark;
    CacheHelper.saveData(key: 'isDark', value: isDark).then((v) {
      emit(ChangeAppModeState());
    });
  }
}
