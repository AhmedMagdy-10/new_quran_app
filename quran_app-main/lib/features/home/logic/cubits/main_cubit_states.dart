abstract class MainCubitStates {}

class InitialMainState extends MainCubitStates {}

class ChangeAppModeState extends MainCubitStates {}

class LoadingState extends MainCubitStates {}

class SuccessPrayerState extends MainCubitStates {}

class ErrorPrayerState extends MainCubitStates {
  final String errorMassage;

  ErrorPrayerState({required this.errorMassage});
}

class PremissionError extends MainCubitStates {
  final String errorPre;

  PremissionError({required this.errorPre});
}

class GetPositionSuccess extends MainCubitStates {}
