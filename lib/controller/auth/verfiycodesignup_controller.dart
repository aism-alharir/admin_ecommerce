import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class VerFiyCodeSignUp_Controller extends GetxController {
  cheekCode();
  goToSuccessSignUp();
}

class VerFiyCodeSignUp_ControllerImp extends VerFiyCodeSignUp_Controller {
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoutes.successSignUp);
  }

  @override
  cheekCode() {}
}
