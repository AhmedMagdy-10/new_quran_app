import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';

import 'package:quran_app/features/home/ui/widgets/feature_item.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final jHijri1 =
        JHijri(fDate: DateTime.now(), fDisplay: DisplayFormat.DDDMMMYYYY);

    initializeDateFormatting("ar_SA", null);
    var currentDate = DateTime.now();
    var formatDate = DateFormat.yMMMMEEEEd('ar').format(currentDate);

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              jHijri1.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              formatDate,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 16.h,
            ),
            const FeaturesItemList(),
          ],
        ),
      ),
    );
  }
}
