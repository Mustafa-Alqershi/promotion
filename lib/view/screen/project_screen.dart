import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:promotion/controller/project_controller.dart';
import 'package:promotion/view/screen/pdf_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/area_controller.dart';
import '../../model/projectModel.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
import 'area.dart';

class ProjectScreen extends StatelessWidget {
  String sector = '';
  ProjectScreen({Key? key, required this.sector}) : super(key: key);
  ProjectController projectController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sector),
      ),
      body: GetBuilder<ProjectController>(builder: (controller) {
        if (controller.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            height: 600,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.projects.data.projects.length,
                itemBuilder: (context, index) {
                  Project project = controller.projects.data.projects[index];
                  print(project.name);
                  print("-----------------------0000000000000000000000");
                  return storeCardSmall(project);
                }),
          );
        }
      }),
    );
  }
}

Widget storeCardSmall(Project project) {
  return Card(
    child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Row(
                children: [
                  SmallText(text: 'شهر',color: Colors.black,),
                  SizedBox(width: 5,),
                  SmallText(text: project.plan.timePeriod,color: Colors.black,),
                  SizedBox(width: 5,),
                  SmallText(text: 'الفترة',color: Colors.black,),
                ],
              ),
              Row(
                children: [
                  SmallText(text: project.plan.theFinancialCost.toString(),color: Colors.black,),
                  SizedBox(width: 5,),
                  SmallText(text: 'التكلفة',color: Colors.black,),
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
                  onTap: (){
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


                  },
                  child: MediumText(text: project.name,color: Colors.black,)),
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
                    'المنطقه'+' : - '+  project.area.name,
                    style:  TextStyle(
                        color: Colors.blue.shade900,
                        fontFamily: 'NotoKufiArabic'
                        ,fontSize: 13
                    ),
                  ),
                ),
              ),

              Row(children: [
                SizedBox(
                  height: 5,
                ),
                Row(children: [
                  SmallText(text: project.plan.publishData.substring(0,10), color: Colors.black),
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
            decoration:  BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              shape: BoxShape.circle,
              image: DecorationImage(
                image:AssetImage('assets/sfd.jpg') ,
                // NetworkImage(project.plan.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ]),);
}
Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
