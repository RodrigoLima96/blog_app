import 'package:mobx/mobx.dart';

import '../../core.dart';

part 'app_user_store.g.dart';

class AppUserStore = AppUserStoreBase with _$AppUserStore;

enum AppUserState { appUserInitial, appUserLoggedIn }

abstract class AppUserStoreBase with Store {
  @observable
  UserEntity? user;

  @observable
  AppUserState appUserState = AppUserState.appUserInitial;

  @action
  void updateUser({required UserEntity? userEntity}) {
    if (userEntity == null) {
      appUserState = AppUserState.appUserInitial;
    } else {
      user = userEntity;
      appUserState = AppUserState.appUserLoggedIn;
    }
  }
}
