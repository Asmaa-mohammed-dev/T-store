import 'package:get/get.dart';
import 'package:t_store/common/loaders/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
