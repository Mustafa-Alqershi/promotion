import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:promotion/controller/project_controller.dart';
import 'package:promotion/core/localization/changelocal.dart';
import 'package:promotion/view/screen/pdf_screen.dart';
import 'package:promotion/view/screen/project_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/area_controller.dart';
import '../../controller/field_controller.dart';
import '../../controller/locale_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/fieldModel.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'area.dart';
import 'council.dart';

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
        title: const Text('تواصل تنموي',
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
          onRefresh: () async {
            return Get.find<ProjectController>().getProject();
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
                        return storeCardFeatured3(sector);
                      });
                }),
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: GetBuilder<SectorController>(builder: (controller) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.sectors.length,
                        itemBuilder: (context, index) {
                          Sector sector = controller.sectors[index];
                          return storeCardFeatured2(sector);
                        });
                  }),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: GetBuilder<ProjectController>(builder: (controller) {
                    if (controller.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (controller.noData == true &&
                        controller.isLoading == false) {
                      return Center(
                        child: Text(
                          'لايوجد بيانات ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: controller.projects.data.projects.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            Project project =
                                controller.projects.data.projects[index];
                            return storeCardFeatured(project);
                            // storeCartBig();
                          });
                    }
                  }),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 10,
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
                color: Colors.blue,
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
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'NotoKufiArabic',
                    fontSize: 15),
              ),
              Text(
                'تاريخ التنفيذ' + project.plan.publishData,
                style: TextStyle(
                    color: Colors.blue.shade900,
                    fontFamily: 'NotoKufiArabic',
                    fontSize: 10),
              ),

              Row(
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Get.find<AreaController>().getAreaById(project.area.id);
                        Get.to(() => area());
                      },
                      child: Text(
                        'المنطقه' + ' : - ' + project.area.name,
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'NotoKufiArabic',
                            fontSize: 13),
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
                          size: 30, color: Colors.blue.shade900),
                      onPressed: () {
                        var login =GetStorage().read('login')??false;
                        var type =GetStorage().read('type')??"";
                        if(login==true){
                          if(type=="investor") {
                            Get.defaultDialog(
                              title: '',
                              backgroundColor: Colors.blue.shade900,
                              content: Column(children: [
                                const Text(
                                  '',
                                  textAlign:
                                  TextAlign.center,
                                  style: TextStyle(
                                    fontFamily:
                                    'NotoKufiArabic',
                                    color: Colors.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      child:  Text(
                                        '49'.tr,
                                        textAlign:
                                        TextAlign.center,
                                        style: TextStyle(
                                            fontFamily:
                                            'NotoKufiArabic',
                                            color: Colors
                                                .white),
                                      ),
                                      onPressed: () {
                                        var url = Uri.parse('mailto:${project
                                            .email}?subject=News&body=مرحبا');
                                        _launchUrl(url);
                                        // Get.find<LocalController>().getLocaleByArea(project.area.id);
                                        // Get.to(() =>
                                        //     council());
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      child:  Text(
                                        '50'.tr,
                                        textAlign:
                                        TextAlign
                                            .center,
                                        style: TextStyle(
                                            fontFamily:
                                            'NotoKufiArabic',
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        print(project.file.toString());
                                        Get.to(PDFScreen(
                                            path: "https://topsoftp.com/sfd/storage/app/" +
                                                project.file.toString()));
                                        // Get.to(() =>
                                        //     council());
                                      },
                                    ),
                                  ],
                                ),
                              ],),
                            );
                          }
                        }
                        Get.defaultDialog(
                          content: Column(
                            children: [],
                          ),
                        );
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

  Widget storeCardFeatured(Project project) {
    return Card(
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),
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
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/sfd.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -5,
              left: 0,
              right: 0,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      MediumText(
                        text: project.name,
                        color: Colors.black,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<AreaController>()
                              .getAreaById(project.area.id);
                          Get.to(() => area());
                        },
                        child: Text(
                          'المنطقه' + ' : - ' + project.area.name,
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontFamily: 'NotoKufiArabic',
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                left: 10,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(),
                  child: IconButton(
                    icon: Icon(Icons.menu_open,
                        size: 30, color: Colors.blue.shade900),
                    onPressed: () {},
                    // onPressed: () {
                    //   Get.defaultDialog(
                    //     content: Column(
                    //       children: [],
                    //     ),
                    //   );
                    //   showDialog(
                    //     context: context,
                    //     builder:
                    //         (BuildContext context) {
                    //       return AlertDialog(
                    //         title: const Text(
                    //           'المجالس',
                    //           textAlign:
                    //           TextAlign.center,
                    //           style: TextStyle(
                    //             fontFamily:
                    //             'NotoKufiArabic',
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         backgroundColor: Colors
                    //             .blue.shade900,
                    //         actions: <Widget>[
                    //           Row(
                    //             children: [
                    //               TextButton(
                    //                 child: const Text(
                    //                   'تمويل',
                    //                   textAlign:
                    //                   TextAlign.center,
                    //                   style: TextStyle(
                    //                       fontFamily:
                    //                       'NotoKufiArabic',
                    //                       color: Colors
                    //                           .white),
                    //                 ),
                    //                 onPressed: () {
                    //
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //           Row(
                    //             children: [
                    //               TextButton(
                    //                 child: const Text(
                    //                   'عرض تقرير الخطة',
                    //                   textAlign:
                    //                   TextAlign
                    //                       .center,
                    //                   style: TextStyle(
                    //                       fontFamily:
                    //                       'NotoKufiArabic',
                    //                       color: Colors
                    //                           .white),
                    //                 ),
                    //                 onPressed: () {
                    //                   // Get.to(() =>
                    //                   //     council());
                    //                 },
                    //               ),
                    //             ],
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget storeCardSmall(Project project) {
    return Card(
      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Row(
              children: [
                SmallText(
                  text: 'شهر',
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: project.plan.timePeriod,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: 'الفترة',
                  color: Colors.black,
                ),
              ],
            ),
            Row(
              children: [
                SmallText(
                  text: project.plan.theFinancialCost.toString(),
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                SmallText(
                  text: 'التكلفة',
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
        // MediumText(text: project.sector.name,color: Colors.black,),
        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  var login = GetStorage().read('login') ?? false;
                  var type = GetStorage().read('type') ?? "";
                  if (login == true) {
                    if (type == "investor") {
                      Get.defaultDialog(
                        title: '',
                        backgroundColor: Colors.blue.shade900,
                        content: Column(
                          children: [
                            const Text(
                              '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  child: Text(
                                    '49'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'NotoKufiArabic',
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    var url = Uri.parse(
                                        'mailto:${project.email}?subject=News&body=مرحبا');
                                    _launchUrl(url);
                                    // Get.find<LocalController>().getLocaleByArea(project.area.id);
                                    // Get.to(() =>
                                    //     council());
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  child: Text(
                                    '50'.tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'NotoKufiArabic',
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    print(project.file.toString());
                                    Get.to(PDFScreen(
                                        path:
                                            "https://topsoftp.com/sfd/storage/app/" +
                                                project.file.toString()));
                                    // Get.to(() =>
                                    //     council());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: MediumText(
                  text: project.name,
                  color: Colors.black,
                )),
            // MediumText(text: project.sector.name,color: Colors.black,),
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
                  'المنطقه' + ' : - ' + project.area.name,
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontFamily: 'NotoKufiArabic',
                      fontSize: 13),
                ),
              ),
            ),

            Row(children: [
              SizedBox(
                height: 5,
              ),
              Row(children: [
                SmallText(
                    text: project.plan.publishData.substring(0, 10),
                    color: Colors.black),
                SizedBox(
                  width: 5,
                ),
                // MediumText(text: project.sector.name,color: Colors.black,),
                SmallText(text: project.plan.name, color: Colors.black),
              ]),
              SizedBox(
                width: 0,
              ),
            ]),
            const SizedBox(
              height: 5,
            ),

            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/sfd.jpg'),
              // NetworkImage(project.plan.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }

  Widget storeCardFeatured3(Sector sector) {
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
                              child: Text(sector.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'NotoKufiArabic',
                                      fontSize: 16)),
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

  Widget storeCardFeatured2(Sector sector) {
    return InkWell(
        onTap: () {
          Get.find<ProjectController>().getProjectsBySector(sector.id);
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
            height: 50,
            child: Center(
              child: ListTile(
                title: Text(
                  sector.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'NotoKufiArabic',
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
