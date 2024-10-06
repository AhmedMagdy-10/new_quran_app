class SurahModel {
  final String name;
  final int number;
  final String englishName;
  final int numberOfAyahs;
  final String englishNameTranslation;
  final String revelationType;

  SurahModel({
    required this.name,
    required this.number,
    required this.englishName,
    required this.numberOfAyahs,
    required this.englishNameTranslation,
    required this.revelationType,
  });

  factory SurahModel.fromjson(Map<String, dynamic> jsonData) {
    return SurahModel(
      name: jsonData['name'],
      number: jsonData['number'],
      englishName: jsonData['englishName'],
      numberOfAyahs: jsonData['numberOfAyahs'],
      englishNameTranslation: jsonData['englishNameTranslation'],
      revelationType: jsonData['revelationType'],
    );
  }
}
