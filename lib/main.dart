import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/view/widget/home/HomeBottom.dart';
import 'package:promotion/view/widget/home/custombottomappbarhome.dart';

// class PostHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }
Future<void> main() async {
  // HttpOverrides.global = new PostHttpOverrides();
  //
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeScreenControllerImp());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'الصندوق الاجتماعي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
