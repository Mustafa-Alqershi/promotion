import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/controller/project_controller.dart';
import 'package:promotion/core/localization/changelocal.dart';
import 'package:promotion/view/screen/project_screen.dart';

import '../../controller/area_controller.dart';
import '../../controller/field_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/fieldModel.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'area.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  SectorController sectorController = Get.find();
  ProjectController projectController = Get.find();

  @override
  Widget build(BuildContext context) {
    projectController.getProject();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('الصندوق',
            style: TextStyle(
              fontFamily: 'NotoKufiArabic',
            )),
        centerTitle: true,
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
                        controller: sectorController.searchController,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontFamily: 'NotoKufiArabic', color: Colors.white),
                        // controller: _searchController,
                        decoration: const InputDecoration(
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
                            sectorController.search();
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
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: ()async{
            return   Get.find<ProjectController>().getProject();
          },
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              // IconButton(
              //     onPressed: () {
              //       Get.find<LocaleController>().changeLang('ar');
              //     },
              //     icon: const Icon(Icons.language)),
              Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BigText(text: '2'.tr),
                    )
                  ]),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: GetBuilder<SectorController>(builder: (controller) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.sectors.length,
                      itemBuilder: (context, index) {
                        Sector sector = controller.sectors[index];
                        return storeCardFeatured(sector);
                      });
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BigText(text: '3'.tr),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort_sharp,
                        color: Colors.blue,
                      )),
                ],
              ),
              Container(
                height: 135,
                width: double.infinity,
                child: GetBuilder<FieldController>(builder: (controller) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.fields.length,
                      itemBuilder: (context, index) {
                        Field field = controller.fields[index];
                        return storeCardFeatured2(field);
                      });
                }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.49,
                child: GetBuilder<ProjectController>(builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );

                  }

                  if(controller.noData==true && controller.isLoading==false){

                    return Center(child: Text('لايوجد بيانات ',style: TextStyle(color: Colors.black,fontSize: 20),),);
                  }else {
                    return ListView.builder(
                        itemCount: controller.projects.data.projects.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Project project =
                              controller.projects.data.projects[index];
                          return projectCardSmall(project);
                          // storeCartBig();
                        });
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectCardSmall(Project project) {
    return Card(
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color:  Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(
                      50,
                    ),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                image: DecorationImage(
                  image: AssetImage('assets/sfd.jpg'),
                  fit: BoxFit.cover,
                ),
              ),

            ),

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MediumText(text: project.name),
              Text(
                project.name,
                style:  TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'NotoKufiArabic'
                    ,fontSize: 15
                ),
              ),
              Text(
                'تاريخ التنفيذ'+project. plan.publishData,
                style:  TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'NotoKufiArabic'
                    ,fontSize: 10
                ),
              ),

              Row(
                children: [
                  Container(
                    // padding:
                    //     const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    // decoration: BoxDecoration(
                    //   color: Colors.blue.shade900,
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: TextButton(
                      onPressed: () {
                        Get.find<AreaController>().getAreaById(project.area.id);
                        Get.to(() => area());
                      },
                      child: Text(
                      'المنطقه'+' : - '+  project.area.name,
                        style:  TextStyle(
                          color: Colors.blue.shade900,
                          fontFamily: 'NotoKufiArabic'
                          ,fontSize: 13
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [

                  Container(
                    child: IconButton(
                      icon: Icon(Icons.menu_open,
                          size: 30,
                          color: Colors.blue
                              .shade900),
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder:
                        //       (BuildContext context) {
                        //     return AlertDialog(
                        //       title: const Text(
                        //         'المجالس',
                        //         textAlign:
                        //         TextAlign.center,
                        //         style: TextStyle(
                        //           fontFamily:
                        //           'NotoKufiArabic',
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       backgroundColor: Colors
                        //           .blue.shade900,
                        //       actions: <Widget>[
                        //         Row(
                        //           children: [
                        //             TextButton(
                        //               child: const Text(
                        //                 'تمويل',
                        //                 textAlign:
                        //                 TextAlign.center,
                        //                 style: TextStyle(
                        //                     fontFamily:
                        //                     'NotoKufiArabic',
                        //                     color: Colors
                        //                         .white),
                        //               ),
                        //               onPressed: () {
                        //
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //         Row(
                        //           children: [
                        //             TextButton(
                        //               child: const Text(
                        //                 'عرض تقرير الخطة',
                        //                 textAlign:
                        //                 TextAlign
                        //                     .center,
                        //                 style: TextStyle(
                        //                     fontFamily:
                        //                     'NotoKufiArabic',
                        //                     color: Colors
                        //                         .white),
                        //               ),
                        //               onPressed: () {
                        //                 // Get.to(() =>
                        //                 //     council());
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),

          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget storeCardFeatured(Sector sector) {
    return InkWell(
      onTap: () {
        Get.find<ProjectController>().getProjectsBySector(sector.id);
        Get.to(() => ProjectScreen(
              sector: sector.name,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 330,
            // height: 200,
            decoration: const BoxDecoration(
              // color: Colors.white12,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 300,
                    height: 140,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage('assets/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  // top:0,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      // const Spacer(),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade900,
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: Text(
                                   sector.name, style:TextStyle(color:Colors.white, fontFamily: 'NotoKufiArabic',fontSize: 16)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget storeCardFeatured2(Field field) {
    return InkWell(
      onTap: (){
        Get.find<ProjectController>().getProjectsByField(field.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Container(
            width: 100,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey.shade200),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 5,
                  right: 5,
                  left: 5,
                  child: Container(

                    width: 70,
                    height: 90,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(
                            50,
                          ),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                        image: AssetImage('assets/2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,

                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  field.name,
                                  style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontFamily: 'NotoKufiArabic',
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
