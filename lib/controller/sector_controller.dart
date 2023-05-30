import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../http_client.dart';
import '../model/projectModel.dart';


class SectorController extends GetxController {
  late List<Sector> _sectors = [];
  List<Sector> get sectors => _sectors;
  int index = 0;
  String query='';
  int id = 0;
  bool isLoad=true;

  @override
  void onInit() {
    super.onInit();
    getSector();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  void getSector() async {
    isLoad=true;
    print('get sectors');
    final api = Api();
    final request = await api.get("sector");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        _sectors.clear();
        var decodeResponse = jsonDecode(utf8.decode(request.bodyBytes)) as Map;
        decodeResponse['data']
            .forEach((col) => _sectors.add(Sector.fromJson(col)));
        update();
        isLoad=false;
      } catch (e, s) {
        print(s);
      }
    } else {
      isLoad=false;
      update();
    }
    update();

  }


  void deleteSector() async {
    print('delete');
    print(id);
    print(index);
    final api = Api();
    final request = await api.delete("Sectors/$id");
    if (request.statusCode == 200) {
      print(request.body.toString());
      Sector re = _sectors.where((element) => element.id == id).first;
      _sectors.remove(re);
    } else {
      print(request.reasonPhrase);
    }
    update();
  }
  void search() async {
    isLoad = true;
    query=searchController.text.toString();
    update();
    print('search sector');
    final api = Api();
    print(query);
    final request = await api.get("sector/search/$query");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        _sectors.clear();
        var decodeResponse = jsonDecode(utf8.decode(request.bodyBytes)) as Map;
        decodeResponse['data']
            .forEach((col) => _sectors.add(Sector.fromJson(col)));
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
    isLoad = false;
    update();
  }

  void updateSector() async {
    print('update');
    print(id);
    final api = Api();
    final request =
    await api.put("Sectors/$id", {"SectorName": nameController.text});
    if (request.statusCode == 200) {
      _sectors.where((element) => element.id == id).first.name =
          nameController.text;
      update();
    } else {
      print('error');
      print(request);
      print(request.reasonPhrase);
    }
  }
}
