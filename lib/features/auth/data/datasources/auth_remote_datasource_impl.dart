import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/errors.dart';
import '../data.dart';

class AuthRemoteDataSourceImpl implements IAuthRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  AuthRemoteDataSourceImpl({required this.auth, required this.firestore});

  @override
  Future<UserModel> loginWithEmailAndPassword(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(email: email, password: password);

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }
      await createUserOnDatabase(uid: response.user!.uid, name: name, email: email);

      UserModel userModel = UserModel.fromData(id: response.user!.uid, name: name, email: email);

      return userModel;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  Future<void> createUserOnDatabase({
    required String uid,
    required String name,
    required String email,
  }) async {
    try {
      await firestore.collection('users').doc(uid).set({
        "id": uid,
        "name": name,
        "email": email,
      });
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}