import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/area_controller.dart';
import '../../controller/field_controller.dart';
import '../../controller/locale_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/area_with_child.dart';
import '../../model/fieldModel.dart';
import 'council.dart';

class area extends StatefulWidget {
  SectorController sectorController = Get.find();

  // AreaController areaController = Get.find();

  @override
  _areaState createState() => _areaState();
}

class _areaState extends State<area> {
  AreaController areaController = Get.find();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المناطق'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.search, size: 30),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        '5'.tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.blue.shade900,
                      content: TextField(
                        // controller: sectorController.searchController,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'NotoKufiArabic', color: Colors.white),
                        // controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'ادخل للبحث',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoKufiArabic',
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            '6'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            '5'.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white),
                          ),
                          onPressed: () {
                            // sectorController.search();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          GetBuilder<AreaController>(builder: (controller) {
            if(controller.isLoad==true){
              return Center(child: CircularProgressIndicator(),);
            }
            if(controller.noData==true){
              return Center(child: Text('لايوجد بيانات',style: TextStyle(fontSize: 20,color: Colors.black),),);
            }
            return Container(
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border:
                          Border.all(width: 2, color: Colors.blue.shade900),
                          color: Colors.blue.shade900,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.account_balance,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        areaController.area.area.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Card(
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        ...ListTile.divideTiles(
                                          color: Colors.grey,
                                          tiles: [
                                            ListTile(
                                              contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 0),
                                              trailing: IconButton(
                                                icon: Icon(Icons.menu_open,
                                                    size: 30,
                                                    color: Colors.blue
                                                        .shade900),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                          'المجالس',
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                            'NotoKufiArabic',
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        backgroundColor: Colors
                                                            .blue.shade900,
                                                        actions: <Widget>[
                                                          Row(
                                                            children: [
                                                              TextButton(
                                                                child: const Text(
                                                                  'عرض المجلس المحلي',
                                                                  textAlign:
                                                                  TextAlign.center,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'NotoKufiArabic',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                onPressed: () {
                                                                  Get.find<LocalController>().getLocaleByArea(controller.area.id);
                                                                  Get.to(() =>
                                                                      council());
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextButton(
                                                                child: const Text(
                                                                  'عرض المجلس المجتمعي',
                                                                  textAlign:
                                                                  TextAlign
                                                                      .center,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      'NotoKufiArabic',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                onPressed: () {
                                                                  Get.to(() =>
                                                                      council());
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              title: const Text(
                                                " المنطقة",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                              subtitle: Text(
                                                areaController.area.area.name,
                                                style: TextStyle(
                                                  fontFamily: 'NotoKufiArabic',
                                                  fontSize: 15,
                                                  color: Colors.blue.shade900,
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 0),
                                              title: const Text(
                                                "نوع المنطقة",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                              subtitle: Text(
                                                areaController.area.area.type.name,
                                                style: TextStyle(
                                                  fontFamily: 'NotoKufiArabic',
                                                  fontSize: 15,
                                                  color: Colors.blue.shade900,
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              title: const Text(
                                                "عدد السكان",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'NotoKufiArabic',
                                                ),
                                              ),
                                              subtitle: Text(
                                                areaController.area.area.countPeople,
                                                style: TextStyle(
                                                  fontFamily: 'NotoKufiArabic',
                                                  fontSize: 15,
                                                  color: Colors.blue.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "المناطق التابعة له",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          GetBuilder<AreaController>(builder: (controller) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.area.area.child2.length,
                                itemBuilder: (context, index) {
                                  Child2 child = controller.area.area.child2[index];
                                  return areaCard(child);
                                });
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ]),
      ),
    );
  }
}

Widget areaCard(Child2 child) {
  return InkWell(
    onTap: (){
      Get.find<AreaController>().getAreaById(child.id);
      Get.to(area());
    },
    child: Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black38),
        borderRadius: BorderRadius.all(Radius.circular(300)),
      ),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: 100,
        height: 200,
        child: Center(
          child: ListTile(
            title: Text(
              child.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: 'NotoKufiArabic',
              ),
            ),
            subtitle: Text(

              child.id.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontFamily: 'NotoKufiArabic',
                  fontSize: 15),
            ),
          ),
        ),
      ),
    ),
  );
}
