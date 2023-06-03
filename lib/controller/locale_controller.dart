import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../http_client.dart';
import '../model/local_with_child.dart';
import '../model/projectModel.dart';

class LocalController extends GetxController {
  late List<Locale> _Locales = [];
  List<Locale> get Locales => _Locales;
  LocalWithChild locale= LocalWithChild.empty();

  int index = 0;
  String query='';
  int id = 0;
  bool isLoad=true;

  @override
  void onInit() {
    super.onInit();
    // getLocale();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  void getLocaleByArea(int areaId) async {
    isLoad=true;
    print('get Locales by area');
    final api = Api();
    final request = await api.get("local/area/$areaId");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        var data = json.decode(request.body);
locale=LocalWithChild.fromJson(data);
        // _Locales.clear();
        // var decodeResponse = jsonDecode(utf8.decode(request.bodyBytes)) as Map;
        // decodeResponse['data']
        //     .forEach((col) => _Locales.add(Locale.fromJson(col)));
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


  void search() async {
    isLoad = true;
    query=searchController.text.toString();
    update();
    print('search Locale');
    final api = Api();
    print(query);
    final request = await api.get("Locale/search/$query");
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
