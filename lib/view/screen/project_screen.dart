import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/controller/project_controller.dart';

import '../../model/projectModel.dart';
import '../../widgets/text/medium_text.dart';
import '../../widgets/text/small_text.dart';
class ProjectScreen extends StatelessWidget {
  String sector='';
   ProjectScreen({Key? key,required this.sector}) : super(key: key);
   ProjectController projectController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sector),
      ),
      body:  GetBuilder<ProjectController>(builder: (controller) {
        if(controller.isLoading==true){
          return Center(child: CircularProgressIndicator(),);
        }else {
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
                MediumText(text: 'شهر',color: Colors.black,),
                SizedBox(width: 10,),
                MediumText(text: project.plan.timePeriod,color: Colors.black,),
                SizedBox(width: 10,),
                MediumText(text: 'الفترة',color: Colors.black,),
              ],
            ),
            Row(
              children: [
                MediumText(text: project.plan.theFinancialCost.toString(),color: Colors.black,),
                SizedBox(width: 10,),
                MediumText(text: 'التكلفة',color: Colors.black,),
              ],
            ),

          ],
        ),
        // MediumText(text: project.sector.name,color: Colors.black,),
        const Spacer(),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MediumText(text: project.name,color: Colors.black,),
            // MediumText(text: project.sector.name,color: Colors.black,),
            MediumText(text: project.area.name,color: Colors.black,),

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
                // SmallText(text: '2.57 ', color: Colors.black),
                SizedBox(
                  width: 5,
                ),
                // SmallText(text: '4.5', color: Colors.black),
                SizedBox(
                  width: 5,
                ),
                // const Icon(
                //   Icons.star,
                //   color: Colors.yellow,
                //   size: 18,
                // ),
              ]),
              SizedBox(
                width: 0,
              ),
            ]),
            const SizedBox(
              height: 5,
            ),
        //     Row(
        //       children: [
        //         Container(
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 5, vertical: 5),
        //             decoration: BoxDecoration(
        //               color: Colors.indigo.withOpacity(0.5),
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             // child: SmallText(
        //             //     text: 'يبدء العمل في 10 ص ', color: Colors.white)),
        //       ],
        //     ),
        //   ],
        // ),
        // IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border)),

        // const SizedBox(width: 10,),
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
