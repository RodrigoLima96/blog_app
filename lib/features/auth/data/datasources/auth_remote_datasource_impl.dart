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
      {required String email, required String password}) async {
    await getCurrentUserData();

    try {
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }

      UserModel userModel = UserModel.fromData(
        id: response.user!.uid,
        name: response.user!.displayName!,
        email: response.user!.email!,
      );
      return userModel;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (response.user == null) {
        throw ServerException(message: 'User is null!');
      }
      await response.user!.updateDisplayName(name);

      UserModel userModel =
          UserModel.fromData(id: response.user!.uid, name: name, email: email);

      return userModel;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (auth.currentUser != null) {
        UserModel userModel = UserModel.fromData(
          id: auth.currentUser!.uid,
          name: auth.currentUser!.displayName!,
          email: auth.currentUser!.email!,
        );
        return userModel;
      }
      return null;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> createUserOnDatabase({
    required String id,
    required String name,
    required String email,
  }) async {
    try {
      await firestore.collection('users').doc(id).set({
        "id": id,
        "name": name,
        "email": email,
      });
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}