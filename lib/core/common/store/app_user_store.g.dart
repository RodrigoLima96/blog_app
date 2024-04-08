// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppUserStore on AppUserStoreBase, Store {
  late final _$userAtom = Atom(name: 'AppUserStoreBase.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$appUserStateAtom =
      Atom(name: 'AppUserStoreBase.appUserState', context: context);

  @override
  AppUserState get appUserState {
    _$appUserStateAtom.reportRead();
    return super.appUserState;
  }

  @override
  set appUserState(AppUserState value) {
    _$appUserStateAtom.reportWrite(value, super.appUserState, () {
      super.appUserState = value;
    });
  }

  late final _$AppUserStoreBaseActionController =
      ActionController(name: 'AppUserStoreBase', context: context);

  @override
  void updateUser({required UserEntity? userEntity}) {
    final _$actionInfo = _$AppUserStoreBaseActionController.startAction(
        name: 'AppUserStoreBase.updateUser');
    try {
      return super.updateUser(userEntity: userEntity);
    } finally {
      _$AppUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
appUserState: ${appUserState}
    ''';
  }
}
