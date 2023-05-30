import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServices extends GetxService {
  
  late GetStorage sharedPreferences;

  Future<MyServices> init() async {
    // sharedPreferences = await GetStorage().initStorage;
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
