//Paquetes de terceros
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

//Screens
import 'package:app_getx_bakapp/src/screens/screens.dart';
import 'package:app_getx_bakapp/src/screens/wallet.dart';

//Controllers
import 'controllers/controllers.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  // Screens
  final List<Widget> screens = const [
    HomeScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    /// Controller
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = Get.find<NavigatorController>();
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          /// Screens
          body: GetBuilder<NavigatorController>(
              id: "change NavBar Index",
              builder: (context) {
                return screens[_controller.currentIndex];
              }),

          /// bottomNavigationBar
          bottomNavigationBar: GetBuilder<NavigatorController>(
              id: "change NavBar Index",
              builder: (context) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: CustomNavigationBar(
                    elevation: 40,
                    iconSize: 30.0,
                    scaleFactor: 0.3,
                    borderRadius: const Radius.circular(20),
                    unSelectedColor: Colors.black,
                    strokeColor: Colors.white,
                    backgroundColor: Colors.orange,
                    selectedColor: Colors.white,
                    isFloating: true,
                    currentIndex: _controller.currentIndex,
                    onTap: (index) {
                      _controller.changeNavBarIndex(index);
                    },
                    items: [
                      /// Home
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.home,
                        ),
                      ),

                      /// Wallet
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.wallet,
                        ),
                      ),

                      /// User Profile
                      CustomNavigationBarItem(
                        icon: const Icon(
                          LineIcons.user,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      );
    } else {
      return const LandScape();
    }
  }
}
