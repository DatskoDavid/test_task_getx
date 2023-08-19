import 'package:get/get.dart';
import 'package:tesk_task_getx/domain/controllers/home_screen_controller.dart';

class Injector {
  void initInjector() {
    _initControllers();
  }

  void _initControllers() {
    Get.put(HomeScreenController());
  }
}
