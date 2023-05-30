import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/controller/project_controller.dart';
import 'package:promotion/view/screen/project_screen.dart';

import '../../controller/field_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/fieldModel.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';

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
                      title: const Text(
                        'بحث',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.indigo.shade900,
                      content: TextField(
                        controller: sectorController.searchController,
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
                          child: const Text(
                            'الغاء',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'NotoKufiArabic',
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            'بحث',
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BigText(text: 'القطاعات'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sort_sharp,
                          color: Colors.indigo,
                        )),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                  ],
                ),
                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BigText(text: 'الفئات'),
                ),
                // Text('المتاجر  ',style: TextStyle(fontFamily: 'NotoKufiArabic'),),
              ],
            ),
            Container(
              height: 150,
              width: double.infinity,
              child:
              GetBuilder<FieldController>(builder: (controller) {
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.49,
              child: GetBuilder<ProjectController>(builder: (controller) {
                if(controller.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                else{
                  return
                    ListView.builder(
                        itemCount: controller.projects.data.projects.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Project project=controller.projects.data.projects[index];
                          return projectCardSmall(project);
                          // storeCartBig();
                        });
                }

              }),
            ),
          ],
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
          const Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MediumText(text: project.name),
              Row(children: [
                const SizedBox(
                  height: 5,
                ),
                Row(children: [
                  // SmallText(text: 'كم ', color: Colors.black),
                  // SmallText(text: '2.57 ', color: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                  // SmallText(text: '4.5', color: Colors.black),
                  const SizedBox(
                    width: 5,
                  ),
                  // const Icon(
                  //   Icons.star,
                  //   color: Colors.yellow,
                  //   size: 18,
                  // ),
                ]),
                const SizedBox(
                  width: 0,
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SmallText(
                          text:project.area.name, color: Colors.white)),
                ],
              ),
            ],
          ),
          // IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),

          // const SizedBox(width: 10,),
          const SizedBox(
            width: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/sfd.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget storeCardFeatured(Sector sector) {
    return InkWell(
      onTap: () {
        Get.find<ProjectController>().getProjectsBySector(sector.id);
        Get.to(() => ProjectScreen(sector: sector.name,));
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
                  left: 0,
                  right: 60,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      const Spacer(),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade900,
                              // border: Border.all(color: Colors.grey),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80),
                              child:
                              MediumText(
                                  text: sector.name, color: Colors.white),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 100,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.blue.shade900),
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
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(
                          20,
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
                bottom: 10,
                left: 0,
                right: 9,
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            color: Colors.blue.shade700,
                            // border: Border.all(color: Colors.grey),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                field.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoKufiArabic',
                                    fontSize: 15),
                              )),
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
    );
  }
}
