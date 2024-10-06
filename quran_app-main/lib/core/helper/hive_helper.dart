import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

hiveHelperInit() async {
  try {
    var appDirectory = await getApplicationDocumentsDirectory();
    print(appDirectory.path);
    Hive.init(appDirectory.path);
    await Hive.openBox('data');
  } catch (e) {
    print("Error initializing Hive: $e");
  }
}

savedDateHive(String fieldName, dynamic value) async {
  if (Hive.box('data').get(fieldName) == null) {
    await Hive.box('data').put(fieldName, value);
  }
}

getHiveSavedData(fieldName) {
  return Hive.box('data').get(fieldName);
}

bool getHiveSavedDataBool(String fieldName, {bool defaultValue = false}) {
  var value = Hive.box('data').get(fieldName);
  if (value == null || value is! bool) {
    return defaultValue;
  }
  return value;
}

updateHiveSavedData(fieldName, value) {
  Hive.box('data').put(fieldName, value);
}
