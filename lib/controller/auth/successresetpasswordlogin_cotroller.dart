import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class SuccessResetPasswordLoginController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordLoginControllerImp
    extends SuccessResetPasswordLoginController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
