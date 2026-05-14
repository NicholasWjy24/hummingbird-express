import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsetsGeometry.all(8),
          child: SingleChildScrollView(
            child: Center(
              child: Text("Home Screen"),
            ),
          ),
        ),
      ),
    );
  }
}
