import 'package:escon_v2/app/modules/home/controllers/add_room_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddRoomController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
