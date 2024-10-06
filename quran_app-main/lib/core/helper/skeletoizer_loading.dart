import 'package:flutter/material.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/features/quranList/logic/models/surah_model.dart';
import 'package:quran_app/features/quranList/ui/widgets/ayaat_list_title.dart';
import 'package:skeletonizer/skeletonizer.dart';

List<SurahModel> getDummyList() {
  return List.generate(
      7,
      (index) => SurahModel(
            name: 'Surah $index',
            number: 100 + index,
            englishName: 'English Name $index',
            numberOfAyahs: 1,
            englishNameTranslation: 'Translation $index',
            revelationType: 'Revelation Type $index',
          ));
}

class SkeletoinzerLoading extends StatelessWidget {
  const SkeletoinzerLoading({
    super.key,
    required this.list,
    this.enabled,
  });
  final List<SurahModel> list;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled!,
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => AyaatListTitle(ayah: list[index]),
          separatorBuilder: (context, index) => Divider(
                color: secondColor,
              ),
          itemCount: 7),
    );
  }
}
