//Paquetes de terceros
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//Data
import 'package:app_getx_bakapp/src/data/settingiS_data.dart';

//Utils
import 'package:app_getx_bakapp/src/utils/theme_utils.dart';

class AppController extends GetxController {
  final ISettings settings = Get.find();

  ThemeData get theme {
    return settings.isDarkTheme() ? AppTheme.dark() : AppTheme.light();
  }

  ThemeMode get themeMode {
    return settings.isDarkTheme() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme(bool value) {
    settings.setDarkThemeValue(value);
    Get.changeThemeMode(themeMode);
    Get.changeTheme(theme);
    setStatusBarIconsColor();
    update();
  }

  void setStatusBarIconsColor() {
    SystemChrome.setSystemUIOverlayStyle(settings.isDarkTheme()
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark);
  }

  void toggleTheme() {
    changeTheme(!settings.isDarkTheme());
  }

  @override
  void onDetached() {
    print('AppStatus change: Detached');
  }

  @override
  void onInactive() {
    print('AppStatus change: Inactive');
  }

  @override
  void onPaused() {
    print('AppStatus change: Paused');
  }

  @override
  void onResumed() {
    print('AppStatus change: Resumed');
  }
}
