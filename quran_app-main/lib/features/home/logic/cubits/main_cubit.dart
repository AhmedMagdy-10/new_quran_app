import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
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

  PrayerTimes? prayerTimes;

  getPrayerTimes() {
    emit(LoadingState());
    try {
      final coordinates = Coordinates(position!.latitude, position!.longitude);
      final calculationCountry = CalculationMethod.egyptian.getParameters();
      final date = DateComponents(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      prayerTimes = PrayerTimes(
        coordinates,
        date,
        calculationCountry,
      );
      emit(SuccessPrayerState());
      return prayerTimes;
    } catch (e) {
      emit(
        ErrorPrayerState(errorMassage: e.toString()),
      );
      print(e.toString());
    }
  }

  Position? position;

  void getMyLoaction() async {
    emit(LoadingState());

    LocationPermission premission = await Geolocator.checkPermission();

    if (premission == LocationPermission.denied) {
      premission = await Geolocator.requestPermission();

      if (premission == LocationPermission.denied) {
        emit(PremissionError(errorPre: 'Location permissions are denied'));
      }
    }

    Geolocator.getPositionStream().listen((Position position) {
      this.position = position;

      print(
          '${position.latitude.toString()},${position.longitude.toString()} ');
    }).onError((e) {
      emit(PremissionError(errorPre: e.toString()));
    });

    getPrayerTimes();
    emit(GetPositionSuccess());
  }
}
