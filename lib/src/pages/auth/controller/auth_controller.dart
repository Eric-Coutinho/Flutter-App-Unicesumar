import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 3),
    );
    isLoading.value = false;
  }

  Future<void> recoverPassword({required String email}) async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(seconds: 2),
    );
    isLoading.value = false;
  }
}
