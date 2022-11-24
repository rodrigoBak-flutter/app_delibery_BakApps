import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
//Screens
import 'package:app_getx_bakapp/src/screens/screens.dart';
//Navigator
import 'package:app_getx_bakapp/src/navigator.dart';

class SplashController extends GetxController {
  /// Mostrar la introduccion
  final box = GetStorage();
  bool get showIntro => box.read('showIntro') ?? true;
  void changeBool(bool val) {
    box.write('showIntro', val);
    update();
  }

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAll(
            () => showIntro == true
                ? const IntroductionScreen()
                : const MainNavigator(),
            transition: Transition.cupertino);
      },
    );
    super.onInit();
  }
}
