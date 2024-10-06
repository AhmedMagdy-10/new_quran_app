String prayerTimeToString(String nextPrayer) {
  if (nextPrayer == 'fajr') {
    return 'الفجر';
  } else if (nextPrayer == 'dhuhr') {
    return 'الظهر';
  } else if (nextPrayer == 'asr') {
    return 'العصر';
  } else if (nextPrayer == 'maghrib') {
    return 'المغرب';
  } else {
    return 'العشاء';
  }
}
