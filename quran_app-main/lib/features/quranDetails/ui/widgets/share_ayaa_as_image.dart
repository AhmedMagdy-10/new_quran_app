import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:quran/quran.dart';
import 'package:quran_app/constant/colors.dart';

import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/core/helper/saved_and%20shared%20image.dart';

import 'package:quran_app/features/quranDetails/ui/widgets/show_tafsser_sheet_books.dart';

import 'package:quran_app/features/quranDetails/ui/widgets/surah_screen_shot.dart';
import 'package:screenshot/screenshot.dart';

class ShareAyaaAsImagepPage extends StatefulWidget {
  const ShareAyaaAsImagepPage({
    super.key,
    required this.firstVerse,
    required this.lastVerse,
    required this.surahNumber,
    required this.verseNumber,
    required this.pageNumber,
    required this.appDir,
    required this.getTranslationData,
    required this.isDownloading,
  });

  final int firstVerse;
  final int lastVerse;
  final int surahNumber;
  final int verseNumber;
  final int pageNumber;
  final Directory appDir;
  final String isDownloading;
  final dynamic getTranslationData;

  @override
  State<ShareAyaaAsImagepPage> createState() => _ShareAyaaAsImagepPageState();
}

class _ShareAyaaAsImagepPageState extends State<ShareAyaaAsImagepPage> {
  late int firstVerse;
  late int lastVerse;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    firstVerse = widget.firstVerse;
    lastVerse = widget.lastVerse;
    super.initState();
  }

  bool isShooting = false;
  int? indexOfTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'تفاصيل الصورة',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'من الايه',
                  style: TextStyle(
                    fontFamily: 'taha',
                    fontSize: 18,
                    color: fiveColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                customBuildDropdown(
                  value: firstVerse,
                  onChanged: (newValue) {
                    if (newValue != null && newValue > lastVerse) {
                      setState(() {
                        lastVerse = newValue;
                      });
                    }
                    setState(() {
                      firstVerse = newValue!;
                    });
                    print('First Verse: $firstVerse, Last Verse: $lastVerse');
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'الي الايه',
                  style: TextStyle(
                    fontFamily: 'taha',
                    fontSize: 18,
                    color: fiveColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                customBuildDropdown(
                  value: lastVerse,
                  onChanged: (newValue) {
                    if (newValue != null && newValue < firstVerse) {
                      // Prevent lastVerse from being less than firstVerse
                      return;
                    }
                    setState(() {
                      lastVerse = newValue!;
                    });
                    print('First Verse: $firstVerse, Last Verse: $lastVerse');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    side: const BorderSide(width: 0.5),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity:
                        const VisualDensity(horizontal: -4, vertical: -4),
                    fillColor: const WidgetStatePropertyAll(Colors.blue),
                    activeColor: Colors.white,
                    checkColor: Colors.white,
                    value: getHiveSavedDataBool('addTafseerImage'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          updateHiveSavedData('addTafseerImage', newValue);
                          print(getHiveSavedDataBool('addTafseerIamge'));
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'اضافه تفسير',
                    style: TextStyle(
                      fontSize: 22.sp,
                      color: fiveColor,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (getHiveSavedData('addTafseerImage') == true)
              AvailabeTafsserBooksSheet(
                isDownloading: widget.isDownloading,
                appDir: widget.appDir,
                getTranslationData: widget.getTranslationData,
              ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       height: 10.h,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         showMaterialModalBottomSheet(
            //           enableDrag: true,
            //           animationCurve: Curves.easeInOutQuart,
            //           elevation: 0,
            //           bounce: true,
            //           duration: const Duration(milliseconds: 150),
            //           backgroundColor: Colors.white,
            //           context: context,
            //           builder: (context) {
            //             return SizedBox(
            //               height: MediaQuery.sizeOf(context).height * 0.8,
            //               width: double.infinity,
            //               child: Padding(
            //                 padding: EdgeInsets.all(8.0.w),
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       " كتب التفسير",
            //                       style: TextStyle(
            //                         fontSize: 22.sp,
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 10.h,
            //                     ),
            //                     Expanded(
            //                       child: ListView.separated(
            //                           itemBuilder: (context, index) {
            //                             return Container(
            //                               decoration: BoxDecoration(
            //                                 borderRadius:
            //                                     BorderRadius.circular(12),
            //                                 color: index ==
            //                                         getHiveSavedData(
            //                                             "addTafseerValue")
            //                                     ? specialColor
            //                                         .withOpacity(0.5)
            //                                     : Colors.transparent,
            //                               ),
            //                               child: InkWell(
            //                                 onTap: () async {
            //                                   await downLoadTafsserBook(
            //                                       index, context);
            //                                 },
            //                                 child: Padding(
            //                                   padding: EdgeInsets.symmetric(
            //                                       horizontal: 20.w,
            //                                       vertical: 8.h),
            //                                   child: Row(
            //                                     mainAxisAlignment:
            //                                         MainAxisAlignment
            //                                             .spaceBetween,
            //                                     children: [
            //                                       Expanded(
            //                                         child: Text(
            //                                           translationDataList[
            //                                                   index]
            //                                               .typeTextInRelatedLanguage,
            //                                           textDirection:
            //                                               TextDirection.rtl,
            //                                           overflow: TextOverflow
            //                                               .ellipsis,
            //                                           style: TextStyle(
            //                                             fontFamily: 'Cairo',
            //                                             fontSize: 18.sp,
            //                                             fontWeight:
            //                                                 FontWeight.w500,
            //                                           ),
            //                                         ),
            //                                       ),
            //                                       isDownloading !=
            //                                               translationDataList[
            //                                                       index]
            //                                                   .url
            //                                           ? Icon(index == 0 ||
            //                                                   index == 10
            //                                               ? Icons
            //                                                   .storage_rounded
            //                                               : File("${appDir!.path}/${translationDataList[index].typeText}.json")
            //                                                       .existsSync()
            //                                                   ? Icons.done_all
            //                                                   : Icons
            //                                                       .cloud_download_rounded)
            //                                           : const SpinKitWaveSpinner(
            //                                               color: Colors.white,
            //                                               size: 30,
            //                                             )
            //                                     ],
            //                                   ),
            //                                 ),
            //                               ),
            //                             );
            //                           },
            //                           separatorBuilder: (context, index) =>
            //                               Divider(
            //                                 color: fiveColor,
            //                               ),
            //                           itemCount: translationDataList.length),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //       },
            //       child: Container(
            //         height: 45.h,
            //         width: MediaQuery.sizeOf(context).width * 0.9,
            //         decoration: BoxDecoration(
            //             color: specialColor.withOpacity(0.5),
            //             borderRadius: BorderRadius.circular(12)),
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 translationDataList[
            //                         getHiveSavedData("addTafseerValue") ?? 0]
            //                     .typeTextInRelatedLanguage,
            //                 style: TextStyle(
            //                     color: Colors.black,
            //                     fontSize: 16.sp,
            //                     fontFamily: 'Cairo'),
            //               ),
            //               Icon(
            //                 Icons.more_horiz_outlined,
            //                 size: 24.sp,
            //                 color: Colors.black,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            SizedBox(
              height: 15.w,
            ),
            //colors pickers
            InkWell(
              onTap: () {
                showGeneralDialog(
                  context: context,
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return Container();
                  },
                  transitionBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return ScaleTransition(
                      scale: Tween<double>(begin: 0.7, end: 1.0)
                          .animate(animation),
                      child: FadeTransition(
                        opacity: Tween<double>(begin: 0.5, end: 1.0)
                            .animate(animation),
                        child: CupertinoAlertDialog(
                          content: SizedBox(
                            height: 300,
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 70,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: primaryColors.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      indexOfTheme = index;
                                    });

                                    Navigator.pop(context);
                                  },
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              color: backgroundColors[index],
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                      ),
                                      Center(
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: primaryColors[index],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تعديل اللوان',
                      style: TextStyle(
                        fontSize: 22.sp,
                        color: fiveColor,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: specialColor,
                      child: const Icon(
                        Icons.color_lens,
                        size: 19,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 30.h,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: indexOfTheme != null
                        ? backgroundColors[indexOfTheme!]
                        : kprimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: indexOfTheme != null
                            ? primaryColors[indexOfTheme!].withOpacity(.2)
                            : kprimaryColor,
                        blurRadius: 4,
                        spreadRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: RepaintBoundary(
                    child: SurahScreenshot(
                      screenshotController: screenshotController,
                      indexOfTheme: indexOfTheme,
                      widget: widget,
                      firstVerse: firstVerse,
                      lastVerse: lastVerse,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 28.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'saveImage',
              shape: const CircleBorder(),
              onPressed: () async {
                setState(() {
                  isShooting = true;
                });
                await Future.delayed(const Duration(milliseconds: 300)); 

                await screenshotController
                    .capture(delay: const Duration(milliseconds: 100))
                    .then((downloadImage) {
                  saveImageToMobile(downloadImage!);
                });

                setState(() {
                  isShooting = false;
                });
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.image_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
            FloatingActionButton(
              heroTag: 'shareImage',
              shape: const CircleBorder(),
              onPressed: () async {
                setState(() {
                  isShooting = true;
                });
                await Future.delayed(const Duration(milliseconds: 300)); 
                await screenshotController
                    .capture(delay: const Duration(milliseconds: 100))
                    .then((screenImage) {
                  shareImage(screenImage!);
                });
                setState(() {
                  isShooting = false;
                });
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customBuildDropdown(
      {required int value, required Function(int?)? onChanged}) {
    return Material(
      child: DropdownButton<int>(
        dropdownColor: kprimaryColor,
        borderRadius: BorderRadius.circular(12),
        items: List.generate(
          getVerseCount(widget.surahNumber),
          (index) => DropdownMenuItem<int>(
            value: index + 1,
            child: Text(
              "${index + 1}",
            ),
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
