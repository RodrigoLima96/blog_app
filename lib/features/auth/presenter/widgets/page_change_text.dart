import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class PageChangeText extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onTap;
  const PageChangeText({super.key, required this.isLogin, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: isLogin ? 'Don\'t have an account? ' : 'Already have an account? ',
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: isLogin ? 'Sign Up' : 'Sign In',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppPallete.gradient2,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
