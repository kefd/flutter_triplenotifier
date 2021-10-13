import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:triple_example/data/provider/authentication_provider.dart';
import 'package:triple_example/data/repository/authentication_repository.dart';
import 'package:triple_example/model/user_model.dart';
import 'package:triple_example/store/valuenotifier_store.dart';

class AuthenticationValueNotifierController with Store<bool, AuthException> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationValueNotifierController(
      [AuthenticationRepository? authenticationRepository])
      : _authenticationRepository =
            authenticationRepository ?? AuthenticationRepository() {
    isLogged();
    state = ValueNotifier<bool>(false);
  }

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  GetStorage box = GetStorage('login_firebase');
  ValueNotifier<bool> passwordVisibility = ValueNotifier<bool>(false);

  /*
  @override
  void onReady() {
    isLogged();
    super.onReady();
  }*/

  void isLogged() {
    if (box.hasData("auth")) {
      UserModel user = UserModel(
          id: box.read("auth")["id"],
          email: box.read("auth")["email"],
          name: box.read("auth")["name"],
          urlimage: box.read("auth")["urlimage"]);
      //Get.offAllNamed(Routes.HOME, arguments: user);
      QR.navigator.replaceAll('/initial');
    }
  }

  Future<void> register() async {
    exec(() async {
      //Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      UserModel? user =
          await _authenticationRepository.createUserWithEmailAndPassword(
              emailTextController.text,
              passwordTextController.text,
              nameTextController.text);

      if (user != null) {
        box.write("auth", user);
        //Get.offAllNamed(Routes.HOME, arguments: user);
        QR.navigator.replaceAll('/initial');
      }
    });
  }

  Future<void> login() async {
    exec(() async {
      //Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
      UserModel? user =
          await _authenticationRepository.signInWithEmailAndPassword(
              emailTextController.text, passwordTextController.text);

      if (user != null) {
        box.write("auth", user);
        //Get.offAllNamed(Routes.HOME, arguments: user);
        QR.navigator.replaceAll('/initial');
      }
    });
  }

  void logout() {
    _authenticationRepository.signOut();
    //Get.offAllNamed(Routes.LOGIN);
    QR.navigator.replaceAll('/login');
  }
}
