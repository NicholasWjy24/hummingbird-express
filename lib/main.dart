import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hummingbird_express/data/repositories/auth_repository.dart';
import 'package:hummingbird_express/data/services/auth_service.dart';
import 'package:hummingbird_express/ui/auth/viewmodel/auth_viewmodel.dart';
import 'package:hummingbird_express/ui/auth/widget/login_screen.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthViewModel(AuthRepository(AuthService())),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
