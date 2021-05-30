import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // FirebaseUser firebaseUser;
  // Map<String, dynamic> userData = Map();

  bool isLoading = false;

  void signUp() {}

  void signIn() async {
    isLoading = true;
    notifyListeners();

    await Future<Duration>.delayed(const Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }

  void recoverPass() {}

  bool isLoggedIn() {
    return false;
  }
}
