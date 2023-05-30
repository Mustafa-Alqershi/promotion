import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promotion/view/widget/home/HomeBottom.dart';
import 'package:promotion/view/widget/home/custombottomappbarhome.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'dependincies.dart'as dep;

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
  await dep.init();
  Get.put(HomeScreenControllerImp());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      title: 'الصندوق الاجتماعي',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      translations: MyTranslation(),

      // locale: controller.language,
      locale: controller.language,
      theme: controller.appTheme,
      // initialBinding: InitialBindings(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
