import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoggedIn = false.obs;

  Future<void> login({required String email, required String password}) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    if (email == 'hortifruti@gmail.com' && password == '12345678') {
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
    isLoading.value = false;
  }

  Future<void> recoverPassword({required String email}) async {
    isLoading.value = true;
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    isLoading.value = false;
  }
}
