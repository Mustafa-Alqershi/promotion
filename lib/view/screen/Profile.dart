import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // final StudentController studentController = Get.find();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [

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

                        color: Colors.grey.shade500,
                        boxShadow: const [

                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Text(

                          "اسم المستخدم",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'NotoKufiArabic',
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Container(
                              alignment: Alignment.topRight,
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      ...ListTile.divideTiles(
                                        color: Colors.grey,
                                        tiles: [
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 0),
                                            leading: Icon(Icons.numbers_sharp,
                                                color: Colors.blue.shade900),
                                            title: const Text(
                                              "البريد الالكتروني",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'NotoKufiArabic',
                                              ),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            subtitle: Text(

                                                  "user@gmail.com",
                                              style: TextStyle(
                                                fontFamily: 'NotoKufiArabic',
                                                fontSize: 15,
                                                color: Colors.blue.shade900,
                                              ),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.home_work,
                                                color: Colors.blue.shade900),
                                            title: const Text(
                                              "رقم الهاتف",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'NotoKufiArabic',
                                              ),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            subtitle: Text(

                                                  "77777777",
                                              style: TextStyle(
                                                fontFamily: 'NotoKufiArabic',
                                                fontSize: 15,
                                                color: Colors.blue.shade900,
                                              ),
                                              textDirection: TextDirection.rtl,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
