import 'dart:async';
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class CounterTimer extends StatefulWidget {
  const CounterTimer({super.key, required this.prayerTime});
  final DateTime prayerTime;

  @override
  State<CounterTimer> createState() => _CounterTimerState();
}

class _CounterTimerState extends State<CounterTimer> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _configureLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Add your app icon

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleAzanNotification(DateTime prayerTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'الصلاة',
      'حان الأن موعد أذان الفجر',
      tz.TZDateTime.from(prayerTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'azan_channel',
          'Azan Notification',
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound('assets/audio/azan.mp3'),
          playSound: true,
          enableVibration: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  bool isAlarmRinging = false;
  Future<void> setAlarm(int id, DateTime dt, String locale) async {
    final alarmModel = AlarmSettings(
      notificationSettings: const NotificationSettings(
        title: 'الصلاة',
        body: 'حان الأن موعد أذان الفجر',
        stopButton: '',
      ),
      id: id,
      dateTime: dt,
      assetAudioPath: 'assets/audio/azan.mp3',
      volume: 0.5,
      vibrate: true,
      loopAudio: true,
    );

    await Alarm.set(alarmSettings: alarmModel);
  }

  void _stopAlarm() async {
    // Stop the alarm audio and reset the flag
    await Alarm.stop(1); // Stop the alarm with id 1
    setState(() {
      isAlarmRinging = false;
    });
  }

  Future<void> _triggerAlarm() async {
    // Play the azan sound or alarm sound
    await setAlarm(1, widget.prayerTime, 'ar');
    // Show a notification or alert that the prayer time has arrived
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('وقت الصلاة'),
          content: const Text('حان الآن موعد الصلاة'),
          actions: [
            TextButton(
              onPressed: () {
                // Stop the alarm when the user clicks "OK"
                _stopAlarm();
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  late Timer _timer;

  Duration _difference = Duration.zero;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      calculateDifference();
      tz.initializeTimeZones();
      _configureLocalNotifications();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void calculateDifference() {
    final now = DateTime.now();
    if (widget.prayerTime.isAfter(now)) {
      setState(() {
        _difference = widget.prayerTime.difference(now);
      });
    } else {
      _difference = Duration.zero;
      _triggerAlarm();
      isAlarmRinging = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    int hours = _difference.inHours;
    int minutes = _difference.inMinutes.remainder(60);
    int seconds = _difference.inSeconds.remainder(60);

    return Text(
      'الباقي من الزمن  ${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} :${seconds.toString().padLeft(2, '0')}',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 17.sp,
            color: const Color(0xff385974),
          ),
    );
  }
}
