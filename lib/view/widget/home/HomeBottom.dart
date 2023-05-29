import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'color.dart';
import 'custombottomappbarhome.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          // floatingActionButton: FloatingActionButton(
          //     backgroundColor: AppColor.primaryColor,
          //     onPressed: () {
          //       // Get.toNamed(AppRoute.cart) ;
          //     },
          //     child: const Icon(Icons.shopping_basket_outlined)),
          // floatingActionButtonLocation:
          // FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        ));
  }
}
