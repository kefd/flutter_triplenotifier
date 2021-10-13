import 'package:triple_example/data/provider/authentication_provider.dart';
import 'package:triple_example/model/user_model.dart';

class AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;

  AuthenticationRepository([AuthenticationProvider? authenticationProvider])
      : _authenticationProvider =
            authenticationProvider ?? AuthenticationProvider();

  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, String name) {
    return _authenticationProvider.createUserWithEmailAndPassword(
        email, password, name);
  }

  Future<UserModel?> signInWithEmailAndPassword(String email, String password) {
    return _authenticationProvider.signInWithEmailAndPassword(email, password);
  }

  Stream<UserModel?> get onAuthStateChanged =>
      _authenticationProvider.onAuthStateChanged;

  void signOut() {
    _authenticationProvider.signOut();
  }
}
