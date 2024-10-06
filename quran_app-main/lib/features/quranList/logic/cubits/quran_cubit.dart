import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/features/quranList/logic/cubits/quran_states.dart';
import 'package:quran_app/features/quranList/logic/models/surah_model.dart';
import 'package:string_validator/string_validator.dart';

class QuranPageCubit extends Cubit<QuranPageStates> {
  QuranPageCubit() : super(InitialQuranState());

  List<SurahModel> ayaatSrearched = [];
  List<SurahModel> allAyaat = [];
  List<int> pageNumbers = [];

  void getAllAyaat() async {
    emit(LoadingQuranState());
    try {
      final String response =
          await rootBundle.loadString('assets/json/surahs.json');
      final List<dynamic> data = await Future.delayed(
          const Duration(milliseconds: 500), () => json.decode(response));

      allAyaat = data.map((json) => SurahModel.fromjson(json)).toList();
      ayaatSrearched = allAyaat;
      emit(SuccessQuranState());
    } catch (e) {
      emit(
        ErrorQuranState(errorMessage: e.toString()),
      );
    }
  }

  Map<String, dynamic>? ayatFiltered;
  Timer? _debounce;

  bool searchQuery = false;
  void searchAyaat(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchQuery = true;
      if (query.isEmpty) {
        ayaatSrearched = allAyaat;
      } else if (isInt(query)) {
        num pageNumber = toInt(query);
        if (pageNumber > 0 && pageNumber < 605) {
          pageNumbers.add(pageNumber.toInt());
          ayaatSrearched = [];
        }
      } else if (query.length > 3 || query.contains(" ")) {
        ayaatSrearched = allAyaat.where((surah) {
          final surahName = surah.englishName.toLowerCase();
          final surahNameTranslated =
              getSurahNameArabic(surah.number).toLowerCase();
          return surahName.contains(query.toLowerCase()) ||
              surahNameTranslated.contains(query.toLowerCase());
        }).toList();
        if (ayaatSrearched.isEmpty && query.length > 4) {
          ayatFiltered = Map<String, dynamic>.from(searchWords(query));
        }
      } else {
        ayaatSrearched = allAyaat;
      }

      emit(SuccessQuranState());
    });
  }
}
