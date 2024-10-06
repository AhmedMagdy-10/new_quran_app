// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home page`
  String get homeTitle {
    return Intl.message(
      'Home page',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get sounds {
    return Intl.message(
      'Sounds',
      name: 'sounds',
      desc: '',
      args: [],
    );
  }

  /// `Hadiths`
  String get ahadth {
    return Intl.message(
      'Hadiths',
      name: 'ahadth',
      desc: '',
      args: [],
    );
  }

  /// `RemembranceAndPrayers`
  String get remembranceAndPrayers {
    return Intl.message(
      'RemembranceAndPrayers',
      name: 'remembranceAndPrayers',
      desc: '',
      args: [],
    );
  }

  /// `Qibla`
  String get qibla {
    return Intl.message(
      'Qibla',
      name: 'qibla',
      desc: '',
      args: [],
    );
  }

  /// `Alluh Names`
  String get AlluhNames {
    return Intl.message(
      'Alluh Names',
      name: 'AlluhNames',
      desc: '',
      args: [],
    );
  }

  /// `Praise`
  String get Praise {
    return Intl.message(
      'Praise',
      name: 'Praise',
      desc: '',
      args: [],
    );
  }

  /// `Podcast`
  String get Podcast {
    return Intl.message(
      'Podcast',
      name: 'Podcast',
      desc: '',
      args: [],
    );
  }

  /// `Azann`
  String get Azann {
    return Intl.message(
      'Azann',
      name: 'Azann',
      desc: '',
      args: [],
    );
  }

  /// `Notifcation`
  String get notifcation {
    return Intl.message(
      'Notifcation',
      name: 'notifcation',
      desc: '',
      args: [],
    );
  }

  /// `The Holy Quran`
  String get quran {
    return Intl.message(
      'The Holy Quran',
      name: 'quran',
      desc: '',
      args: [],
    );
  }

  /// `search By Surah or ayaah`
  String get searchBySurah {
    return Intl.message(
      'search By Surah or ayaah',
      name: 'searchBySurah',
      desc: '',
      args: [],
    );
  }

  /// `surah`
  String get surah {
    return Intl.message(
      'surah',
      name: 'surah',
      desc: '',
      args: [],
    );
  }

  /// `Share As Image`
  String get asImage {
    return Intl.message(
      'Share As Image',
      name: 'asImage',
      desc: '',
      args: [],
    );
  }

  /// `Share As Text`
  String get asText {
    return Intl.message(
      'Share As Text',
      name: 'asText',
      desc: '',
      args: [],
    );
  }

  /// `Juz`
  String get Juz {
    return Intl.message(
      'Juz',
      name: 'Juz',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
