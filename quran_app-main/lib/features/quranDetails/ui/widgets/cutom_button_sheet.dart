

// bool showSuraHeader = true;
//   bool addAppSlogan = true;

//   takeScreenshotFunction(index, surahNumber, verseNumber) {
//     int firstVerse = verseNumber;
//     int lastVerse = verseNumber;
//     showAnimatedDialog(
//       animationType: DialogTransitionType.size,
//       context: context,
//       builder: (builder) {
//         return StatefulBuilder(builder: (context, setstatter) {
//           return Dialog(
//             // title: const Text('Share Ayah'),
//             backgroundColor: backgroundColors[getValue("quranPageolorsIndex")],

//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       "share".tr(),
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20.0, // Increase font size
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20.0), // Add spacing at the top
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'fromayah'.tr(),
//                       style: TextStyle(
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         fontSize: 16.0, // Increase font size
//                       ),
//                     ),
//                     const SizedBox(width: 10.0),
//                     DropdownButton<int>(
//                       dropdownColor:
//                           backgroundColors[getValue("quranPageolorsIndex")],
//                       value: firstVerse,
//                       onChanged: (newValue) {
//                         if (newValue! > lastVerse) {
//                           setState(() {
//                             lastVerse = newValue;
//                           });
//                           setstatter(() {});
//                         }
//                         setState(() {
//                           firstVerse = newValue;
//                         });
//                         setstatter(() {});
//                         // Handle dropdown selection
//                       },
//                       items: List.generate(
//                         quran.getVerseCount(surahNumber),
//                         (index) => DropdownMenuItem<int>(
//                           value: index + 1,
//                           child: Text(
//                             '${index + 1}',
//                             style: TextStyle(
//                               color: primaryColors[
//                                   getValue("quranPageolorsIndex")],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20.0),
//                     Text(
//                       'toayah'.tr(),
//                       style: TextStyle(
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         fontSize: 16.0,
//                       ),
//                     ),
//                     const SizedBox(width: 10.0),
//                     DropdownButton<int>(
//                       dropdownColor:
//                           backgroundColors[getValue("quranPageolorsIndex")],
//                       value: lastVerse,
//                       onChanged: (newValue) {
//                         if (newValue! > firstVerse) {
//                           setState(() {
//                             lastVerse = newValue;
//                           });
//                           setstatter(() {});
//                         }
//                         // Handle dropdown selection
//                       },
//                       items: List.generate(
//                         quran.getVerseCount(surahNumber),
//                         (index) => DropdownMenuItem<int>(
//                           value: index + 1,
//                           child: Text(
//                             '${index + 1}',
//                             style: TextStyle(
//                               color: primaryColors[
//                                   getValue("quranPageolorsIndex")],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0), // Add spacing between rows
//                 RadioListTile(
//                   activeColor: highlightColors[getValue("quranPageolorsIndex")],
//                   fillColor: MaterialStatePropertyAll(
//                       primaryColors[getValue("quranPageolorsIndex")]),
//                   title: Text(
//                     'asimage'.tr(),
//                     style: TextStyle(
//                       color: primaryColors[getValue("quranPageolorsIndex")],
//                     ),
//                   ),
//                   value: 0,
//                   groupValue: getValue("selectedShareTypeIndex"),
//                   onChanged: (value) {
//                     updateValue("selectedShareTypeIndex", value);
//                     setState(() {});
//                     setstatter(() {});
//                   },
//                 ),
//                 RadioListTile(
//                   activeColor: highlightColors[getValue("quranPageolorsIndex")],
//                   fillColor: MaterialStatePropertyAll(
//                       primaryColors[getValue("quranPageolorsIndex")]),
//                   title: Text(
//                     'astext'.tr(),
//                     style: TextStyle(
//                       color: primaryColors[getValue("quranPageolorsIndex")],
//                     ),
//                   ),
//                   value: 1,
//                   groupValue: getValue("selectedShareTypeIndex"),
//                   onChanged: (value) {
//                     updateValue("selectedShareTypeIndex", value);
//                     setState(() {});
//                     setstatter(() {});
//                   },
//                 ),
//                 if (getValue("selectedShareTypeIndex") == 1)
//                   Row(
//                     children: [
//                       Checkbox(
//                         fillColor: MaterialStatePropertyAll(
//                             primaryColors[getValue("quranPageolorsIndex")]),
//                         checkColor:
//                             backgroundColors[getValue("quranPageolorsIndex")],
//                         value: getValue("textWithoutDiacritics"),
//                         onChanged: (newValue) {
//                           updateValue("textWithoutDiacritics", newValue);
//                           setState(() {});
//                           setstatter(() {});
//                         },
//                       ),
//                       Text(
//                         'withoutdiacritics'.tr(),
//                         style: TextStyle(
//                           color: primaryColors[getValue("quranPageolorsIndex")],
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ],
//                   ),

