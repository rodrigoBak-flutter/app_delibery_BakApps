//Paquetes de terceros
import 'package:get/get.dart';

///Controllers
import '../controllers/controllers.dart';
//Data

import '../data/setting_data.dart';
import '../data/settingiS_data.dart';

//Clase que maneja los estados
class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => TabBarController());
    Get.lazyPut(() => SwitchController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => MainDrawerController());
    Get.lazyPut(() => DiscountController());
  }
  static void initServices() {
    Get.lazyPut<ISettings>(() => Settings());
    Get.put(AppController());
  }
}


