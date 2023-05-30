import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../http_client.dart';
import '../model/projectModel.dart';


class ProjectController extends GetxController {
  late  ProjectModel projects =   ProjectModel.empty();
  int index = 0;
  bool isLoading = true;
  int id = 0;

  @override
  void onInit() {
    super.onInit();
    getProject();
  }
  final TextEditingController nameController = TextEditingController();
  void getProject() async {
    isLoading=true;
    print('get getProject');
    final api = Api();
    final request = await api.get("project");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        print(request.body);
        var data = json.decode(request.body);
        // await GetStorage().write('student', data);
        // print('get student with subjects');
        print(request.body);
        projects = ProjectModel.fromJson(data);
        isLoading = false;
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
  }
  void getProjectsBySector(int sectorId) async {
    isLoading=true;
    print('get getProjectsBySector');
    final api = Api();
    final request = await api.get("project/sector/$sectorId");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        print(request.body);
        var data = json.decode(request.body);
        // await GetStorage().write('student', data);
        print('get getProjectsBySector ');
        print(request.body);
        projects = ProjectModel.fromJson(data);
        isLoading = false;
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
  }




}
