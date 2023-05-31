import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/view/screen/project_screen.dart';

import '../../controller/project_controller.dart';
import '../../controller/sector_controller.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/medium_text.dart';
class SectorScreen extends StatelessWidget {
   SectorScreen({Key? key}) : super(key: key);

  SectorController sectorController=Get.find();
  @override
  Widget build(BuildContext context) {
    sectorController.getSector();
    return Scaffold(
      appBar: AppBar(),
      body:GetBuilder<SectorController>(builder: (controller) {
        if(controller.isLoad){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return Container(
            // height: 700,
            // width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.sectors.length,
                itemBuilder: (context, index) {
                  Sector sector = controller.sectors[index];
                  return storeCardFeatured(sector);
                }),
          );
        }
      }),

    );
  }
  Widget storeCardFeatured(Sector sector) {
    return Container(
      height: 150,
      child: InkWell(
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
                   
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                    horizontal: 50),
                                child:
                                Center(
                                  child: MediumText(
                                      text: sector.name, color: Colors.white),
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
      ),
    );
  }

}
