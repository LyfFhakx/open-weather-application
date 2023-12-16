import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef UserResponse = Either<(Exception,StackTrace), User>;

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserResponse> signINWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(credential.user!);
    } on FirebaseAuthException catch (e,stackTrace) {
      return Left((e,stackTrace));
    } on Exception catch (e,stackTrace){
      return Left((e,stackTrace));
    }
  }
}
