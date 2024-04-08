import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../auth.dart';
import 'widgets.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final authStore = Modular.get<AuthStore>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Observer(
        builder: (_) {
          if (authStore.authState == AuthState.loading) {
            return const LoaderWidget();
          }
          reaction((_) => authStore.authState, (AuthState state) {
            if (state == AuthState.success) {
              Modular.to.navigate('/blogs/');
            }
          });
          reaction((_) => authStore.authState, (AuthState state) {
            if (state == AuthState.failure) {
              showCustomSnackbar(context, authStore.authFailureMessage);
            }
          });
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    AuthFieldWidget(
                        hintText: 'Email', controller: emailController),
                    const SizedBox(height: 15),
                    AuthFieldWidget(
                      hintText: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 40),
                    AuthButtonWidget(
                      buttonText: 'Sign In',
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          await authStore.loginUser(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    PageChangeText(
                      isLogin: true,
                      onTap: () {
                        Modular.to.pushNamed('/auth/sign-up');
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
