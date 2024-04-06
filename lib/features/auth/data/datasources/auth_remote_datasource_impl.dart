import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/errors.dart';
import 'datasources.dart';

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({required this.auth});

  @override
  Future<String> loginWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }
      // print(response.user!.uid);
      return response.user!.uid;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
