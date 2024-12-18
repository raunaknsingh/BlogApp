import 'package:blog_app/core/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/screens/signup_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SigninPage(),
      );

  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final globalFormKey = GlobalKey<FormState>();

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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscured: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthGradientButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                    }
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        SignupPage.route(),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppPallete.gradient2,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
