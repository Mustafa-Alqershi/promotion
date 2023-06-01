import 'package:promotion/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screen/Menu.dart';
import '../../screen/home.dart';
import '../../screen/sector_screen.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    HomePage(),
    SectorScreen(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text("Profile"))],
    ),
    Menu(),
  ];

  List bottomappbar = [
    {"title": "الرئيسية", "icon": Icons.home},
    {"title": "القطاعات", "icon": Icons.account_balance},
    {"title": "الملف الشخصي", "icon": Icons.account_circle_rounded},
    {"title": "القائمة", "icon": Icons.menu},
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
          color: Colors.blue.shade900,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
              ),
            )));
  }
}
