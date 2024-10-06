  //  EasyContainer(
  //                         borderRadius: 8,
  //                         color: primaryColors[getValue("quranPageolorsIndex")]
  //                             .withOpacity(.05),
  //                         onTap: () async {
  //                           Navigator.pop(context);
  //                           // print(getValue("lastRead"));
  //                           // print(quran.getAudioURLBySurah(
  //                           //     surahNumber, reciters[2].identifier));
  //                           // print(quran.getAudioURLByVerse(surahNumber,
  //                           //     verseNumber, reciters[2].identifier));
  //                           await downloadAndCacheSuraAudio(
  //                               quran.getSurahNameEnglish(surahNumber),
  //                               quran.getVerseCount(surahNumber),
  //                               surahNumber,
  //                               reciters[getValue("reciterIndex")].identifier);
  //                           // print("lastt read ${getValue("lastRead")}");

  //                           // BlocProvider.of<QuranPagePlayerBloc>(context, listen: false)
  //                           if (playerPageBloc.state is PlayerBlocPlaying) {
  //                             if (mounted) {
  //                               await showDialog(
  //                                   context: context,
  //                                   builder: (a) {
  //                                     return AlertDialog(
  //                                       content: Text("closeplayer".tr()),
  //                                       actions: [
  //                                         TextButton(
  //                                             onPressed: () {
  //                                               Navigator.pop(context);
  //                                             },
  //                                             child: Text("back".tr())),
  //                                         TextButton(
  //                                             onPressed: () {
  //                                               playerPageBloc
  //                                                   .add(ClosePlayerEvent());
  //                                               Navigator.of(context).pop();
  //                                             },
  //                                             child: Text("close".tr())),
  //                                       ],
  //                                     );
  //                                   });
  //                             }
  //                           }
  //                           if (qurapPagePlayerBloc.state
  //                               is QuranPagePlayerPlaying) {
  //                             qurapPagePlayerBloc.add(KillPlayerEvent());
  //                           }

  //                           qurapPagePlayerBloc.add(PlayFromVerse(
  //                               verseNumber,
  //                               reciters[getValue("reciterIndex")].identifier,
  //                               surahNumber,
  //                               quran.getSurahNameEnglish(surahNumber)));
  //                           if (getValue("alignmentType") == "verticalview" &&
  //                               quran.getPageNumber(surahNumber, verseNumber) >
  //                                   600) {
  //                             await Future.delayed(
  //                                 const Duration(milliseconds: 1000));
  //                             itemScrollController.jumpTo(
  //                                 index: quran.getPageNumber(
  //                                     surahNumber, verseNumber));
  //                           }
  //                         },
  //                         child: SizedBox(
  //                           width: MediaQuery.of(context).size.width,
  //                           child: Row(
  //                             children: [
  //                               SizedBox(
  //                                 width: 20.w,
  //                               ),
  //                               Icon(
  //                                 FontAwesome5.book_reader,
  //                                 color: getValue("quranPageolorsIndex") == 0
  //                                     ? secondaryColors[
  //                                         getValue("quranPageolorsIndex")]
  //                                     : highlightColors[
  //                                         getValue("quranPageolorsIndex")],
  //                               ),
  //                               SizedBox(
  //                                 width: 20.w,
  //                               ),
  //                               Text("play".tr(),
  //                                   style: TextStyle(
  //                                       fontFamily: "cairo",
  //                                       fontSize: 14.sp,
  //                                       color: primaryColors[
  //                                           getValue("quranPageolorsIndex")])),
  //                               SizedBox(
  //                                 width: 30.w,
  //                               ),
  //                               DropdownButton<int>(
  //                                 value: getValue("reciterIndex"),
  //                                 dropdownColor: backgroundColors[
  //                                     getValue("quranPageolorsIndex")],
  //                                 onChanged: (int? newIndex) {
  //                                   updateValue("reciterIndex", newIndex);
  //                                   setState(() {});
  //                                   setstatee(() {});
  //                                 },
  //                                 items: reciters.map((reciter) {
  //                                   return DropdownMenuItem<int>(
  //                                     value: reciters.indexOf(reciter),
  //                                     child: Text(
  //                                         context.locale.languageCode == "ar"
  //                                             ? reciter.name
  //                                             : reciter.englishName,
  //                                         style: TextStyle(
  //                                             color: primaryColors[getValue(
  //                                                 "quranPageolorsIndex")])),
  //                                   );
  //                                 }).toList(),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       const SizedBox(
  //                         height: 30,
  //                       ),
  //                       SizedBox(
  //                         height: 5.h,
  //                       ),
  //                     ],
  //                   ),
  //                 ));
  //           }));
  // }

 // if (state is QuranPagePlayerPlaying) {
                      //   return Positioned(
                      //     bottom: 0,
                      //     width: MediaQuery.sizeOf(context).width,
                      //     child: Center(
                      //       child: Container(
                      //         width: MediaQuery.sizeOf(context).width,
                      //         decoration: BoxDecoration(
                      //             color: Colors.grey,
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 blurRadius: 1,
                      //                 color: kprimaryColor,
                      //               )
                      //             ],
                      //             borderRadius: BorderRadius.only(
                      //                 topRight: Radius.circular(15.r),
                      //                 topLeft: Radius.circular(15.r))),
                      //         child: Column(
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             Row(
                      //               children: [
                      //                 DropdownButton<int>(
                      //                   value:
                      //                       getHiveSavedData("reciterIndex") ??
                      //                           0,
                      //                   dropdownColor: Colors.grey[300],
                      //                   onChanged: (int? newIndex) async {
                      //                     if (newIndex != null &&
                      //                         newIndex >= 0 &&
                      //                         newIndex < recitersList.length) {
                      //                       updateHiveSavedData(
                      //                           "reciterIndex", newIndex);
                      //                       print(newIndex);

                      //                       await cubit
                      //                           .downloadAndCacheSuraAudio(
                      //                         getSurahNameEnglish(surahNumber),
                      //                         getVerseCount(surahNumber),
                      //                         surahNumber,
                      //                         recitersList[getHiveSavedData(
                      //                                 "reciterIndex")]
                      //                             .identifier,
                      //                       );
                      //                       cubit.disposePlayer();

                      //                       if (state
                      //                           is QuranPagePlayerPlaying) {
                      //                         await showDialog(
                      //                             context: context,
                      //                             builder: (context) {
                      //                               return AlertDialog(
                      //                                 content: const Text(
                      //                                     "هل ترغب في إغلاق المشغل الحالي؟"),
                      //                                 actions: [
                      //                                   TextButton(
                      //                                     onPressed: () {
                      //                                       Navigator.pop(
                      //                                           context);
                      //                                     },
                      //                                     child: const Text(
                      //                                         "العودة"),
                      //                                   ),
                      //                                   TextButton(
                      //                                     onPressed: () {
                      //                                       cubit
                      //                                           .stopPlaying(); // Stops the player
                      //                                       Navigator.of(
                      //                                               context)
                      //                                           .pop();
                      //                                     },
                      //                                     child: const Text(
                      //                                         'إغلاق'),
                      //                                   ),
                      //                                 ],
                      //                               );
                      //                             });
                      //                       }
                      //                     }

                      //                     cubit.playFromVerse(
                      //                       verseNumber,
                      //                       recitersList[getHiveSavedData(
                      //                               "reciterIndex")]
                      //                           .identifier,
                      //                       surahNumber,
                      //                       getSurahNameEnglish(surahNumber),
                      //                     );
                      //                   },
                      //                   items: recitersList
                      //                       .asMap()
                      //                       .entries
                      //                       .map((entry) {
                      //                     int index = entry.key;
                      //                     QuranPageReciter reciter =
                      //                         entry.value;
                      //                     return DropdownMenuItem<int>(
                      //                       value:
                      //                           recitersList.indexOf(reciter),
                      //                       child: Text(
                      //                         reciter.name,
                      //                         maxLines: 1,
                      //                         overflow: TextOverflow.ellipsis,
                      //                         style: TextStyle(
                      //                           fontSize: 18.sp,
                      //                           color: Colors.black,
                      //                           fontWeight: FontWeight.w500,
                      //                           fontFamily: "Cairo",
                      //                         ),
                      //                       ),
                      //                     );
                      //                   }).toList(),
                      //                 ),
                      //                 IconButton(
                      //                     iconSize: 14.sp,
                      //                     onPressed: () {
                      //                       if (verseNumber["verseNumber"] !=
                      //                           1) {
                      //                         state.player.seek(Duration(
                      //                             milliseconds: state.durations
                      //                                 .where((element) =>
                      //                                     element[
                      //                                         "verseNumber"] ==
                      //                                     (verseNumber[
                      //                                             "verseNumber"] -
                      //                                         1))
                      //                                 .first["startDuration"]
                      //                                 .toInt()));
                      //                       }
                      //                     },
                      //                     icon: const Icon(Icons
                      //                         .arrow_forward_ios_outlined)),
                      //                 GestureDetector(
                      //                   onTap: () async {
                      //                     // setState(() {});
                      //                     state.player.playing
                      //                         ? state.player.pause()
                      //                         : state.player.play();
                      //                     await Future.delayed(const Duration(
                      //                         milliseconds: 300));

                      //                     // setState(() {});
                      //                     // setState(() {});
                      //                   },
                      //                   child: Container(
                      //                     height: 28.h,
                      //                     width: 28.h,
                      //                     decoration: BoxDecoration(
                      //                       color: secondColor,
                      //                       borderRadius:
                      //                           BorderRadius.circular(5.r),
                      //                     ),
                      //                     child: Center(
                      //                       child: Icon(
                      //                         state.player.playing
                      //                             ? Icons.pause
                      //                             : Icons.play_arrow,
                      //                         color: Colors.white,
                      //                         size: 14.sp,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 5.w,
                      //                 ),
                      //                 GestureDetector(
                      //                   onTap: () async {
                      //                     state.player.stop();
                      //                     cubit.stopPlaying();
                      //                     // setState(() {});
                      //                   },
                      //                   child: Container(
                      //                     height: 28.h,
                      //                     width: 28.h,
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.redAccent,
                      //                       borderRadius:
                      //                           BorderRadius.circular(5.r),
                      //                     ),
                      //                     child: Center(
                      //                       child: Icon(
                      //                         Icons.stop,
                      //                         size: 14.sp,
                      //                         color: Colors.white,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 IconButton(
                      //                     iconSize: 14.sp,
                      //                     onPressed: () {
                      //                       if (verseNumber["verseNumber"] <
                      //                           state.durations.length) {
                      //                         state.player.seek(Duration(
                      //                             milliseconds: state.durations
                      //                                 .where((element) =>
                      //                                     element[
                      //                                         "verseNumber"] ==
                      //                                     (verseNumber[
                      //                                             "verseNumber"] +
                      //                                         1))
                      //                                 .first["startDuration"]
                      //                                 .toInt()));
                      //                       }
                      //                     },
                      //                     icon: const Icon(
                      //                         Icons.arrow_back_ios_outlined)),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }