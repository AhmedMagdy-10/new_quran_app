import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app/constant/colors.dart';
import 'package:quran_app/core/helper/hive_helper.dart';
import 'package:quran_app/core/helper/show_toast_state.dart';
import 'package:quran_app/features/quranDetails/logic/translation/translationdata.dart';

class AvailabeTafsserBooksSheet extends StatefulWidget {
  const AvailabeTafsserBooksSheet({
    super.key,
    required this.appDir,
    required this.isDownloading,
    required this.getTranslationData,
  });

  final Directory appDir;
  final String isDownloading;
  final dynamic getTranslationData;

  @override
  State<AvailabeTafsserBooksSheet> createState() =>
      _AvailabeTafsserBooksSheetState();
}

class _AvailabeTafsserBooksSheetState extends State<AvailabeTafsserBooksSheet> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () async {
            showMaterialModalBottomSheet(
              enableDrag: true,
              animationCurve: Curves.easeInOutQuart,
              elevation: 0,
              bounce: true,
              duration: const Duration(milliseconds: 150),
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          " كتب التفسير",
                          style: TextStyle(
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: index ==
                                            getHiveSavedData("addTafseerValue")
                                        ? specialColor.withOpacity(0.5)
                                        : Colors.transparent,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await downLoadTafsserBook(index, context,
                                          widget.getTranslationData);
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 8.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              translationDataList[index]
                                                  .typeTextInRelatedLanguage,
                                              textDirection: TextDirection.rtl,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontFamily: 'Cairo',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          widget.isDownloading !=
                                                  translationDataList[index].url
                                              ? Icon(index == 0 || index == 10
                                                  ? Icons.storage_rounded
                                                  : File("${widget.appDir.path}/${translationDataList[index].typeText}.json")
                                                          .existsSync()
                                                      ? Icons.done_all
                                                      : Icons
                                                          .cloud_download_rounded)
                                              : const SpinKitWaveSpinner(
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                    color: fiveColor,
                                  ),
                              itemCount: translationDataList.length),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 45.h,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
                color: specialColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    translationDataList[
                            getHiveSavedData("addTafseerValue") ?? 0]
                        .typeTextInRelatedLanguage,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Cairo'),
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    size: 24.sp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> downLoadTafsserBook(
      int index, BuildContext context, dynamic getTranslationData) async {
    PermissionStatus storageStatus = await Permission.storage.request();
    PermissionStatus mediaStatus =
        await Permission.accessMediaLocation.request();
    PermissionStatus manageStatus =
        await Permission.manageExternalStorage.request();
    final fileExists = File(
            "${widget.appDir.path}/${translationDataList[index].typeText}.json")
        .existsSync();
    final translation = translationDataList[index];

    if (widget.isDownloading != translation.url) {
      if (fileExists || index == 0 || index == 10) {
        updateHiveSavedData('addTafseerValue', index);
        setState(() {});
      } else {
        if (storageStatus.isGranted && manageStatus.isGranted) {
        } else if (storageStatus.isPermanentlyDenied &&
            manageStatus.isPermanentlyDenied) {
          await openAppSettings();
        } else if (storageStatus.isDenied) {
          print('Premission is denied');
        }
        Dio()
            .download(translation.url,
                "${widget.appDir.path}/${translation.typeText}.json")
            .then((e) {
          showToast(text: 'تم تنزيل الكتاب بنجح', state: ToastStates.success);
          updateHiveSavedData('addTafseerValue', index);
        }).catchError((e) {
          showToast(text: 'تحقق من اتصالك بنترنت', state: ToastStates.error);
        });
      }
      setState(() {});

      getTranslationData();
    }
    setState(() {});

    if (mounted) {
      Navigator.pop(context);
    }
  }
}
