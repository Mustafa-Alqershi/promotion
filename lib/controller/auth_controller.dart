import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../http_client.dart';
import 'BaseController.dart';

class AuthController extends GetxController with BaseController {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  TextEditingController oldPasswordCon = TextEditingController();
  TextEditingController newPasswordCon = TextEditingController();
  String deviceId = '';
  bool isLoad = false;
  bool isPasswordHidden = true;
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }



  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      isLoad = true;
      showLoading();
      final email = emailCon.text;
      final password = passwordCon.text;
      final api = Api();
      print("deviceId");
      print(deviceId);
      var response = await api.post('login', {
        'email': email,
        'password': password,
        'my_device': deviceId,
      });
      // print(email);
      // print(password);
      // print(deviceId);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 400 || response.statusCode == 401) {
        closLoading();
        // showError('خطاء في اسم المستخدم او كلمة المرور ');
        isLoad = false;
      }

      if (response.statusCode == 200) {
        print(email);
        print(password);
        print(deviceId);
        var data = json.decode(response.body);
        var token = data['token'];
        var type = data['type'];
        var code = data['code'];
        var error = data['error'];
        if (code == 400) {
          closLoading();
          // showError(error);
        }
        print(type);
        GetStorage().write('type', type);
        GetStorage().write('login', true);
        GetStorage().write('token', token);
        if (type == 1) {
          // Get.offAll(HomeStudent2());
        }
        if (type == 2) {
          // Get.offAll(HomeTeacher());
        }
        if (type == 3) {
          // Get.offAll(HomeAdmin());
        }
      }
      isLoad = false;
    } catch (e) {
      Get.snackbar("error", 'errors');
    }
  }

  Future<void> changePassword() async {
    isLoad = true;
    showLoading();
    final api = Api();
    print('old password');
    print(oldPasswordCon.text);
    print('newPass password');
    print(newPasswordCon.text);
    var response = await api.post('auth/changePassword', {
      'oldPass': oldPasswordCon.text,
      'newPass': newPasswordCon.text,
    });
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var message = data['message'];
      var code = data['code'];
      if (code == 400) {
        closLoading();
        // showError(message);
      }
      if (code == 200) {
        closLoading();
        showSuccess("تم تغيير كلمة السر بنجاح ");
      }
      print('200');
    }
    isLoad = false;
    closLoading();
  }

  Future<void> register() async {
    isLoad = true;
    final email = emailCon.text;
    final password = passwordCon.text;
    final api = Api();
    var response = await api.post('api/register', {
      'email': email,
      'password': password,
      'my_device': deviceId,
    });
    isLoad = false;
    print(response.body);
    var token = json.decode(response.body);
  }

  Future<void> logout() async {
    isLoad = true;
    final api = Api();
    var response = await api.post('destroy', {
      'deviceId': deviceId,
    });
    isLoad = false;
    print(response.body);
    var data=  await GetStorage().erase();
    // print(data.toString());

    if (response.statusCode == 200) {}
    var token = json.decode(response.body);
  }
}
