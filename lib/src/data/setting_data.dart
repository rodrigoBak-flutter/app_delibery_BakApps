import 'package:get/get.dart';
import 'package:hive/hive.dart';
//Data
import 'package:app_getx_bakapp/src/data/settingiS_data.dart';

class AppHiveKeys {
  // keys
  static const darkMode = 'darkMode';
}

class AppHiveBoxes {
  static const categoriesBoxName = 'categories';
  static const transactionsBoxName = 'transactions';
  static const settingsBoxName = 'settings';
}

class Settings extends ISettings {
  final Box box = Hive.box(AppHiveBoxes.settingsBoxName);

  @override
  bool isDarkTheme() {
    bool? value = box.get(AppHiveKeys.darkMode);
    return value == null ? Get.isPlatformDarkMode : value;
  }

  @override
  void setDarkThemeValue(bool value) {
    box.put(AppHiveKeys.darkMode, value);
  }
}
