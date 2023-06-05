import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/localization/changelocal.dart';
import 'ChengPasswoed.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}


class _SettingsState extends State<Settings> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'NotoKufiArabic',
          ),
        ),
        centerTitle: true,
        titleSpacing: NavigationToolbar.kMiddleSpacing,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 80.0),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              width: 2, color: Colors.blue.shade900),
                          color: Colors.blue.shade900,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20,
                              offset: Offset(5, 5),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.manage_accounts,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'اعدادات الحساب',
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'NotoKufiArabic',
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 100),
                              InkWell(
                                onTap: (){
                                  var lang=GetStorage().read('lang');
                                  if(lang=='ar'){
                                    Get.find<LocaleController>().changeLang('en');
                                  }else{
                                    Get.find<LocaleController>().changeLang('ar');
                                  }


                                },
                                child: Text(
                                  '47'.tr,
                                  style: TextStyle(
                                    fontFamily: 'NotoKufiArabic',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChengPasswoed(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              SizedBox(width: 120),
                              Text(
                               '19'.tr,
                                style: TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          // await authController.logout();
                          // Get.offAll(LoginPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              SizedBox(width: 100),
                              Text(
                                '48'.tr,
                                style: TextStyle(
                                  fontFamily: 'NotoKufiArabic',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
