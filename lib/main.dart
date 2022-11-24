//Paquetes de terceros
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

//Data
import 'package:app_getx_bakapp/src/data/setting_data.dart';

import 'package:app_getx_bakapp/src/bindings/all_bindings.dart';
//Screens
import 'package:app_getx_bakapp/src/screens/screens.dart';
import 'package:hive_flutter/hive_flutter.dart';
//Controllers
import 'src/controllers/controllers.dart';
//Utils
import 'src/utils/theme_utils.dart';

void main() async {
  await GetStorage.init();
  await Hive.initFlutter();
  // Abrir boxes, donde recuerda que Theme se esta usando
  await Hive.openBox<dynamic>(AppHiveBoxes.settingsBoxName);
  MyBindings.initServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: controller.themeMode,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          title: 'Food Mobile App UI Design',
          initialBinding: MyBindings(),
          home: const SplashScreen(),
        );
      },
    );
  }
}
