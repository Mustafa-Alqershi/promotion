import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../http_client.dart';
import '../model/area_with_child.dart';
import '../model/local_with_child.dart';
import '../model/projectModel.dart';

class AreaController extends GetxController {
  // late List<Area> _Areas = [];
  // List<Area> get Areas => _Areas;
  AreaWithChild area = AreaWithChild.empty();

  int index = 0;
  String query = '';
  int id = 0;
  bool isLoad = true;
  bool noData = false;

  @override
  void onInit() {
    super.onInit();
    // getArea();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  void getAreaById(int areaId) async {
    isLoad = true;
    noData==false;

    print('get Areas id');
    print('get Areas $areaId');
    final api = Api();
    final request = await api.get("local/area/$areaId");
    print("Area id request");
    print(request.body);
    var data=jsonDecode(request.body);
    print("request.body==============");
    print(request.body);
    if(data['code']=="300"){
      print("request.body==============null");
      print(request.body);
      noData==true;
    }
    if (request.statusCode == 200) {
      try {
        var data = json.decode(request.body);
        area = AreaWithChild.fromJson(data);
        update();
        isLoad = false;

        noData == true;
      } catch (e, s) {
        noData = true;
        print(s);
        isLoad = false;
      }
    } else {
      isLoad = false;
      noData = true;

      update();
    }
    update();
  }

  void search() async {
    isLoad = true;
    query = searchController.text.toString();
    update();
    print('search Area');
    final api = Api();
    print(query);
    final request = await api.get("Area/search/$query");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
    isLoad = false;
    update();
  }
}
