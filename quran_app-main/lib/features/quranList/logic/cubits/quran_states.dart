abstract class QuranPageStates {}

class InitialQuranState extends QuranPageStates {}

class LoadingQuranState extends QuranPageStates {}

class SuccessQuranState extends QuranPageStates {}

class SuccessdQuranState extends QuranPageStates {}

class UpdatePrecent extends QuranPageStates {}

class ErrorQuranState extends QuranPageStates {
  final String errorMessage;

  ErrorQuranState({required this.errorMessage});
}
