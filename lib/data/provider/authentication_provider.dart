import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:triple_example/model/user_model.dart';

class AuthException implements Exception {
  String title;
  String content;
  AuthException({required this.title, required this.content});
}

class AuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');

  // Retorna usuário logado
  Stream<UserModel?> get onAuthStateChanged => _firebaseAuth
      .authStateChanges()
      .map((User? currentUser) => UserModel.fromSnapshot(currentUser));

  // Criar usuário
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final User? currentUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(email: email, password: password))
          .user!
        ..updateDisplayName(name)
        ..reload();

      // Atualizando o nome do usuário
      //await currentUser?.updateDisplayName(name);
      //await currentUser?.updatePhotoURL(photoURL);
      //await currentUser?.reload();

      return UserModel.fromSnapshot(currentUser);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "operation-not-allowed":
          throw AuthException(
              title: "ERROR", content: "Contas anônimas não estão habilitadas");
        //break;
        case "weak-password":
          throw AuthException(
              title: "ERROR", content: "Sua senha é muito fraca");
        //break;
        case "invalid-email":
          throw AuthException(title: "ERROR", content: "Seu email é inválido");
        //break;
        case "email-already-in-use":
          throw AuthException(
              title: "ERROR",
              content: "O e-mail já está em uso em outra conta");
        //break;
        case "invalid-credential":
          throw AuthException(title: "ERROR", content: "Seu email é inválido");
        //break;
        default:
          throw AuthException(
              title: "ERROR", content: "Ocorreu um erro indefinido.");
      }
    }
  }

  // Fazer Login
  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return UserModel.fromSnapshot(currentUser);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      switch (e.code) {
        case "user-not-found":
          throw AuthException(
              title: "ERROR", content: "Usuário não encontrado.");
        //break;
        case "wrong-password":
          throw AuthException(
              title: "ERROR", content: "Senha não confere com o cadastrado.");
        //break;
        case "user-disabled":
          throw AuthException(
              title: "ERROR", content: "Este usuário foi desativado.");
        //break;
        case "too-many-requests":
          throw AuthException(
              title: "ERROR",
              content: "Muitos solicitações. Tente novamente mais tarde.");
        //break;
        case "operation-not-allowed":
          throw AuthException(
              title: "ERROR",
              content: "Este login com e-mail e senha não foi permitida.");
        //break;
        default:
          throw AuthException(title: "ERROR", content: "$e");
        //break;
      }
    }
  }

  // Fazer Logoff
  Future<void> signOut() async {
    box.write("auth", null);
    box.erase();
    await _firebaseAuth.signOut();
  }
}
