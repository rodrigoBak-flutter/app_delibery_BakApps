//Paquetes de terceros
import 'package:get/get.dart';

///Controllers
import '../controllers/controllers.dart';

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
}
