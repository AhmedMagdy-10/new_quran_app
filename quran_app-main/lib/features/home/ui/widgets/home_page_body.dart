import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:quran_app/core/helper/convert_prayer_name.dart';
import 'package:quran_app/features/home/logic/cubits/main_cubit.dart';
import 'package:quran_app/features/home/logic/cubits/main_cubit_states.dart';

import 'package:quran_app/features/home/ui/widgets/feature_item.dart';
import 'package:quran_app/features/home/ui/widgets/still_in_time.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final jHijri1 =
        JHijri(fDate: DateTime.now(), fDisplay: DisplayFormat.DDDMMMYYYY);

    initializeDateFormatting("ar_SA", null);
    var currentDate = DateTime.now();
    var formatDate = DateFormat.yMMMMEEEEd('ar').format(currentDate);

    return BlocBuilder<MainCubit, MainCubitStates>(builder: (context, state) {
      PrayerTimes prayerTimes =
          BlocProvider.of<MainCubit>(context).prayerTimes!;
      print('+++++++++++++++++ ${prayerTimes.fajr}');
      var next = prayerTimes.nextPrayer();

      var nextPrayer =
          (prayerTimes.timeForPrayer(next) ?? prayerTimes.fajr).toLocal();

      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Center(
          child: Column(
            children: [
              // Text(
              //   jHijri1.toString(),
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              Text(
                formatDate,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: 'Cairo'),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                prayerTimeToString(next.name),
                style: Theme.of(context).textTheme.titleLarge,
              ),

              Text(
                DateFormat('hh:mm a').format(nextPrayer),
                style: Theme.of(context).textTheme.titleLarge,
              ),

              CounterTimer(prayerTime: nextPrayer),

              SizedBox(
                height: 16.h,
              ),

              const FeaturesItemList(),
            ],
          ),
        ),
      );
    });
  }
}
