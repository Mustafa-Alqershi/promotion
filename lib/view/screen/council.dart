import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/field_controller.dart';
import '../../controller/locale_controller.dart';
import '../../controller/project_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/area_with_child.dart';
import '../../model/fieldModel.dart';
import '../../model/local_with_child.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/medium_text.dart';
import 'area.dart';

class council extends StatefulWidget {
  SectorController sectorController = Get.find();

  @override
  _councilState createState() => _councilState();
}

class _councilState extends State<council> {
  LocalController localController = Get.find();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'المجالس',
          style: TextStyle(
            fontFamily: 'NotoKufiArabic',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          GetBuilder<LocalController>(builder: (controller) {
            if(controller.isLoad==true){
              return const Center(child: CircularProgressIndicator(),);
            }
            else {
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
                            border: Border.all(
                                width: 2, color: Colors.blue.shade900),
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
                            Icons.gpp_good,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "المجلس المحلي",
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
                                          ListTile(
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 15,
                                                vertical: 0),
                                            title: const Text(
                                              " المنطقة",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'NotoKufiArabic',
                                              ),
                                            ),
                                            subtitle: Text(
                                              controller.locale.area.name,
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
                                              controller.locale.area.type.name,
                                              style: TextStyle(
                                                fontFamily: 'NotoKufiArabic',
                                                fontSize: 15,
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              "عدد المناطق",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'NotoKufiArabic',
                                              ),
                                            ),
                                            subtitle: Text(
                                            controller.locale.area.child2.length.toString(),
                                              style: TextStyle(
                                                fontFamily: 'NotoKufiArabic',
                                                fontSize: 15,
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text(
                                              "عدد الاعضاء",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'NotoKufiArabic',
                                              ),
                                            ),
                                            subtitle: Text(
                                              controller.locale.area.child2.length.toString(),
                                              style: TextStyle(
                                                fontFamily: 'NotoKufiArabic',
                                                fontSize: 15,
                                                color: Colors.blue.shade900,
                                              ),
                                            ),
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
                        const SizedBox(
                          height: 10,
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
                            GetBuilder<LocalController>(builder: (controller) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.locale.area.child2
                                      .length,
                                  itemBuilder: (context, index) {
                                    ChildArea child = controller.locale.area
                                        .child2[index];
                                    return storeCardFeatured2(child);
                                  });
                            }),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "اعضاء المجلس",
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
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Card(
                                child: Container(
                                  alignment: Alignment.topRight,
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
                                                EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 0),
                                                title: TextField(
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'NotoKufiArabic',
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'بحث عن الاعضاء',
                                                    hintStyle: TextStyle(
                                                      color: Colors.blue
                                                          .shade900,
                                                      fontFamily: 'NotoKufiArabic',
                                                    ),
                                                  ),
                                                ),

                                                trailing: Icon(Icons.search,
                                                    size: 30,
                                                    color: Colors.blue
                                                        .shade900),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              ListTile(
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 0),
                                                leading:  Icon(Icons.person,
                                                    size: 30,
                                                    color: Colors.blue
                                                        .shade900),trailing:    Icon(Icons.star,
                                                  size: 30,
                                                  color: Colors.blue
                                                      .shade900),

                                                title: Text(controller.locale.member.name,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'NotoKufiArabic',
                                                  ),
                                                ),
                                              ),
                                              // ListView.separated(itemBuilder: (context,index){
                                              //   return Text(controller.locale.area.child2[index].name);
                                              // }, separatorBuilder: (context,index){
                                              //   return Divider();
                                              // }, itemCount: controller.locale.area.child2.length),
                                        ],
                                      )
                                    ],
                                  ),
                               ] ),
                              )
                            ),
                         ]),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
        ]),
      ),
    );
  }
}

Widget storeCardFeatured2(ChildArea child) {
  return Card(
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
              fontSize: 12,
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
  );
}
