
import 'package:get/get.dart';
import 'Controller/auth_controller.dart';
import 'controller/field_controller.dart';
import 'controller/project_controller.dart';
import 'controller/sector_controller.dart';
Future<void> init() async {
  Get.lazyPut(() => SectorController(), fenix: true);
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ProjectController(), fenix: true);
  Get.lazyPut(() => FieldController(), fenix: true);
}
