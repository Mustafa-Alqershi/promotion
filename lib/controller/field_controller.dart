import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../http_client.dart';
import '../model/fieldModel.dart';
import '../model/projectModel.dart';


class FieldController extends GetxController {
  late List<Field> _fields = [];
  List<Field> get fields => _fields;
  int index = 0;
  int id = 0;
  @override
  void onInit() {
    super.onInit();
    getField();
  }

  final TextEditingController nameController = TextEditingController();

  void getField() async {
    print('get Fields');
    final api = Api();
    final request = await api.get("field");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        var decodeResponse = jsonDecode(utf8.decode(request.bodyBytes)) as Map;
        decodeResponse['data']
            .forEach((col) => _fields.add(Field.fromJson(col)));
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
  }
  void getFieldBySector(int sectorId) async {
    print('get Fields');
    final api = Api();
    final request = await api.get("field/sector/$sectorId");
    print(request.body);
    if (request.statusCode == 200) {
      try {
        var decodeResponse = jsonDecode(utf8.decode(request.bodyBytes)) as Map;
        decodeResponse['data']
            .forEach((col) => _fields.add(Field.fromJson(col)));
        update();
      } catch (e, s) {
        print(s);
      }
    } else {}
  }

}
