
import '../../../../core/core.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  static UserModel fromData({
    required String id,
    required String name,
    required String email,
  }) {
    return UserModel(id: id, name: name, email: email);
  }
}
