import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/core/helper/build_tafseer_spans.dart';
import 'package:quran_app/core/helper/build_verse_spans.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/features/quranDetails/logic/cubit/get_tafssers_books.dart';
import 'package:quran_app/features/quranDetails/logic/cubit/get_tafssers_books_states.dart';
import 'package:quran_app/features/quranDetails/logic/models/reciter_model.dart';
import 'package:quran_app/features/quranDetails/logic/translation/translationdata.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/custom_ayaa_option_feature.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/share_ayaa_as_image.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/share_ayaa_as_text.dart';
import 'package:quran_app/features/quranDetails/ui/widgets/show_tafsser_sheet_books.dart';
import 'package:quran_app/generated/l10n.dart';

Future<dynamic> showBottomSheetAyaaFeature(
  BuildContext context, {
  required int index,
  var surahNumber,
  var verseNumber,
  required Directory appDir,
  final dynamic getTranslationData,
}) async {
  int firstVerse = verseNumber;
  int lastVerse = verseNumber;
  String isDownloading = '';

  return showBarModalBottomSheet(
      barrierColor: Colors.black45,
      enableDrag: true,
      expand: false,
      duration: const Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      context: context,
      animationCurve: Curves.easeInOutQuart,
      elevation: 0,
      bounce: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => GetTafssersBookCubit()..addReciters(),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: secondColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${S.of(context).surah} ${getSurahNameArabic(surahNumber)}: ($verseNumber)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              sharedAyaaOption(context,
                                  isDownloading: isDownloading,
                                  appDir: appDir,
                                  getTranslationData: getTranslationData,
                                  index: index,
                                  surahNumber: surahNumber,
                                  verseNumber: verseNumber);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    locale: const Locale("ar"),
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 21.sp),
                                      children: buildVerseSpans(
                                          surahNumber,
                                          firstVerse,
                                          lastVerse,
                                          verseNumber,
                                          null),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.w,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 18,
                                  child: Icon(
                                    Icons.share_rounded,
                                    color: fiveColor,
                                    size: 22,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  // CustomAyaaOptionFeature(
                  //   icon: Icons.bookmark_add_rounded,
                  //   text: "اضافة كعلامة مرجعيه",
                  //   onTap: () {

                  //   },
                  // ),
                  SizedBox(
                    height: 10.w,
                  ),
                  CustomAyaaOptionFeature(
                    onTap: () {
                      showBarModalBottomSheet(
                        barrierColor: Colors.transparent,
                        context: context,
                        enableDrag: true,
                        animationCurve: Curves.easeInOutQuart,
                        bounce: true,
                        duration: const Duration(milliseconds: 150),
                        backgroundColor: kprimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(13.r),
                                topLeft: Radius.circular(13.r))),
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.93,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 8, right: 8),
                              child: Column(
                                children: [
                                  RichText(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    locale: const Locale("ar"),
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 22.sp, color: specialGreen),
                                      children: buildVerseSpans(
                                        surahNumber,
                                        firstVerse,
                                        lastVerse,
                                        verseNumber,
                                        null,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  AvailabeTafsserBooksSheet(
                                    appDir: appDir,
                                    isDownloading: isDownloading,
                                    getTranslationData: getTranslationData,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.w),
                                        child: FutureBuilder(
                                          future: buildTafseerSpans(
                                            surahNumber,
                                            firstVerse,
                                            lastVerse,
                                            translationDataList[
                                                getHiveSavedData(
                                                    "addTafseerValue")],
                                          ),
                                          builder: (context,
                                              AsyncSnapshot<List<InlineSpan>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const SpinKitWaveSpinner(
                                                color: Colors.white,
                                                size: 30,
                                              );
                                            } else if (snapshot.hasError) {
                                              return const Text(
                                                  'حدث خطأ في تحميل التقسير حاول مره اخري');
                                            } else if (!snapshot.hasData ||
                                                snapshot.data!.isEmpty) {
                                              return const Text(
                                                  'لا يوجد تفسير متاح الان');
                                            } else {
                                              return RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      children: snapshot.data));
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icons.menu_book_sharp,
                    text: "التفسير",
                  ),
                  SizedBox(
                    height: 10.w,
                  ),

                  BlocBuilder<GetTafssersBookCubit, QuranPagePlayerState>(
                    builder: (context, state) {
                      final cubit =
                          BlocProvider.of<GetTafssersBookCubit>(context);
                      List<QuranPageReciter> recitersList = cubit.reciters;

                      return InkWell(
                        onTap: () async {
                          print("${"*******************${state}"} ");

                          await cubit.stopAnyPlayingAudio();
                          await cubit
                              .downloadAndCacheSuraAudio(
                            getSurahNameEnglish(surahNumber),
                            getVerseCount(surahNumber),
                            surahNumber,
                            recitersList[getHiveSavedData("reciterIndex")]
                                .identifier,
                          )
                              .then((e) async {
                            await cubit.playFromVerse(
                              verseNumber,
                              recitersList[getHiveSavedData("reciterIndex")]
                                  .identifier,
                              surahNumber,
                              getSurahNameEnglish(surahNumber),
                            );

                            if (state is QuranPagePlayerStoping) {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text(
                                          "هل ترغب في إغلاق المشغل الحالي؟"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("العودة"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            cubit.killPlayer();
                                            // Stops the player
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('إغلاق'),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          });
                          cubit.disposePlayer();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: secondColor,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 24.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Dropdown to select the reciter
                                DropdownButton<int>(
                                  value: getHiveSavedData("reciterIndex") ?? 0,
                                  dropdownColor: Colors.grey[300],
                                  onChanged: (int? newIndex) async {
                                    if (newIndex != null &&
                                        newIndex >= 0 &&
                                        newIndex < recitersList.length) {
                                      updateHiveSavedData(
                                          "reciterIndex", newIndex);

                                      if (state is QuranPagePlayerStoping) {
                                        print('okk');
                                        await cubit.stopAnyPlayingAudio();
                                      }

                                      // Download audio for the selected reciter
                                      await cubit
                                          .downloadAndCacheSuraAudio(
                                        getSurahNameEnglish(surahNumber),
                                        getVerseCount(surahNumber),
                                        surahNumber,
                                        recitersList[getHiveSavedData(
                                                "reciterIndex")]
                                            .identifier,
                                      )
                                          .then((e) async {
                                        await cubit.playFromVerse(
                                          verseNumber,
                                          recitersList[getHiveSavedData(
                                                  "reciterIndex")]
                                              .identifier,
                                          surahNumber,
                                          getSurahNameEnglish(surahNumber),
                                        );
                                      });
                                    }
                                  },
                                  items:
                                      recitersList.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    QuranPageReciter reciter = entry.value;
                                    return DropdownMenuItem<int>(
                                      value: recitersList.indexOf(reciter),
                                      child: Text(
                                        reciter.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo",
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                state is! QuranPagePlayerDownloading
                                    ? CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white,
                                        child: Icon(
                                          state is QuranPagePlayerStarting
                                              ? Icons
                                                  .pause_circle_outline_rounded
                                              : state
                                                      is QuranPagePlayerDownloading
                                                  ? Icons
                                                      .download // Show download icon while downloading
                                                  : Icons
                                                      .settings_voice_rounded, // Default icon
                                          color: fiveColor,
                                          size: 22,
                                        ),
                                      )
                                    : Center(
                                        child: SpinKitWaveSpinner(
                                          color: fiveColor,
                                          size: 40,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Future<Object?> sharedAyaaOption(
  BuildContext context, {
  required int index,
  surahNumber,
  verseNumber,
  required Directory appDir,
  final dynamic getTranslationData,
  required String isDownloading,
}) {
  int firstVerse = verseNumber;
  int lastVerse = verseNumber;
  return showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Container();
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: StatefulBuilder(
            builder: (context, setState) {
              return CupertinoAlertDialog(
                title: Text(
                  'قال تعالي :',
                  style: TextStyle(
                    color: fiveColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.longestLine,
                      locale: const Locale("ar"),
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.black,
                        ),
                        children: buildVerseSpans(surahNumber, firstVerse,
                            lastVerse, verseNumber, null),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "[${getSurahNameArabic(surahNumber)}: $firstVerse - $lastVerse]",
                      style: TextStyle(
                        color: fiveColor,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                  ],
                ),
                actions: <Widget>[
                  ShareAyaaAsText(
                    firstVerse: firstVerse,
                    lastVerse: lastVerse,
                    surahNumber: surahNumber,
                    verseNumber: verseNumber,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareAyaaAsImagepPage(
                            isDownloading: isDownloading,
                            appDir: appDir,
                            getTranslationData: getTranslationData,
                            firstVerse: firstVerse,
                            lastVerse: lastVerse,
                            surahNumber: surahNumber,
                            verseNumber: verseNumber,
                            pageNumber: index,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'مشاركه كصوره',
                      style: TextStyle(
                        color: fiveColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
