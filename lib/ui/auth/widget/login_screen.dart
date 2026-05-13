import 'package:flutter/material.dart';
import 'package:hummingbird_express/ui/auth/widget/register_screen.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel =
    Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email :"),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password :"),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),),),
                      child: Text("Don't Have Account ?"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final error = authViewModel.validate(
                        emailController.text,
                        passwordController.text,
                      );

                      if (error != null) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Warning"),
                            content: Text(error),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                        return;
                      }

                      await authViewModel.login(
                        emailController.text,
                        passwordController.text,
                      );

                      if (!context.mounted) return;

                      if (authViewModel.errorMessage != null) {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Error"),
                            content: Text(
                              authViewModel.errorMessage!,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Success"),
                            content: const Text(
                              "Login success",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