//                 // if (getValue("selectedShareTypeIndex") == 0)
//                 Row(
//                   children: [
//                     Checkbox(
//                       fillColor: MaterialStatePropertyAll(
//                           primaryColors[getValue("quranPageolorsIndex")]),
//                       checkColor:
//                           backgroundColors[getValue("quranPageolorsIndex")],
//                       value: getValue("addAppSlogan"),
//                       onChanged: (newValue) {
//                         updateValue("addAppSlogan", newValue);

//                         setState(() {});
//                         setstatter(() {});
//                       },
//                     ),
//                     Text(
//                       'addappname'.tr(),
//                       style: TextStyle(
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Checkbox(
//                       fillColor: MaterialStatePropertyAll(
//                           primaryColors[getValue("quranPageolorsIndex")]),
//                       checkColor:
//                           backgroundColors[getValue("quranPageolorsIndex")],
//                       value: getValue("addTafseer"),
//                       onChanged: (newValue) {
//                         updateValue("addTafseer", newValue);

//                         setState(() {});
//                         setstatter(() {});
//                       },
//                     ),
//                     Text(
//                       'addtafseer'.tr(),
//                       style: TextStyle(
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 if (getValue("addTafseer") == true)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 20.w,
//                       ),
//                       Directionality(
//                         textDirection: m.TextDirection.rtl,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: InkWell(
//                             onTap: () {
//                               showMaterialModalBottomSheet(
//                                   enableDrag: true,
//                                   animationCurve: Curves.easeInOutQuart,
//                                   elevation: 0,
//                                   bounce: true,
//                                   duration: const Duration(milliseconds: 150),
//                                   backgroundColor: backgroundColor,
//                                   context: context,
//                                   builder: (builder) {
//                                     return Directionality(
//                                       textDirection: m.TextDirection.rtl,
//                                       child: SizedBox(
//                                         height:
//                                             MediaQuery.of(context).size.height *
//                                                 .8,
//                                         child: Column(
//                                           children: [
//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Text(
//                                                 "choosetranslation".tr(),
//                                                 style: TextStyle(
//                                                     color: primaryColor,
//                                                     fontSize: 22.sp,
//                                                     fontFamily: context.locale
//                                                                 .languageCode ==
//                                                             "ar"
//                                                         ? "cairo"
//                                                         : "roboto"),
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: ListView.separated(
//                                                   separatorBuilder:
//                                                       ((context, index) {
//                                                     return const Divider();
//                                                   }),
//                                                   itemCount: translationDataList
//                                                       .length,
//                                                   itemBuilder: (c, i) {
//                                                     return Container(
//                                                       color: i ==
//                                                               getValue(
//                                                                   "addTafseerValue")
//                                                           ? Colors.blueGrey
//                                                               .withOpacity(.1)
//                                                           : Colors.transparent,
//                                                       child: InkWell(
//                                                         onTap: () async {
//                                                           if (isDownloading !=
//                                                               translationDataList[
//                                                                       i]
//                                                                   .url) {
//                                                             if (File("${appDir!.path}/${translationDataList[i].typeText}.json")
//                                                                     .existsSync() ||
//                                                                 i == 0 ||
//                                                                 i == 1) {
//                                                               updateValue(
//                                                                   "addTafseerValue",
//                                                                   i);
//                                                               setState(() {});
//                                                               setstatter(() {});
//                                                             } else {
//                                                               PermissionStatus
//                                                                   status =
//                                                                   await Permission
//                                                                       .storage
//                                                                       .request();
//                                                               //PermissionStatus status1 = await Permission.accessMediaLocation.request();
//                                                               PermissionStatus
//                                                                   status2 =
//                                                                   await Permission
//                                                                       .manageExternalStorage
//                                                                       .request();
//                                                               // print(
//                                                               //     'status $status   -> $status2');
//                                                               if (status
//                                                                       .isGranted &&
//                                                                   status2
//                                                                       .isGranted) {
//                                                                 // print(true);
//                                                               } else if (status
//                                                                       .isPermanentlyDenied ||
//                                                                   status2
//                                                                       .isPermanentlyDenied) {
//                                                                 await openAppSettings();
//                                                               } else if (status
//                                                                   .isDenied) {
//                                                                 // print(
//                                                                 //     'Permission Denied');
//                                                               }

//                                                               await Dio().download(
//                                                                   translationDataList[
//                                                                           i]
//                                                                       .url,
//                                                                   "${appDir!.path}/${translationDataList[i].typeText}.json");
//                                                             }
//                                                             getTranslationData();
//                                                             updateValue(
//                                                                 "addTafseerValue",
//                                                                 i);
//                                                             setState(() {});
//                                                             setstatter(() {});
//                                                           }

//                                                           setState(() {});

//                                                           // setStatee(() {});
//                                                           if (mounted) {
//                                                             setstatter(() {});

//                                                             Navigator.pop(
//                                                                 context);
//                                                             setstatter(() {});
//                                                           }
//                                                           setstatter(() {});
//                                                         },
//                                                         child: Padding(
//                                                           padding: EdgeInsets
//                                                               .symmetric(
//                                                                   horizontal:
//                                                                       18.0.w,
//                                                                   vertical:
//                                                                       2.h),
//                                                           child: Row(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .spaceBetween,
//                                                             children: [
//                                                               Text(
//                                                                 translationDataList[
//                                                                         i]
//                                                                     .typeTextInRelatedLanguage,
//                                                                 style: TextStyle(
//                                                                     color: primaryColor
//                                                                         .withOpacity(
//                                                                             .9),
//                                                                     fontSize:
//                                                                         14.sp),
//                                                               ),
//                                                               isDownloading !=
//                                                                       translationDataList[
//                                                                               i]
//                                                                           .url
//                                                                   ? Icon(
//                                                                       i == 0 ||
//                                                                               i ==
//                                                                                   1
//                                                                           ? MfgLabs
//                                                                               .hdd
//                                                                           : File("${appDir!.path}/${translationDataList[i].typeText}.json").existsSync()
//                                                                               ? Icons.done
//                                                                               : Icons.cloud_download,
//                                                                       color: Colors
//                                                                           .blueAccent,
//                                                                       size:
//                                                                           18.sp,
//                                                                     )
//                                                                   : const CircularProgressIndicator(
//                                                                       strokeWidth:
//                                                                           2,
//                                                                       color: Colors
//                                                                           .blueAccent,
//                                                                     )
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   });
//                             },
//                             child: Container(
//                               width: MediaQuery.of(context).size.width * .7,
//                               height: 40.h,
//                               decoration: BoxDecoration(
//                                   color: Colors.blueGrey.withOpacity(.1),
//                                   borderRadius: BorderRadius.circular(12)),
//                               child: Padding(
//                                 padding:
//                                     EdgeInsets.symmetric(horizontal: 14.0.w),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       translationDataList[
//                                               getValue("addTafseerValue") ?? 0]
//                                           .typeTextInRelatedLanguage,
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: translationDataList[getValue(
//                                                               "addTafseerValue") ??
//                                                           0]
//                                                       .typeInNativeLanguage ==
//                                                   "العربية"
//                                               ? "cairo"
//                                               : "roboto"),
//                                     ),
//                                     Icon(
//                                       FontAwesome.ellipsis,
//                                       size: 24.sp,
//                                       color: secondaryColors[
//                                           getValue("quranPageolorsIndex")],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                 if (getValue("selectedShareTypeIndex") == 1)
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: EasyContainer(
//                         onTap: () async {
//                           if (getValue("selectedShareTypeIndex") == 1) {
//                             // print("sharing ");
//                             List verses = [];
//                             for (int i = firstVerse; i <= lastVerse; i++) {
//                               verses.add(quran.getVerse(surahNumber, i,
//                                   verseEndSymbol: true));
//                             }
//                             if (getValue("textWithoutDiacritics")) {
//                               if (getValue("addTafseer")) {
//                                 String tafseer = "";
//                                 for (int verseNumber = firstVerse;
//                                     verseNumber <= lastVerse;
//                                     verseNumber++) {
//                                   String verseTafseer =
//                                       await translate.getVerseTranslation(
//                                     surahNumber,
//                                     verseNumber,
//                                     translationDataList[
//                                         getValue("addTafseerValue")],
//                                   );
//                                   tafseer = "$tafseer $verseTafseer";
//                                 }
//                                 Share.share(
//                                   // "",
//                                   "{${removeDiacritics(verses.join(''))}} [${quran.getSurahNameArabic(surahNumber)}: $firstVerse : $lastVerse]\n\n${removeHtmlTags(removeDiacritics(tafseer))}\n\n${getValue("addAppSlogan") ? "Shared with Skoon - faithful companion" : ""}",
//                                   // "text/plain"
//                                 );
//                               } else {
//                                 Share.share(
//                                   // "",
//                                   "{${removeDiacritics(verses.join(''))}} [${quran.getSurahNameArabic(surahNumber)}: $firstVerse : $lastVerse]${getValue("addAppSlogan") ? "Shared with Skoon - faithful companion" : ""}",
//                                   // "text/plain"
//                                 );
//                               }
//                             } else {
//                               if (getValue("addTafseer")) {
//                                 String tafseer = "";
//                                 for (int verseNumber = firstVerse;
//                                     verseNumber <= lastVerse;
//                                     verseNumber++) {
//                                   String cTafseer =
//                                       await translate.getVerseTranslation(
//                                           surahNumber,
//                                           verseNumber,
//                                           translationDataList[
//                                               getValue("addTafseerValue")]);
//                                   tafseer = "$tafseer $cTafseer ";
//                                 }
//                                 Share.share(
//                                   // "",
//                                   "{${verses.join('')}} [${quran.getSurahNameArabic(surahNumber)}: $firstVerse : $lastVerse]\n\n${translationDataList[getValue("addTafseerValue")].typeTextInRelatedLanguage}:\n${removeHtmlTags(tafseer)}\n\n${getValue("addAppSlogan") ? "Shared with Skoon" : ""}",
//                                   // "text/plain"
//                                 );
//                               } else {
//                                 Share.share(
//                                   // "",
//                                   "{${verses.join('')}} [${quran.getSurahNameArabic(surahNumber)}: $firstVerse : $lastVerse]${getValue("addAppSlogan") ? "Shared with Skoon" : ""}",
//                                   // "text/plain"
//                                 );
//                               }
//                             }
//                           }
//                         },
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         child: Text(
//                           "astext".tr(),
//                           style: TextStyle(
//                               color: backgroundColors[
//                                   getValue("quranPageolorsIndex")]),
//                         )),
//                   ),
//                 if (getValue("selectedShareTypeIndex") == 0)
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 12, right: 12, bottom: 12),
//                     child: EasyContainer(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (builder) => ScreenShotPreviewPage(
//                                       index: index,
//                                       surahNumber: surahNumber,
//                                       jsonData: widget.jsonData,
//                                       firstVerse: firstVerse,
//                                       lastVerse: lastVerse)));
//                         },
//                         color: primaryColors[getValue("quranPageolorsIndex")],
//                         child: Text(
//                           "preview".tr(),
//                           style: TextStyle(
//                               color: backgroundColors[
//                                   getValue("quranPageolorsIndex")]),
//                         )),
//                   )
//               ],
//             ),
//           );
//         });
//       },
//     );
//   }
  
  