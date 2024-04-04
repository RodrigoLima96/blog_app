import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({
    super.key,
  });

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
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
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                AuthFieldWidget(hintText: 'Email', controller: emailController),
                const SizedBox(height: 15),
                AuthFieldWidget(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                const AuthButtonWidget(
                  buttonText: 'Sign In',
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
      ),
    );
  }
}
