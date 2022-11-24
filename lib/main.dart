import 'package:flutter/material.dart';
import 'package:test_goers_app/ui/pages/home/home_page.dart';
import 'package:test_goers_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starwar Goers Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      onGenerateRoute: mainRoutes,
    );
  }
}
