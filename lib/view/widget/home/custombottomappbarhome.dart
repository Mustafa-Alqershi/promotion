import 'package:promotion/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/home.dart';
import '../../screen/sector_screen.dart';
abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 3;

  List<Widget> listPage = [
     HomePage(),
    SectorScreen() ,
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    HomePage()
  ];

  List bottomappbar = [

    {"title": "n", "icon": Icons.notifications_active_outlined},
    {"title": "القطاعات", "icon": Icons.person_pin_sharp},
    {"title": "settings", "icon": Icons.settings},
    {"title": "home", "icon": Icons.home},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}
