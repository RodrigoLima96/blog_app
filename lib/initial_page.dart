import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';
import 'features/auth/auth.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final authStore = Modular.get<AuthStore>();
  final appUserStore = Modular.get<AppUserStore>();

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  void _checkCurrentUser() async {
    await authStore.checkCurrentUserLoggedIn();

    if (appUserStore.user != null) {
      Modular.to.navigate('/blogs/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (appUserStore.user == null) {
          return const LoginPage();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
