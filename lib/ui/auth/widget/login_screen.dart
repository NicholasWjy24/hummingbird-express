import 'package:flutter/material.dart';
import 'package:hummingbird_express/ui/auth/widget/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      Text("Username :"),
                      TextField(
                        controller: usernameTextEditingController,
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
                        controller: passwordTextEditingController,
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
                      onPressed: ()  {
                        if(usernameTextEditingController.text.trim().isEmpty || passwordTextEditingController.text.trim().isEmpty){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Warning'),
                                content: const Text('Please Input Username and Password'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                          );
                          return;
                        }
                      },
                      child: Text("Login"),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
