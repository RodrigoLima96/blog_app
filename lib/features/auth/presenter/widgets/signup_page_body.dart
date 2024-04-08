import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/core.dart';
import '../../auth.dart';
import 'widgets.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({
    super.key,
  });

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final authStore = Modular.get<AuthStore>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    AuthFieldWidget(
                        hintText: 'Name', controller: nameController),
                    const SizedBox(height: 15),
                    AuthFieldWidget(
                        hintText: 'Email', controller: emailController),
                    const SizedBox(height: 15),
                    AuthFieldWidget(
                        hintText: 'Password',
                        controller: passwordController,
                        obscureText: true),
                    const SizedBox(height: 40),
                    AuthButtonWidget(
                      buttonText: 'Sign Up',
                      press: () async {
                        if (formKey.currentState!.validate()) {
                          await authStore.signUpUser(
                            name: nameController.text,
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 60),
                    PageChangeText(
                      isLogin: false,
                      onTap: () {
                        Modular.to.navigate('/auth/login');
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
