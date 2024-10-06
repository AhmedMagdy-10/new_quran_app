import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/home/logic/model/feature_model.dart';
import 'package:quran_app/features/home/ui/widgets/home_page_body.dart';
import 'package:quran_app/features/quranList/ui/quran_surahs_list.dart';

import '../../../../generated/l10n.dart';

class FeaturesItemList extends StatelessWidget {
  const FeaturesItemList({
    super.key,
  });

  static List<FeatureModel> itemList(BuildContext context) => [
        FeatureModel(
          itemImage: 'assets/image/islam.png',
          itemText: S.of(context).sounds,
          navigatorScreen: const QuranSurahPage(),
        ),

        FeatureModel(
          itemImage: 'assets/image/muhammed.png',
          itemText: S.of(context).ahadth,
          navigatorScreen: const QuranSurahPage(),
        ),
        FeatureModel(
          itemImage: 'assets/image/azkar.png',
          itemText: S.of(context).remembranceAndPrayers,
          navigatorScreen: const QuranSurahPage(),
        ),
        //////////////////

        FeatureModel(
          itemImage: 'assets/image/qibla.png',
          itemText: S.of(context).qibla,
          navigatorScreen: const QuranSurahPage(),
        ),

        FeatureModel(
          itemImage: 'assets/image/allah.png',
          itemText: S.of(context).AlluhNames,
          navigatorScreen: const QuranSurahPage(),
        ),
        FeatureModel(
          itemImage: 'assets/image/tasbih.png',
          itemText: S.of(context).Praise,
          navigatorScreen: const QuranSurahPage(),
        ),
        ////////////////

        FeatureModel(
          itemImage: 'assets/image/microphone.png',
          itemText: S.of(context).Podcast,
          navigatorScreen: const QuranSurahPage(),
        ),

        FeatureModel(
          itemImage: 'assets/image/ramadan.png',
          itemText: S.of(context).Azann,
          navigatorScreen: const QuranSurahPage(),
        ),
        FeatureModel(
          itemImage: 'assets/image/bell.png',
          itemText: S.of(context).notifcation,
          navigatorScreen: const QuranSurahPage(),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuranSurahPage(),
                  ));
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/book.png',
                    height: MediaQuery.sizeOf(context).height * 0.07.h,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(S.of(context).quran,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 12),
              itemBuilder: (context, index) => FeatureItem(
                featureModel: itemList(context)[index],
              ),
              itemCount: itemList(context).length,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.featureModel,
  });

  final FeatureModel featureModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => featureModel.navigatorScreen,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              featureModel.itemImage,
              height: MediaQuery.sizeOf(context).height * 0.05.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(featureModel.itemText,
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
