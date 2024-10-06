import 'package:quran_app/core/helper/hive_helper.dart';

localHiveData() async {
  savedDateHive('appLogo', true);
  savedDateHive("showSuraHeader", true);
  savedDateHive("addTafseer", true);
  savedDateHive("addTafseerImage", true);
  savedDateHive("addTafseerValue", 0);
  savedDateHive("indexOfTranslation", 0);
  savedDateHive("indexOfTranslationInVerseByVerse", 1);
  savedDateHive("colorsIndex", 0);
  savedDateHive("reciterIndex", 0);
  savedDateHive("lastRead", "non");
}
