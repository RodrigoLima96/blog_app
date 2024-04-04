import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({
    super.key,
  });

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
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
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                AuthFieldWidget(hintText: 'Name', controller: nameController),
                const SizedBox(height: 15),
                AuthFieldWidget(hintText: 'Email', controller: emailController),
                const SizedBox(height: 15),
                AuthFieldWidget(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true),
                const SizedBox(height: 40),
                const AuthButtonWidget(buttonText: 'Sign Up'),
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
      ),
    );
  }
}
