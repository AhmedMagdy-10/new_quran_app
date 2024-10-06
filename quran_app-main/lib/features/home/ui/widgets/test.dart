import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class SimpleAlarmTest extends StatefulWidget {
  const SimpleAlarmTest({Key? key}) : super(key: key);

  @override
  State<SimpleAlarmTest> createState() => _SimpleAlarmTestState();
}

class _SimpleAlarmTestState extends State<SimpleAlarmTest> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _configureLocalNotifications();
  }

  Future<void> _configureLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // App icon

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleTestAlarm() async {
    // Get the current time and add 5 seconds for testing
    final DateTime now = DateTime.now();
    final DateTime testTime = now.add(const Duration(seconds: 5));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0, // Notification ID
      'Test Alarm',
      'The test alarm is ringing!',
      tz.TZDateTime.from(testTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'test_channel',
          'Test Alarm',
          importance: Importance.max,
          priority: Priority.high,
          sound: RawResourceAndroidNotificationSound(
              'azan'), // Test with a sound file
          playSound: true,
          enableVibration: true,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('Alarm scheduled for: $testTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Alarm Test'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _scheduleTestAlarm,
          child: const Text('Schedule Test Alarm'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SimpleAlarmTest()));
}
