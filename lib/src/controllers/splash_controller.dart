import 'package:app_getx_bakapp/src/navigator.dart';
import 'package:app_getx_bakapp/src/screens/introduction.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
//



class SplashController extends GetxController {
  /// For showing introduction screen just once
  final box = GetStorage();
  bool get showIntro => box.read('showIntro') ?? true;
  void changeBool(bool val) {
    box.write('showIntro', val);
    update();
  }

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Get.offAll(
            () => showIntro == true
                ? const IntroductionScreen()
                :  MainNavigator(),
            transition: Transition.cupertino);
      },
    );
    super.onInit();
  }
}
